<?php

/*
	copyright   : (C) 2004 Bernhard Wymann
	email       : berniw@bluewin.ch
	version     : $Id$

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.
*/

	session_start();
	$path_to_root = '../';
	require_once($path_to_root . 'secrets/configuration.php');
	require_once($path_to_root . 'lib/functions.php');
	require_once($path_to_root . 'lib/classes.php');
	require_once($path_to_root . 'lib/template.inc');

	if (!isset($_SESSION['uid']) ) {
		session_defaults();
	}

	$db = mysql_connect($db_host, $db_user, $db_passwd) or die;
	mysql_select_db($db_name, $db) or die;
	$user_tablename = $db_prefix . TBL_USERS;
	$forum_tablename = $db_prefix . TBL_FORUM;
	$topic_tablename = $db_prefix . TBL_FORUM_TOPICDATA;
	$stats_hitcount_tablename = $db_prefix . TBL_HITCOUNT;
	$stats_sessioncount_tablename = $db_prefix . TBL_SESSIONCOUNT;
	$stats_tablename = $db_prefix . TBL_STATS;
	$loginlog_tablename = $db_prefix . TBL_LOGIN_LOG;
	$poll_tablename = $db_prefix . TBL_POLL;

	countSession(session_id(), $stats_sessioncount_tablename, $stats_tablename);
	countHit($_SERVER['PHP_SELF'], $stats_hitcount_tablename);

	// The creation checks the login.
	$user = new User($db, $user_tablename, $loginlog_tablename);

	// Login?
	checkLogin($user);
	// Logout?
	checkLogout();

	if ($_SESSION['logged'] == TRUE) {
		// Login template for statusbar.
		$page_statusbar = 'page_statusbar_logged_in.ihtml';
		$page_content = 'forum_message_write.ihtml';
	} else {
		// Status view template for statusbar.
		$page_statusbar = 'page_statusbar.ihtml';
		$page_content = 'common_login_required.ihtml';
	}

	// Create template instance for page layout.
	$page = new Template($path_to_root . 'templates', 'keep');

	// Define template file(s).
	$page->set_file(array(
		'page'				=> 'page.ihtml',
		'PAGE_BEGIN_T'		=> 'page_begin.ihtml',
		'PAGE_TITLEBAR_T'	=> 'page_titlebar.ihtml',
		'PAGE_STATUSBAR_T'	=> $page_statusbar,
		'PAGE_NAVIGATION_T'	=> 'page_navigation.ihtml',
		'PAGE_CONTENT_T'	=> $page_content,
		'PAGE_FOOTER_T'		=> 'page_footer.ihtml',
		'PAGE_END_T'		=> 'page_end.ihtml'
	));

	// Set up page header.
	$page->set_var(array(
		'PB_PAGETITLE'		=> 'The TORCS Racing Board, write into the Forum',
		'PB_DESCRIPTION'	=> 'Write into The TORCS Racing Board forum',
		'PB_AUTHOR'			=> 'Bernhard Wymann',
		'PB_KEYWORDS'		=> 'TORCS, racing, berniw, Bernhard, Wymann, Championship, World, write, edit, post, forum, discuss',
		'ROOTPATH'			=> $path_to_root,
	));

	if ($_SESSION['logged'] == TRUE) {
		// Variables if logged in.
		$page->set_var(array(
			'PS_USERNAME'		=> $_SESSION['username'],
			'PS_ACCOUNT_TYPE'	=> $_SESSION['usergroup'],
			'PS_IPADSRESS'		=> $_SERVER['REMOTE_ADDR'],
			'PS_LOGOUTPAGE'		=> $path_to_root . 'index.php'
		));

		if (!isset($_GET['id_thread'])) {
			$id_thread = "";
		} else {
			$id_thread = intval(removeMagicQuotes($_GET['id_thread']));
		}

		if (!isset($_GET['id_parent'])) {
			$id_parent = "";
		} else {
			$id_parent = intval(removeMagicQuotes($_GET['id_parent']));
		}

		// Parent message data.
		$subject = "";
		$page->set_block('PAGE_CONTENT_T', 'parent_message', 'pmsg');
		if (isset($_GET['id_thread']) && isset($_GET['id_parent'])) {
			// Look up parent message in db.
			$sql = "SELECT text,subject FROM " . $forum_tablename . " WHERE " .
				   "id=" . quoteString($id_parent) . " AND " .
				   "id_thread=" . quoteString($id_thread);
			$result = mysql_query($sql);
			if ($myrow = mysql_fetch_array($result)) {
				$page->set_var(array(
					'PC_PARENT_MESSAGE'	=> htmlentities($myrow['text'])
				));
				$page->parse('pmsg', 'parent_message');

				if ($id_thread != "" && ($id_parent == $id_thread)) {
					$subject = "Re: " . htmlentities($myrow['subject']);
				} else {
					$subject = htmlentities($myrow['subject']);
				}
			} else {
				$page->set_var('pmsg', "");
			}
		} else {
			$page->set_var('pmsg', "");
		}

		// Connection to poll.
		$page->set_block('PAGE_CONTENT_T', 'message_poll', 'msg_poll');
		$page->set_block('message_poll', 'message_poll_options', 'msg_poll_opt');
		if ($_SESSION['usergroup'] == 'admin' && !isset($_GET['id_thread']) && !isset($_GET['id_parent'])) {
			$sql = "SELECT pollid,question FROM " . $poll_tablename . " ORDER BY pollid DESC";
			$result = mysql_query($sql);
			if (mysql_num_rows($result) > 0) {
				while ($myrow = mysql_fetch_array($result)) {
					$page->set_var(array(
						'PC_POLL_ID'		=> $myrow['pollid'],
						'PC_POLL_QUESTION'	=> htmlentities($myrow['question'])
					));
					$page->parse('msg_poll_opt', 'message_poll_options', TRUE);
				}
				$page->parse('msg_poll', 'message_poll');
			} else {
				$page->set_var('msg_poll', "");
			}
		} else {
			$page->set_var('msg_poll', "");
		}


		$page->set_var(array(
			'PC_SUBJECT'			=> $subject,
			'PC_ID_THREAD'			=> $id_thread,
			'PC_ID_PARENT'			=> $id_parent,
			'PC_FORUM_WRITE'		=> './showthread.php'
		));

	} else {
		// Variables if NOT logged in.
		$page->set_var(array(
			'PS_PASSWORD_SIZE'	=> MAX_USERNAME_LENGTH,
			'PS_USERNAME_SIZE'	=> MAX_USERNAME_LENGTH,
			'PS_LOGINPAGE'		=> $path_to_root . 'index.php',
			'PS_HOSTNAME'		=> SERVER_NAME
		));
	}

	require_once($path_to_root . 'lib/functions_navigation.php');
	setupNavigationAndFooter($page, $stats_tablename, $stats_hitcount_tablename);

	$page->parse('PAGE_BEGIN', 'PAGE_BEGIN_T');
	$page->parse('PAGE_TITLEBAR', 'PAGE_TITLEBAR_T');
	$page->parse('PAGE_STATUSBAR', 'PAGE_STATUSBAR_T');
	$page->parse('PAGE_NAVIGATION', 'PAGE_NAVIGATION_T');
	$page->parse('PAGE_CONTENT', 'PAGE_CONTENT_T');
	$page->parse('PAGE_FOOTER', 'PAGE_FOOTER_T');
	$page->parse('PAGE_END', 'PAGE_END_T');

	$page->parse('OUTPUT', array(
		'PAGE_BEGIN',
		'PAGE_TITLEBAR',
		'PAGE_NAVIGATION',
		'PAGE_STATUSBAR',
		'PAGE_CONTENT',
		'PAGE_FOOTER',
		'PAGE_END',
		'page'
	));

	$page->p('OUTPUT');

?>
