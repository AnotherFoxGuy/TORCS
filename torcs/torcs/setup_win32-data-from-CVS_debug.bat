@echo off


if not exist .\data\cars\categories\free goto data_cars_categories_free
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\free\free.xml copy .\data\cars\categories\free\free.xml .\runtimed\categories\free.xml
:data_cars_categories_free

if not exist .\data\cars\categories\Offroad-4WD-GrA goto data_cars_categories_Offroad_4WD_GrA
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Offroad-4WD-GrA\Offroad-4WD-GrA.xml copy .\data\cars\categories\Offroad-4WD-GrA\Offroad-4WD-GrA.xml .\runtimed\categories\Offroad-4WD-GrA.xml
:data_cars_categories_Offroad_4WD_GrA

if not exist .\data\cars\categories\Offroad-RWD-GrA goto data_cars_categories_Offroad_RWD_GrA
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Offroad-RWD-GrA\Offroad-RWD-GrA.xml copy .\data\cars\categories\Offroad-RWD-GrA\Offroad-RWD-GrA.xml .\runtimed\categories\Offroad-RWD-GrA.xml
:data_cars_categories_Offroad_RWD_GrA

if not exist .\data\cars\categories\Track-4WD-GrB goto data_cars_categories_Track_4WD_GrB
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Track-4WD-GrB\Track-4WD-GrB.xml copy .\data\cars\categories\Track-4WD-GrB\Track-4WD-GrB.xml .\runtimed\categories\Track-4WD-GrB.xml
:data_cars_categories_Track_4WD_GrB

if not exist .\data\cars\categories\Track-FWD-GrA goto data_cars_categories_Track_FWD_GrA
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Track-FWD-GrA\Track-FWD-GrA.xml copy .\data\cars\categories\Track-FWD-GrA\Track-FWD-GrA.xml .\runtimed\categories\Track-FWD-GrA.xml
:data_cars_categories_Track_FWD_GrA

if not exist .\data\cars\categories\Track-FWD-GrB goto data_cars_categories_Track_FWD_GrB
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Track-FWD-GrB\Track-FWD-GrB.xml copy .\data\cars\categories\Track-FWD-GrB\Track-FWD-GrB.xml .\runtimed\categories\Track-FWD-GrB.xml
:data_cars_categories_Track_FWD_GrB

if not exist .\data\cars\categories\Track-RWD-GrA goto data_cars_categories_Track_RWD_GrA
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Track-RWD-GrA\Track-RWD-GrA.xml copy .\data\cars\categories\Track-RWD-GrA\Track-RWD-GrA.xml .\runtimed\categories\Track-RWD-GrA.xml
:data_cars_categories_Track_RWD_GrA

if not exist .\data\cars\categories\Track-RWD-GrB goto data_cars_categories_Track_RWD_GrB
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Track-RWD-GrB\Track-RWD-GrB.xml copy .\data\cars\categories\Track-RWD-GrB\Track-RWD-GrB.xml .\runtimed\categories\Track-RWD-GrB.xml
:data_cars_categories_Track_RWD_GrB

if not exist .\data\cars\categories\Track-RWD-GrC goto data_cars_categories_Track_RWD_GrC
call .\create_dir .\runtimed
call .\create_dir .\runtimed\categories
if exist .\data\cars\categories\Track-RWD-GrC\Track-RWD-GrC.xml copy .\data\cars\categories\Track-RWD-GrC\Track-RWD-GrC.xml .\runtimed\categories\Track-RWD-GrC.xml
:data_cars_categories_Track_RWD_GrC

if not exist .\data\cars\models\155-DTM goto data_cars_models_155_DTM
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\155-DTM
if exist .\data\cars\models\155-DTM\155-DTM.xml copy .\data\cars\models\155-DTM\155-DTM.xml .\runtimed\cars\155-DTM\155-DTM.xml
if exist .\data\cars\models\155-DTM\texmapper.xml copy .\data\cars\models\155-DTM\texmapper.xml .\runtimed\cars\155-DTM\texmapper.xml
if exist .\data\cars\models\155-DTM\155-DTM-1024.rgb copy .\data\cars\models\155-DTM\155-DTM-1024.rgb .\runtimed\cars\155-DTM\155-DTM-1024.rgb
if exist .\data\cars\models\155-DTM\155-DTM.rgb copy .\data\cars\models\155-DTM\155-DTM.rgb .\runtimed\cars\155-DTM\155-DTM.rgb
if exist .\data\cars\models\155-DTM\tex-wheel.rgb copy .\data\cars\models\155-DTM\tex-wheel.rgb .\runtimed\cars\155-DTM\tex-wheel.rgb
if exist .\data\cars\models\155-DTM\155-DTM.ac copy .\data\cars\models\155-DTM\155-DTM.ac .\runtimed\cars\155-DTM\155-DTM.ac
if exist .\data\cars\models\155-DTM\155-DTM-base.ac copy .\data\cars\models\155-DTM\155-DTM-base.ac .\runtimed\cars\155-DTM\155-DTM-base.ac
if exist .\data\cars\models\155-DTM\155-DTM-src.ac copy .\data\cars\models\155-DTM\155-DTM-src.ac .\runtimed\cars\155-DTM\155-DTM-src.ac
:data_cars_models_155_DTM

if not exist .\data\cars\models\206W10 goto data_cars_models_206W10
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\206W10
if exist .\data\cars\models\206W10\206W10.xml copy .\data\cars\models\206W10\206W10.xml .\runtimed\cars\206W10\206W10.xml
if exist .\data\cars\models\206W10\206W10.rgb copy .\data\cars\models\206W10\206W10.rgb .\runtimed\cars\206W10\206W10.rgb
if exist .\data\cars\models\206W10\tex-wheel.rgb copy .\data\cars\models\206W10\tex-wheel.rgb .\runtimed\cars\206W10\tex-wheel.rgb
if exist .\data\cars\models\206W10\206W10.acc copy .\data\cars\models\206W10\206W10.acc .\runtimed\cars\206W10\206W10.acc
if exist .\data\cars\models\206W10\readme.txt copy .\data\cars\models\206W10\readme.txt .\runtimed\cars\206W10\readme.txt
:data_cars_models_206W10

if not exist .\data\cars\models\306W61 goto data_cars_models_306W61
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\306W61
if exist .\data\cars\models\306W61\306W61.xml copy .\data\cars\models\306W61\306W61.xml .\runtimed\cars\306W61\306W61.xml
if exist .\data\cars\models\306W61\306W61.rgb copy .\data\cars\models\306W61\306W61.rgb .\runtimed\cars\306W61\306W61.rgb
if exist .\data\cars\models\306W61\tex-wheel.rgb copy .\data\cars\models\306W61\tex-wheel.rgb .\runtimed\cars\306W61\tex-wheel.rgb
if exist .\data\cars\models\306W61\306W61.acc copy .\data\cars\models\306W61\306W61.acc .\runtimed\cars\306W61\306W61.acc
if exist .\data\cars\models\306W61\readme.txt copy .\data\cars\models\306W61\readme.txt .\runtimed\cars\306W61\readme.txt
:data_cars_models_306W61

if not exist .\data\cars\models\360-challenge goto data_cars_models_360_challenge
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\360-challenge
if exist .\data\cars\models\360-challenge\texmapper.xml copy .\data\cars\models\360-challenge\texmapper.xml .\runtimed\cars\360-challenge\texmapper.xml
if exist .\data\cars\models\360-challenge\tex-wheel.rgb copy .\data\cars\models\360-challenge\tex-wheel.rgb .\runtimed\cars\360-challenge\tex-wheel.rgb
if exist .\data\cars\models\360-challenge\360-challenge-base.ac copy .\data\cars\models\360-challenge\360-challenge-base.ac .\runtimed\cars\360-challenge\360-challenge-base.ac
if exist .\data\cars\models\360-challenge\360-challenge.xml copy .\data\cars\models\360-challenge\360-challenge.xml .\runtimed\cars\360-challenge\360-challenge.xml
if exist .\data\cars\models\360-challenge\360-challenge.ac copy .\data\cars\models\360-challenge\360-challenge.ac .\runtimed\cars\360-challenge\360-challenge.ac
if exist .\data\cars\models\360-challenge\360-challenge.acc copy .\data\cars\models\360-challenge\360-challenge.acc .\runtimed\cars\360-challenge\360-challenge.acc
if exist .\data\cars\models\360-challenge\360-challenge.rgb copy .\data\cars\models\360-challenge\360-challenge.rgb .\runtimed\cars\360-challenge\360-challenge.rgb
:data_cars_models_360_challenge

if not exist .\data\cars\models\360-modena goto data_cars_models_360_modena
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\360-modena
if exist .\data\cars\models\360-modena\360-modena.xml copy .\data\cars\models\360-modena\360-modena.xml .\runtimed\cars\360-modena\360-modena.xml
if exist .\data\cars\models\360-modena\360-modena.ac copy .\data\cars\models\360-modena\360-modena.ac .\runtimed\cars\360-modena\360-modena.ac
if exist .\data\cars\models\360-modena\360-modena-lod1.ac copy .\data\cars\models\360-modena\360-modena-lod1.ac .\runtimed\cars\360-modena\360-modena-lod1.ac
if exist .\data\cars\models\360-modena\texmapper.xml copy .\data\cars\models\360-modena\texmapper.xml .\runtimed\cars\360-modena\texmapper.xml
if exist .\data\cars\models\360-modena\tex-wheel.rgb copy .\data\cars\models\360-modena\tex-wheel.rgb .\runtimed\cars\360-modena\tex-wheel.rgb
if exist .\data\cars\models\360-modena\360-modena.rgb copy .\data\cars\models\360-modena\360-modena.rgb .\runtimed\cars\360-modena\360-modena.rgb
if exist .\data\cars\models\360-modena\360-modena-src.ac copy .\data\cars\models\360-modena\360-modena-src.ac .\runtimed\cars\360-modena\360-modena-src.ac
:data_cars_models_360_modena

if not exist .\data\cars\models\acura-nsx-sz goto data_cars_models_acura_nsx_sz
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\acura-nsx-sz
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz.xml copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz.xml .\runtimed\cars\acura-nsx-sz\acura-nsx-sz.xml
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz.ac copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz.ac .\runtimed\cars\acura-nsx-sz\acura-nsx-sz.ac
if exist .\data\cars\models\acura-nsx-sz\tex-wheel.rgb copy .\data\cars\models\acura-nsx-sz\tex-wheel.rgb .\runtimed\cars\acura-nsx-sz\tex-wheel.rgb
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz.rgb copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz.rgb .\runtimed\cars\acura-nsx-sz\acura-nsx-sz.rgb
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz-lod1.ac copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz-lod1.ac .\runtimed\cars\acura-nsx-sz\acura-nsx-sz-lod1.ac
if exist .\data\cars\models\acura-nsx-sz\acura-nsx-sz-src.ac copy .\data\cars\models\acura-nsx-sz\acura-nsx-sz-src.ac .\runtimed\cars\acura-nsx-sz\acura-nsx-sz-src.ac
:data_cars_models_acura_nsx_sz

if not exist .\data\cars\models\alpha-156-rk goto data_cars_models_alpha_156_rk
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\alpha-156-rk
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk.xml copy .\data\cars\models\alpha-156-rk\alpha-156-rk.xml .\runtimed\cars\alpha-156-rk\alpha-156-rk.xml
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk.rgb copy .\data\cars\models\alpha-156-rk\alpha-156-rk.rgb .\runtimed\cars\alpha-156-rk\alpha-156-rk.rgb
if exist .\data\cars\models\alpha-156-rk\tex-wheel.rgb copy .\data\cars\models\alpha-156-rk\tex-wheel.rgb .\runtimed\cars\alpha-156-rk\tex-wheel.rgb
if exist .\data\cars\models\alpha-156-rk\1562.ac copy .\data\cars\models\alpha-156-rk\1562.ac .\runtimed\cars\alpha-156-rk\1562.ac
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk.ac copy .\data\cars\models\alpha-156-rk\alpha-156-rk.ac .\runtimed\cars\alpha-156-rk\alpha-156-rk.ac
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk-lod.ac copy .\data\cars\models\alpha-156-rk\alpha-156-rk-lod.ac .\runtimed\cars\alpha-156-rk\alpha-156-rk-lod.ac
if exist .\data\cars\models\alpha-156-rk\alpha-156-rk-src.ac copy .\data\cars\models\alpha-156-rk\alpha-156-rk-src.ac .\runtimed\cars\alpha-156-rk\alpha-156-rk-src.ac
if exist .\data\cars\models\alpha-156-rk\Readme.txt copy .\data\cars\models\alpha-156-rk\Readme.txt .\runtimed\cars\alpha-156-rk\Readme.txt
:data_cars_models_alpha_156_rk

if not exist .\data\cars\models\baja-bug goto data_cars_models_baja_bug
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\baja-bug
if exist .\data\cars\models\baja-bug\baja-bug-base.ac copy .\data\cars\models\baja-bug\baja-bug-base.ac .\runtimed\cars\baja-bug\baja-bug-base.ac
if exist .\data\cars\models\baja-bug\baja-bug.ac copy .\data\cars\models\baja-bug\baja-bug.ac .\runtimed\cars\baja-bug\baja-bug.ac
if exist .\data\cars\models\baja-bug\baja-bug.acc copy .\data\cars\models\baja-bug\baja-bug.acc .\runtimed\cars\baja-bug\baja-bug.acc
if exist .\data\cars\models\baja-bug\baja-bug.rgb copy .\data\cars\models\baja-bug\baja-bug.rgb .\runtimed\cars\baja-bug\baja-bug.rgb
if exist .\data\cars\models\baja-bug\baja-bug.xml copy .\data\cars\models\baja-bug\baja-bug.xml .\runtimed\cars\baja-bug\baja-bug.xml
if exist .\data\cars\models\baja-bug\texmapper.xml copy .\data\cars\models\baja-bug\texmapper.xml .\runtimed\cars\baja-bug\texmapper.xml
if exist .\data\cars\models\baja-bug\tex-wheel.rgb copy .\data\cars\models\baja-bug\tex-wheel.rgb .\runtimed\cars\baja-bug\tex-wheel.rgb
:data_cars_models_baja_bug

if not exist .\data\cars\models\buggy goto data_cars_models_buggy
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\buggy
if exist .\data\cars\models\buggy\buggy.xml copy .\data\cars\models\buggy\buggy.xml .\runtimed\cars\buggy\buggy.xml
if exist .\data\cars\models\buggy\buggy.ac copy .\data\cars\models\buggy\buggy.ac .\runtimed\cars\buggy\buggy.ac
if exist .\data\cars\models\buggy\buggy.rgb copy .\data\cars\models\buggy\buggy.rgb .\runtimed\cars\buggy\buggy.rgb
if exist .\data\cars\models\buggy\tex-wheel.rgb copy .\data\cars\models\buggy\tex-wheel.rgb .\runtimed\cars\buggy\tex-wheel.rgb
if exist .\data\cars\models\buggy\buggy-src.ac copy .\data\cars\models\buggy\buggy-src.ac .\runtimed\cars\buggy\buggy-src.ac
:data_cars_models_buggy

if not exist .\data\cars\models\cg-nascar-fwd goto data_cars_models_cg_nascar_fwd
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\cg-nascar-fwd
if exist .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.xml copy .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.xml .\runtimed\cars\cg-nascar-fwd\cg-nascar-fwd.xml
if exist .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.ac copy .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.ac .\runtimed\cars\cg-nascar-fwd\cg-nascar-fwd.ac
if exist .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.rgb copy .\data\cars\models\cg-nascar-fwd\cg-nascar-fwd.rgb .\runtimed\cars\cg-nascar-fwd\cg-nascar-fwd.rgb
if exist .\data\cars\models\cg-nascar-fwd\tex-wheel.rgb copy .\data\cars\models\cg-nascar-fwd\tex-wheel.rgb .\runtimed\cars\cg-nascar-fwd\tex-wheel.rgb
:data_cars_models_cg_nascar_fwd

if not exist .\data\cars\models\cg-nascar-rwd goto data_cars_models_cg_nascar_rwd
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\cg-nascar-rwd
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.xml copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.xml .\runtimed\cars\cg-nascar-rwd\cg-nascar-rwd.xml
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.ac copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.ac .\runtimed\cars\cg-nascar-rwd\cg-nascar-rwd.ac
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-lod1.ac copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-lod1.ac .\runtimed\cars\cg-nascar-rwd\cg-nascar-rwd-lod1.ac
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.rgb copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd.rgb .\runtimed\cars\cg-nascar-rwd\cg-nascar-rwd.rgb
if exist .\data\cars\models\cg-nascar-rwd\tex-wheel.rgb copy .\data\cars\models\cg-nascar-rwd\tex-wheel.rgb .\runtimed\cars\cg-nascar-rwd\tex-wheel.rgb
if exist .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-src.ac copy .\data\cars\models\cg-nascar-rwd\cg-nascar-rwd-src.ac .\runtimed\cars\cg-nascar-rwd\cg-nascar-rwd-src.ac
:data_cars_models_cg_nascar_rwd

if not exist .\data\cars\models\clkdtm goto data_cars_models_clkdtm
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\clkdtm
if exist .\data\cars\models\clkdtm\clkdtm.xml copy .\data\cars\models\clkdtm\clkdtm.xml .\runtimed\cars\clkdtm\clkdtm.xml
if exist .\data\cars\models\clkdtm\clkdtm.rgb copy .\data\cars\models\clkdtm\clkdtm.rgb .\runtimed\cars\clkdtm\clkdtm.rgb
if exist .\data\cars\models\clkdtm\tex-wheel.rgb copy .\data\cars\models\clkdtm\tex-wheel.rgb .\runtimed\cars\clkdtm\tex-wheel.rgb
if exist .\data\cars\models\clkdtm\clkdtm.ac copy .\data\cars\models\clkdtm\clkdtm.ac .\runtimed\cars\clkdtm\clkdtm.ac
if exist .\data\cars\models\clkdtm\clkdtm-src.ac copy .\data\cars\models\clkdtm\clkdtm-src.ac .\runtimed\cars\clkdtm\clkdtm-src.ac
if exist .\data\cars\models\clkdtm\clkdtm.xcf copy .\data\cars\models\clkdtm\clkdtm.xcf .\runtimed\cars\clkdtm\clkdtm.xcf
:data_cars_models_clkdtm

if not exist .\data\cars\models\corvette goto data_cars_models_corvette
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\corvette
if exist .\data\cars\models\corvette\corvette.xml copy .\data\cars\models\corvette\corvette.xml .\runtimed\cars\corvette\corvette.xml
if exist .\data\cars\models\corvette\corvette-base.ac copy .\data\cars\models\corvette\corvette-base.ac .\runtimed\cars\corvette\corvette-base.ac
if exist .\data\cars\models\corvette\corvette.ac copy .\data\cars\models\corvette\corvette.ac .\runtimed\cars\corvette\corvette.ac
if exist .\data\cars\models\corvette\tex-wheel.rgb copy .\data\cars\models\corvette\tex-wheel.rgb .\runtimed\cars\corvette\tex-wheel.rgb
if exist .\data\cars\models\corvette\texmapper.xml copy .\data\cars\models\corvette\texmapper.xml .\runtimed\cars\corvette\texmapper.xml
if exist .\data\cars\models\corvette\corvette.rgb copy .\data\cars\models\corvette\corvette.rgb .\runtimed\cars\corvette\corvette.rgb
:data_cars_models_corvette

if not exist .\data\cars\models\CORW61 goto data_cars_models_CORW61
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\CORW61
if exist .\data\cars\models\CORW61\CORW61.xml copy .\data\cars\models\CORW61\CORW61.xml .\runtimed\cars\CORW61\CORW61.xml
if exist .\data\cars\models\CORW61\CORW61.rgb copy .\data\cars\models\CORW61\CORW61.rgb .\runtimed\cars\CORW61\CORW61.rgb
if exist .\data\cars\models\CORW61\tex-wheel.rgb copy .\data\cars\models\CORW61\tex-wheel.rgb .\runtimed\cars\CORW61\tex-wheel.rgb
if exist .\data\cars\models\CORW61\CORW61.acc copy .\data\cars\models\CORW61\CORW61.acc .\runtimed\cars\CORW61\CORW61.acc
if exist .\data\cars\models\CORW61\readme.txt copy .\data\cars\models\CORW61\readme.txt .\runtimed\cars\CORW61\readme.txt
:data_cars_models_CORW61

if not exist .\data\cars\models\EVOWRC61 goto data_cars_models_EVOWRC61
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\EVOWRC61
if exist .\data\cars\models\EVOWRC61\EVOWRC61.xml copy .\data\cars\models\EVOWRC61\EVOWRC61.xml .\runtimed\cars\EVOWRC61\EVOWRC61.xml
if exist .\data\cars\models\EVOWRC61\EVOWRC61.rgb copy .\data\cars\models\EVOWRC61\EVOWRC61.rgb .\runtimed\cars\EVOWRC61\EVOWRC61.rgb
if exist .\data\cars\models\EVOWRC61\tex-wheel.rgb copy .\data\cars\models\EVOWRC61\tex-wheel.rgb .\runtimed\cars\EVOWRC61\tex-wheel.rgb
if exist .\data\cars\models\EVOWRC61\EVOWRC61.acc copy .\data\cars\models\EVOWRC61\EVOWRC61.acc .\runtimed\cars\EVOWRC61\EVOWRC61.acc
if exist .\data\cars\models\EVOWRC61\readme.txt copy .\data\cars\models\EVOWRC61\readme.txt .\runtimed\cars\EVOWRC61\readme.txt
:data_cars_models_EVOWRC61

if not exist .\data\cars\models\FOCW61 goto data_cars_models_FOCW61
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\FOCW61
if exist .\data\cars\models\FOCW61\FOCW61.xml copy .\data\cars\models\FOCW61\FOCW61.xml .\runtimed\cars\FOCW61\FOCW61.xml
if exist .\data\cars\models\FOCW61\FOCW61.rgb copy .\data\cars\models\FOCW61\FOCW61.rgb .\runtimed\cars\FOCW61\FOCW61.rgb
if exist .\data\cars\models\FOCW61\tex-wheel.rgb copy .\data\cars\models\FOCW61\tex-wheel.rgb .\runtimed\cars\FOCW61\tex-wheel.rgb
if exist .\data\cars\models\FOCW61\FOCW61.acc copy .\data\cars\models\FOCW61\FOCW61.acc .\runtimed\cars\FOCW61\FOCW61.acc
if exist .\data\cars\models\FOCW61\readme.txt copy .\data\cars\models\FOCW61\readme.txt .\runtimed\cars\FOCW61\readme.txt
:data_cars_models_FOCW61

if not exist .\data\cars\models\gt40 goto data_cars_models_gt40
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\gt40
if exist .\data\cars\models\gt40\gt40.xml copy .\data\cars\models\gt40\gt40.xml .\runtimed\cars\gt40\gt40.xml
if exist .\data\cars\models\gt40\gt40.acc copy .\data\cars\models\gt40\gt40.acc .\runtimed\cars\gt40\gt40.acc
if exist .\data\cars\models\gt40\tex-wheel.rgb copy .\data\cars\models\gt40\tex-wheel.rgb .\runtimed\cars\gt40\tex-wheel.rgb
if exist .\data\cars\models\gt40\gt40.rgb copy .\data\cars\models\gt40\gt40.rgb .\runtimed\cars\gt40\gt40.rgb
if exist .\data\cars\models\gt40\gt40-src.ac copy .\data\cars\models\gt40\gt40-src.ac .\runtimed\cars\gt40\gt40-src.ac
:data_cars_models_gt40

if not exist .\data\cars\models\lotus-gt1 goto data_cars_models_lotus_gt1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\lotus-gt1
if exist .\data\cars\models\lotus-gt1\lotus-gt1.xml copy .\data\cars\models\lotus-gt1\lotus-gt1.xml .\runtimed\cars\lotus-gt1\lotus-gt1.xml
if exist .\data\cars\models\lotus-gt1\lotus-gt1.ac copy .\data\cars\models\lotus-gt1\lotus-gt1.ac .\runtimed\cars\lotus-gt1\lotus-gt1.ac
if exist .\data\cars\models\lotus-gt1\lotus-gt1-base.ac copy .\data\cars\models\lotus-gt1\lotus-gt1-base.ac .\runtimed\cars\lotus-gt1\lotus-gt1-base.ac
if exist .\data\cars\models\lotus-gt1\texmapper.xml copy .\data\cars\models\lotus-gt1\texmapper.xml .\runtimed\cars\lotus-gt1\texmapper.xml
if exist .\data\cars\models\lotus-gt1\tex-wheel.rgb copy .\data\cars\models\lotus-gt1\tex-wheel.rgb .\runtimed\cars\lotus-gt1\tex-wheel.rgb
if exist .\data\cars\models\lotus-gt1\lotus-gt1.rgb copy .\data\cars\models\lotus-gt1\lotus-gt1.rgb .\runtimed\cars\lotus-gt1\lotus-gt1.rgb
if exist .\data\cars\models\lotus-gt1\lotus-gt1-512.rgb copy .\data\cars\models\lotus-gt1\lotus-gt1-512.rgb .\runtimed\cars\lotus-gt1\lotus-gt1-512.rgb
if exist .\data\cars\models\lotus-gt1\lotus-gt1-src.ac copy .\data\cars\models\lotus-gt1\lotus-gt1-src.ac .\runtimed\cars\lotus-gt1\lotus-gt1-src.ac
:data_cars_models_lotus_gt1

if not exist .\data\cars\models\mclaren-f1 goto data_cars_models_mclaren_f1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\mclaren-f1
if exist .\data\cars\models\mclaren-f1\mclaren-f1.xml copy .\data\cars\models\mclaren-f1\mclaren-f1.xml .\runtimed\cars\mclaren-f1\mclaren-f1.xml
if exist .\data\cars\models\mclaren-f1\mclaren-f1.ac copy .\data\cars\models\mclaren-f1\mclaren-f1.ac .\runtimed\cars\mclaren-f1\mclaren-f1.ac
if exist .\data\cars\models\mclaren-f1\mclaren-f1-lod1.ac copy .\data\cars\models\mclaren-f1\mclaren-f1-lod1.ac .\runtimed\cars\mclaren-f1\mclaren-f1-lod1.ac
if exist .\data\cars\models\mclaren-f1\texmapper.xml copy .\data\cars\models\mclaren-f1\texmapper.xml .\runtimed\cars\mclaren-f1\texmapper.xml
if exist .\data\cars\models\mclaren-f1\tex-wheel.rgb copy .\data\cars\models\mclaren-f1\tex-wheel.rgb .\runtimed\cars\mclaren-f1\tex-wheel.rgb
if exist .\data\cars\models\mclaren-f1\mclaren-f1.rgb copy .\data\cars\models\mclaren-f1\mclaren-f1.rgb .\runtimed\cars\mclaren-f1\mclaren-f1.rgb
if exist .\data\cars\models\mclaren-f1\mclaren-f1-512.rgb copy .\data\cars\models\mclaren-f1\mclaren-f1-512.rgb .\runtimed\cars\mclaren-f1\mclaren-f1-512.rgb
if exist .\data\cars\models\mclaren-f1\mclaren-f1-src.ac copy .\data\cars\models\mclaren-f1\mclaren-f1-src.ac .\runtimed\cars\mclaren-f1\mclaren-f1-src.ac
:data_cars_models_mclaren_f1

if not exist .\data\cars\models\p406 goto data_cars_models_p406
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\p406
if exist .\data\cars\models\p406\p406.xml copy .\data\cars\models\p406\p406.xml .\runtimed\cars\p406\p406.xml
if exist .\data\cars\models\p406\texmapper.xml copy .\data\cars\models\p406\texmapper.xml .\runtimed\cars\p406\texmapper.xml
if exist .\data\cars\models\p406\p406.ac copy .\data\cars\models\p406\p406.ac .\runtimed\cars\p406\p406.ac
if exist .\data\cars\models\p406\p406-base.ac copy .\data\cars\models\p406\p406-base.ac .\runtimed\cars\p406\p406-base.ac
if exist .\data\cars\models\p406\p406-512.rgb copy .\data\cars\models\p406\p406-512.rgb .\runtimed\cars\p406\p406-512.rgb
if exist .\data\cars\models\p406\p406.rgb copy .\data\cars\models\p406\p406.rgb .\runtimed\cars\p406\p406.rgb
if exist .\data\cars\models\p406\tex-wheel.rgb copy .\data\cars\models\p406\tex-wheel.rgb .\runtimed\cars\p406\tex-wheel.rgb
:data_cars_models_p406

if not exist .\data\cars\models\porsche-gt1 goto data_cars_models_porsche_gt1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\porsche-gt1
if exist .\data\cars\models\porsche-gt1\porsche-gt1.xml copy .\data\cars\models\porsche-gt1\porsche-gt1.xml .\runtimed\cars\porsche-gt1\porsche-gt1.xml
if exist .\data\cars\models\porsche-gt1\porsche-gt1.ac copy .\data\cars\models\porsche-gt1\porsche-gt1.ac .\runtimed\cars\porsche-gt1\porsche-gt1.ac
if exist .\data\cars\models\porsche-gt1\porsche-gt1-lod1.ac copy .\data\cars\models\porsche-gt1\porsche-gt1-lod1.ac .\runtimed\cars\porsche-gt1\porsche-gt1-lod1.ac
if exist .\data\cars\models\porsche-gt1\tex-wheel.rgb copy .\data\cars\models\porsche-gt1\tex-wheel.rgb .\runtimed\cars\porsche-gt1\tex-wheel.rgb
if exist .\data\cars\models\porsche-gt1\porsche-gt1.rgb copy .\data\cars\models\porsche-gt1\porsche-gt1.rgb .\runtimed\cars\porsche-gt1\porsche-gt1.rgb
if exist .\data\cars\models\porsche-gt1\porsche-gt1-src.ac copy .\data\cars\models\porsche-gt1\porsche-gt1-src.ac .\runtimed\cars\porsche-gt1\porsche-gt1-src.ac
:data_cars_models_porsche_gt1

if not exist .\data\cars\models\porsche-gt3rs goto data_cars_models_porsche_gt3rs
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\porsche-gt3rs
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs.xml copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs.xml .\runtimed\cars\porsche-gt3rs\porsche-gt3rs.xml
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs.acc copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs.acc .\runtimed\cars\porsche-gt3rs\porsche-gt3rs.acc
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs.rgb copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs.rgb .\runtimed\cars\porsche-gt3rs\porsche-gt3rs.rgb
if exist .\data\cars\models\porsche-gt3rs\tex-wheel.rgb copy .\data\cars\models\porsche-gt3rs\tex-wheel.rgb .\runtimed\cars\porsche-gt3rs\tex-wheel.rgb
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs-src.ac copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs-src.ac .\runtimed\cars\porsche-gt3rs\porsche-gt3rs-src.ac
if exist .\data\cars\models\porsche-gt3rs\porsche-gt3rs-lod1.acc copy .\data\cars\models\porsche-gt3rs\porsche-gt3rs-lod1.acc .\runtimed\cars\porsche-gt3rs\porsche-gt3rs-lod1.acc
:data_cars_models_porsche_gt3rs

if not exist .\data\cars\models\SWRC62 goto data_cars_models_SWRC62
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\SWRC62
if exist .\data\cars\models\SWRC62\SWRC62.xml copy .\data\cars\models\SWRC62\SWRC62.xml .\runtimed\cars\SWRC62\SWRC62.xml
if exist .\data\cars\models\SWRC62\SWRC62.rgb copy .\data\cars\models\SWRC62\SWRC62.rgb .\runtimed\cars\SWRC62\SWRC62.rgb
if exist .\data\cars\models\SWRC62\tex-wheel.rgb copy .\data\cars\models\SWRC62\tex-wheel.rgb .\runtimed\cars\SWRC62\tex-wheel.rgb
if exist .\data\cars\models\SWRC62\SWRC62.acc copy .\data\cars\models\SWRC62\SWRC62.acc .\runtimed\cars\SWRC62\SWRC62.acc
if exist .\data\cars\models\SWRC62\readme.txt copy .\data\cars\models\SWRC62\readme.txt .\runtimed\cars\SWRC62\readme.txt
:data_cars_models_SWRC62

if not exist .\data\cars\models\viper-gts-r goto data_cars_models_viper_gts_r
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\viper-gts-r
if exist .\data\cars\models\viper-gts-r\viper-gts-r.xml copy .\data\cars\models\viper-gts-r\viper-gts-r.xml .\runtimed\cars\viper-gts-r\viper-gts-r.xml
if exist .\data\cars\models\viper-gts-r\tex-wheel.rgb copy .\data\cars\models\viper-gts-r\tex-wheel.rgb .\runtimed\cars\viper-gts-r\tex-wheel.rgb
if exist .\data\cars\models\viper-gts-r\viper-gts-r.rgb copy .\data\cars\models\viper-gts-r\viper-gts-r.rgb .\runtimed\cars\viper-gts-r\viper-gts-r.rgb
if exist .\data\cars\models\viper-gts-r\viper-gts-r.ac copy .\data\cars\models\viper-gts-r\viper-gts-r.ac .\runtimed\cars\viper-gts-r\viper-gts-r.ac
if exist .\data\cars\models\viper-gts-r\viper-gts-r-512.rgb copy .\data\cars\models\viper-gts-r\viper-gts-r-512.rgb .\runtimed\cars\viper-gts-r\viper-gts-r-512.rgb
if exist .\data\cars\models\viper-gts-r\viper-gts-r-base.ac copy .\data\cars\models\viper-gts-r\viper-gts-r-base.ac .\runtimed\cars\viper-gts-r\viper-gts-r-base.ac
if exist .\data\cars\models\viper-gts-r\texmapper.xml copy .\data\cars\models\viper-gts-r\texmapper.xml .\runtimed\cars\viper-gts-r\texmapper.xml
if exist .\data\cars\models\viper-gts-r\viper-gts-r-src.ac copy .\data\cars\models\viper-gts-r\viper-gts-r-src.ac .\runtimed\cars\viper-gts-r\viper-gts-r-src.ac
:data_cars_models_viper_gts_r

if not exist .\data\cars\models\xj-220 goto data_cars_models_xj_220
call .\create_dir .\runtimed
call .\create_dir .\runtimed\cars
call .\create_dir .\runtimed\cars\xj-220
if exist .\data\cars\models\xj-220\xj-220.xml copy .\data\cars\models\xj-220\xj-220.xml .\runtimed\cars\xj-220\xj-220.xml
if exist .\data\cars\models\xj-220\xj-220.rgb copy .\data\cars\models\xj-220\xj-220.rgb .\runtimed\cars\xj-220\xj-220.rgb
if exist .\data\cars\models\xj-220\xj-220.ac copy .\data\cars\models\xj-220\xj-220.ac .\runtimed\cars\xj-220\xj-220.ac
if exist .\data\cars\models\xj-220\tex-wheel.rgb copy .\data\cars\models\xj-220\tex-wheel.rgb .\runtimed\cars\xj-220\tex-wheel.rgb
if exist .\data\cars\models\xj-220\xj-220-base.ac copy .\data\cars\models\xj-220\xj-220-base.ac .\runtimed\cars\xj-220\xj-220-base.ac
if exist .\data\cars\models\xj-220\texmapper.xml copy .\data\cars\models\xj-220\texmapper.xml .\runtimed\cars\xj-220\texmapper.xml
if exist .\data\cars\models\xj-220\xj-220-src.ac copy .\data\cars\models\xj-220\xj-220-src.ac .\runtimed\cars\xj-220\xj-220-src.ac
:data_cars_models_xj_220

if not exist .\data\data\fonts goto data_data_fonts
call .\create_dir .\runtimed
call .\create_dir .\runtimed\data
call .\create_dir .\runtimed\data\fonts
if exist .\data\data\fonts\b5.glf copy .\data\data\fonts\b5.glf .\runtimed\data\fonts\b5.glf
if exist .\data\data\fonts\b6.glf copy .\data\data\fonts\b6.glf .\runtimed\data\fonts\b6.glf
if exist .\data\data\fonts\b7.glf copy .\data\data\fonts\b7.glf .\runtimed\data\fonts\b7.glf
if exist .\data\data\fonts\digital.glf copy .\data\data\fonts\digital.glf .\runtimed\data\fonts\digital.glf
if exist .\data\data\fonts\fragile.glf copy .\data\data\fonts\fragile.glf .\runtimed\data\fonts\fragile.glf
if exist .\data\data\fonts\Makefile copy .\data\data\fonts\Makefile .\runtimed\data\fonts\Makefile
:data_data_fonts

if not exist .\data\data\img goto data_data_img
call .\create_dir .\runtimed
call .\create_dir .\runtimed\data
call .\create_dir .\runtimed\data\img
if exist .\data\data\img\arrow-down.png copy .\data\data\img\arrow-down.png .\runtimed\data\img\arrow-down.png
if exist .\data\data\img\arrow-down-pushed.png copy .\data\data\img\arrow-down-pushed.png .\runtimed\data\img\arrow-down-pushed.png
if exist .\data\data\img\arrow-left.png copy .\data\data\img\arrow-left.png .\runtimed\data\img\arrow-left.png
if exist .\data\data\img\arrow-left-pushed.png copy .\data\data\img\arrow-left-pushed.png .\runtimed\data\img\arrow-left-pushed.png
if exist .\data\data\img\arrow-right.png copy .\data\data\img\arrow-right.png .\runtimed\data\img\arrow-right.png
if exist .\data\data\img\arrow-right-pushed.png copy .\data\data\img\arrow-right-pushed.png .\runtimed\data\img\arrow-right-pushed.png
if exist .\data\data\img\arrow-up.png copy .\data\data\img\arrow-up.png .\runtimed\data\img\arrow-up.png
if exist .\data\data\img\arrow-up-pushed.png copy .\data\data\img\arrow-up-pushed.png .\runtimed\data\img\arrow-up-pushed.png
if exist .\data\data\img\ruler.png copy .\data\data\img\ruler.png .\runtimed\data\img\ruler.png
if exist .\data\data\img\ruler-pushed.png copy .\data\data\img\ruler-pushed.png .\runtimed\data\img\ruler-pushed.png
if exist .\data\data\img\splash-dtm.png copy .\data\data\img\splash-dtm.png .\runtimed\data\img\splash-dtm.png
if exist .\data\data\img\splash-dtmstart.png copy .\data\data\img\splash-dtmstart.png .\runtimed\data\img\splash-dtmstart.png
if exist .\data\data\img\splash-free1.png copy .\data\data\img\splash-free1.png .\runtimed\data\img\splash-free1.png
if exist .\data\data\img\splash-free4.png copy .\data\data\img\splash-free4.png .\runtimed\data\img\splash-free4.png
if exist .\data\data\img\splash-free5.png copy .\data\data\img\splash-free5.png .\runtimed\data\img\splash-free5.png
if exist .\data\data\img\splash-free.png copy .\data\data\img\splash-free.png .\runtimed\data\img\splash-free.png
if exist .\data\data\img\splash-graphconf.png copy .\data\data\img\splash-graphconf.png .\runtimed\data\img\splash-graphconf.png
if exist .\data\data\img\splash-graphic.png copy .\data\data\img\splash-graphic.png .\runtimed\data\img\splash-graphic.png
if exist .\data\data\img\splash-joycal.png copy .\data\data\img\splash-joycal.png .\runtimed\data\img\splash-joycal.png
if exist .\data\data\img\splash-joyconf.png copy .\data\data\img\splash-joyconf.png .\runtimed\data\img\splash-joyconf.png
if exist .\data\data\img\splash-main.png copy .\data\data\img\splash-main.png .\runtimed\data\img\splash-main.png
if exist .\data\data\img\splash-options.png copy .\data\data\img\splash-options.png .\runtimed\data\img\splash-options.png
if exist .\data\data\img\splash.png copy .\data\data\img\splash.png .\runtimed\data\img\splash.png
if exist .\data\data\img\splash-practice.png copy .\data\data\img\splash-practice.png .\runtimed\data\img\splash-practice.png
if exist .\data\data\img\splash-prsess.png copy .\data\data\img\splash-prsess.png .\runtimed\data\img\splash-prsess.png
if exist .\data\data\img\splash-qrdrv.png copy .\data\data\img\splash-qrdrv.png .\runtimed\data\img\splash-qrdrv.png
if exist .\data\data\img\splash-qrloading.png copy .\data\data\img\splash-qrloading.png .\runtimed\data\img\splash-qrloading.png
if exist .\data\data\img\splash-qr.png copy .\data\data\img\splash-qr.png .\runtimed\data\img\splash-qr.png
if exist .\data\data\img\splash-qrtrk.png copy .\data\data\img\splash-qrtrk.png .\runtimed\data\img\splash-qrtrk.png
if exist .\data\data\img\splash-quit.png copy .\data\data\img\splash-quit.png .\runtimed\data\img\splash-quit.png
if exist .\data\data\img\splash-raceopt.png copy .\data\data\img\splash-raceopt.png .\runtimed\data\img\splash-raceopt.png
if exist .\data\data\img\splash-result.png copy .\data\data\img\splash-result.png .\runtimed\data\img\splash-result.png
if exist .\data\data\img\splash-run-practice.png copy .\data\data\img\splash-run-practice.png .\runtimed\data\img\splash-run-practice.png
if exist .\data\data\img\splash-single-player.png copy .\data\data\img\splash-single-player.png .\runtimed\data\img\splash-single-player.png
:data_data_img

if not exist .\data\data\menu goto data_data_menu
call .\create_dir .\runtimed
call .\create_dir .\runtimed\menu
if exist .\data\data\menu\entry.xml copy .\data\data\menu\entry.xml .\runtimed\menu\entry.xml
:data_data_menu

if not exist .\data\data\objects goto data_data_objects
call .\create_dir .\runtimed
call .\create_dir .\runtimed\data
call .\create_dir .\runtimed\data\objects
if exist .\data\data\objects\ad1.ac copy .\data\data\objects\ad1.ac .\runtimed\data\objects\ad1.ac
if exist .\data\data\objects\bridge.ac copy .\data\data\objects\bridge.ac .\runtimed\data\objects\bridge.ac
if exist .\data\data\objects\bridge-arch.ac copy .\data\data\objects\bridge-arch.ac .\runtimed\data\objects\bridge-arch.ac
if exist .\data\data\objects\building1.ac copy .\data\data\objects\building1.ac .\runtimed\data\objects\building1.ac
if exist .\data\data\objects\building2.ac copy .\data\data\objects\building2.ac .\runtimed\data\objects\building2.ac
if exist .\data\data\objects\forest1.ac copy .\data\data\objects\forest1.ac .\runtimed\data\objects\forest1.ac
if exist .\data\data\objects\forest2.ac copy .\data\data\objects\forest2.ac .\runtimed\data\objects\forest2.ac
if exist .\data\data\objects\forest3.ac copy .\data\data\objects\forest3.ac .\runtimed\data\objects\forest3.ac
if exist .\data\data\objects\needle.ac copy .\data\data\objects\needle.ac .\runtimed\data\objects\needle.ac
if exist .\data\data\objects\stadium1.ac copy .\data\data\objects\stadium1.ac .\runtimed\data\objects\stadium1.ac
if exist .\data\data\objects\stand-inter.ac copy .\data\data\objects\stand-inter.ac .\runtimed\data\objects\stand-inter.ac
if exist .\data\data\objects\stand-main.ac copy .\data\data\objects\stand-main.ac .\runtimed\data\objects\stand-main.ac
if exist .\data\data\objects\stand-wall.ac copy .\data\data\objects\stand-wall.ac .\runtimed\data\objects\stand-wall.ac
if exist .\data\data\objects\tree10.ac copy .\data\data\objects\tree10.ac .\runtimed\data\objects\tree10.ac
if exist .\data\data\objects\tree11.ac copy .\data\data\objects\tree11.ac .\runtimed\data\objects\tree11.ac
if exist .\data\data\objects\tree12.ac copy .\data\data\objects\tree12.ac .\runtimed\data\objects\tree12.ac
if exist .\data\data\objects\tree13.ac copy .\data\data\objects\tree13.ac .\runtimed\data\objects\tree13.ac
if exist .\data\data\objects\tree14.ac copy .\data\data\objects\tree14.ac .\runtimed\data\objects\tree14.ac
if exist .\data\data\objects\tree15.ac copy .\data\data\objects\tree15.ac .\runtimed\data\objects\tree15.ac
if exist .\data\data\objects\tree16.ac copy .\data\data\objects\tree16.ac .\runtimed\data\objects\tree16.ac
if exist .\data\data\objects\tree17.ac copy .\data\data\objects\tree17.ac .\runtimed\data\objects\tree17.ac
if exist .\data\data\objects\tree1.ac copy .\data\data\objects\tree1.ac .\runtimed\data\objects\tree1.ac
if exist .\data\data\objects\tree2.ac copy .\data\data\objects\tree2.ac .\runtimed\data\objects\tree2.ac
if exist .\data\data\objects\tree3.ac copy .\data\data\objects\tree3.ac .\runtimed\data\objects\tree3.ac
if exist .\data\data\objects\tree4.ac copy .\data\data\objects\tree4.ac .\runtimed\data\objects\tree4.ac
if exist .\data\data\objects\tree5.ac copy .\data\data\objects\tree5.ac .\runtimed\data\objects\tree5.ac
if exist .\data\data\objects\tree6.ac copy .\data\data\objects\tree6.ac .\runtimed\data\objects\tree6.ac
if exist .\data\data\objects\tree7.ac copy .\data\data\objects\tree7.ac .\runtimed\data\objects\tree7.ac
if exist .\data\data\objects\tree8.ac copy .\data\data\objects\tree8.ac .\runtimed\data\objects\tree8.ac
if exist .\data\data\objects\tree9.ac copy .\data\data\objects\tree9.ac .\runtimed\data\objects\tree9.ac
:data_data_objects

if not exist .\data\data\sound goto data_data_sound
call .\create_dir .\runtimed
call .\create_dir .\runtimed\data
call .\create_dir .\runtimed\data\sound
if exist .\data\data\sound\crash1.wav copy .\data\data\sound\crash1.wav .\runtimed\data\sound\crash1.wav
if exist .\data\data\sound\crash2.wav copy .\data\data\sound\crash2.wav .\runtimed\data\sound\crash2.wav
if exist .\data\data\sound\crash3.wav copy .\data\data\sound\crash3.wav .\runtimed\data\sound\crash3.wav
if exist .\data\data\sound\crash4.wav copy .\data\data\sound\crash4.wav .\runtimed\data\sound\crash4.wav
if exist .\data\data\sound\crash5.wav copy .\data\data\sound\crash5.wav .\runtimed\data\sound\crash5.wav
if exist .\data\data\sound\crash6.wav copy .\data\data\sound\crash6.wav .\runtimed\data\sound\crash6.wav
if exist .\data\data\sound\engine-1.wav copy .\data\data\sound\engine-1.wav .\runtimed\data\sound\engine-1.wav
if exist .\data\data\sound\skid.wav copy .\data\data\sound\skid.wav .\runtimed\data\sound\skid.wav
:data_data_sound

if not exist .\data\data\textures goto data_data_textures
call .\create_dir .\runtimed
call .\create_dir .\runtimed\data
call .\create_dir .\runtimed\data\textures
if exist .\data\data\textures\background.png copy .\data\data\textures\background.png .\runtimed\data\textures\background.png
if exist .\data\data\textures\env.png copy .\data\data\textures\env.png .\runtimed\data\textures\env.png
if exist .\data\data\textures\envshadow.png copy .\data\data\textures\envshadow.png .\runtimed\data\textures\envshadow.png
if exist .\data\data\textures\back-sign.rgb copy .\data\data\textures\back-sign.rgb .\runtimed\data\textures\back-sign.rgb
if exist .\data\data\textures\building1.rgb copy .\data\data\textures\building1.rgb .\runtimed\data\textures\building1.rgb
if exist .\data\data\textures\building2.rgb copy .\data\data\textures\building2.rgb .\runtimed\data\textures\building2.rgb
if exist .\data\data\textures\bump-2.rgb copy .\data\data\textures\bump-2.rgb .\runtimed\data\textures\bump-2.rgb
if exist .\data\data\textures\bump-3.rgb copy .\data\data\textures\bump-3.rgb .\runtimed\data\textures\bump-3.rgb
if exist .\data\data\textures\bump-4.rgb copy .\data\data\textures\bump-4.rgb .\runtimed\data\textures\bump-4.rgb
if exist .\data\data\textures\bump-5.rgb copy .\data\data\textures\bump-5.rgb .\runtimed\data\textures\bump-5.rgb
if exist .\data\data\textures\bump-6.rgb copy .\data\data\textures\bump-6.rgb .\runtimed\data\textures\bump-6.rgb
if exist .\data\data\textures\bump-7.rgb copy .\data\data\textures\bump-7.rgb .\runtimed\data\textures\bump-7.rgb
if exist .\data\data\textures\bump-8.rgb copy .\data\data\textures\bump-8.rgb .\runtimed\data\textures\bump-8.rgb
if exist .\data\data\textures\bump-9.rgb copy .\data\data\textures\bump-9.rgb .\runtimed\data\textures\bump-9.rgb
if exist .\data\data\textures\bump-as.rgb copy .\data\data\textures\bump-as.rgb .\runtimed\data\textures\bump-as.rgb
if exist .\data\data\textures\bump-finegrain.rgb copy .\data\data\textures\bump-finegrain.rgb .\runtimed\data\textures\bump-finegrain.rgb
if exist .\data\data\textures\bump-sand.rgb copy .\data\data\textures\bump-sand.rgb .\runtimed\data\textures\bump-sand.rgb
if exist .\data\data\textures\concrete2.rgb copy .\data\data\textures\concrete2.rgb .\runtimed\data\textures\concrete2.rgb
if exist .\data\data\textures\concrete.rgb copy .\data\data\textures\concrete.rgb .\runtimed\data\textures\concrete.rgb
if exist .\data\data\textures\counter-bg-10.rgb copy .\data\data\textures\counter-bg-10.rgb .\runtimed\data\textures\counter-bg-10.rgb
if exist .\data\data\textures\counter-bg2.rgb copy .\data\data\textures\counter-bg2.rgb .\runtimed\data\textures\counter-bg2.rgb
if exist .\data\data\textures\counter-bg.rgb copy .\data\data\textures\counter-bg.rgb .\runtimed\data\textures\counter-bg.rgb
if exist .\data\data\textures\counter-bg-rpm.rgb copy .\data\data\textures\counter-bg-rpm.rgb .\runtimed\data\textures\counter-bg-rpm.rgb
if exist .\data\data\textures\counter.rgb copy .\data\data\textures\counter.rgb .\runtimed\data\textures\counter.rgb
if exist .\data\data\textures\fire0.rgb copy .\data\data\textures\fire0.rgb .\runtimed\data\textures\fire0.rgb
if exist .\data\data\textures\fire1.rgb copy .\data\data\textures\fire1.rgb .\runtimed\data\textures\fire1.rgb
if exist .\data\data\textures\forest1.rgb copy .\data\data\textures\forest1.rgb .\runtimed\data\textures\forest1.rgb
if exist .\data\data\textures\forest1-r.rgb copy .\data\data\textures\forest1-r.rgb .\runtimed\data\textures\forest1-r.rgb
if exist .\data\data\textures\forest2.rgb copy .\data\data\textures\forest2.rgb .\runtimed\data\textures\forest2.rgb
if exist .\data\data\textures\forest3.rgb copy .\data\data\textures\forest3.rgb .\runtimed\data\textures\forest3.rgb
if exist .\data\data\textures\fuel-gauge.rgb copy .\data\data\textures\fuel-gauge.rgb .\runtimed\data\textures\fuel-gauge.rgb
if exist .\data\data\textures\gauge.rgb copy .\data\data\textures\gauge.rgb .\runtimed\data\textures\gauge.rgb
if exist .\data\data\textures\grassg1.rgb copy .\data\data\textures\grassg1.rgb .\runtimed\data\textures\grassg1.rgb
if exist .\data\data\textures\grassg2.rgb copy .\data\data\textures\grassg2.rgb .\runtimed\data\textures\grassg2.rgb
if exist .\data\data\textures\grassg3.rgb copy .\data\data\textures\grassg3.rgb .\runtimed\data\textures\grassg3.rgb
if exist .\data\data\textures\logo.rgb copy .\data\data\textures\logo.rgb .\runtimed\data\textures\logo.rgb
if exist .\data\data\textures\panel-empty.rgb copy .\data\data\textures\panel-empty.rgb .\runtimed\data\textures\panel-empty.rgb
if exist .\data\data\textures\people1.rgb copy .\data\data\textures\people1.rgb .\runtimed\data\textures\people1.rgb
if exist .\data\data\textures\pit-left.rgb copy .\data\data\textures\pit-left.rgb .\runtimed\data\textures\pit-left.rgb
if exist .\data\data\textures\pit-right.rgb copy .\data\data\textures\pit-right.rgb .\runtimed\data\textures\pit-right.rgb
if exist .\data\data\textures\pylon1.rgb copy .\data\data\textures\pylon1.rgb .\runtimed\data\textures\pylon1.rgb
if exist .\data\data\textures\pylon2.rgb copy .\data\data\textures\pylon2.rgb .\runtimed\data\textures\pylon2.rgb
if exist .\data\data\textures\pylon3.rgb copy .\data\data\textures\pylon3.rgb .\runtimed\data\textures\pylon3.rgb
if exist .\data\data\textures\red-light-off.rgb copy .\data\data\textures\red-light-off.rgb .\runtimed\data\textures\red-light-off.rgb
if exist .\data\data\textures\red-light-on.rgb copy .\data\data\textures\red-light-on.rgb .\runtimed\data\textures\red-light-on.rgb
if exist .\data\data\textures\rock2.rgb copy .\data\data\textures\rock2.rgb .\runtimed\data\textures\rock2.rgb
if exist .\data\data\textures\rock3.rgb copy .\data\data\textures\rock3.rgb .\runtimed\data\textures\rock3.rgb
if exist .\data\data\textures\rpm5500.rgb copy .\data\data\textures\rpm5500.rgb .\runtimed\data\textures\rpm5500.rgb
if exist .\data\data\textures\rpm7000.rgb copy .\data\data\textures\rpm7000.rgb .\runtimed\data\textures\rpm7000.rgb
if exist .\data\data\textures\rpm8000.rgb copy .\data\data\textures\rpm8000.rgb .\runtimed\data\textures\rpm8000.rgb
if exist .\data\data\textures\rpm8500.rgb copy .\data\data\textures\rpm8500.rgb .\runtimed\data\textures\rpm8500.rgb
if exist .\data\data\textures\smoke.rgb copy .\data\data\textures\smoke.rgb .\runtimed\data\textures\smoke.rgb
if exist .\data\data\textures\speed240.rgb copy .\data\data\textures\speed240.rgb .\runtimed\data\textures\speed240.rgb
if exist .\data\data\textures\speed300.rgb copy .\data\data\textures\speed300.rgb .\runtimed\data\textures\speed300.rgb
if exist .\data\data\textures\speed360.rgb copy .\data\data\textures\speed360.rgb .\runtimed\data\textures\speed360.rgb
if exist .\data\data\textures\torcs-ad1.rgb copy .\data\data\textures\torcs-ad1.rgb .\runtimed\data\textures\torcs-ad1.rgb
if exist .\data\data\textures\tr-asphalt-both_nmm.rgb copy .\data\data\textures\tr-asphalt-both_nmm.rgb .\runtimed\data\textures\tr-asphalt-both_nmm.rgb
if exist .\data\data\textures\tr-asphalt-both.rgb copy .\data\data\textures\tr-asphalt-both.rgb .\runtimed\data\textures\tr-asphalt-both.rgb
if exist .\data\data\textures\tr-asphalt-grass-l.rgb copy .\data\data\textures\tr-asphalt-grass-l.rgb .\runtimed\data\textures\tr-asphalt-grass-l.rgb
if exist .\data\data\textures\tr-asphalt-grass-r.rgb copy .\data\data\textures\tr-asphalt-grass-r.rgb .\runtimed\data\textures\tr-asphalt-grass-r.rgb
if exist .\data\data\textures\tr-asphalt-left_nmm.rgb copy .\data\data\textures\tr-asphalt-left_nmm.rgb .\runtimed\data\textures\tr-asphalt-left_nmm.rgb
if exist .\data\data\textures\tr-asphalt-left.rgb copy .\data\data\textures\tr-asphalt-left.rgb .\runtimed\data\textures\tr-asphalt-left.rgb
if exist .\data\data\textures\tr-asphalt-l_nmm.rgb copy .\data\data\textures\tr-asphalt-l_nmm.rgb .\runtimed\data\textures\tr-asphalt-l_nmm.rgb
if exist .\data\data\textures\tr-asphalt-l.rgb copy .\data\data\textures\tr-asphalt-l.rgb .\runtimed\data\textures\tr-asphalt-l.rgb
if exist .\data\data\textures\tr-asphalt_nmm.rgb copy .\data\data\textures\tr-asphalt_nmm.rgb .\runtimed\data\textures\tr-asphalt_nmm.rgb
if exist .\data\data\textures\tr-asphalt-p_nmm.rgb copy .\data\data\textures\tr-asphalt-p_nmm.rgb .\runtimed\data\textures\tr-asphalt-p_nmm.rgb
if exist .\data\data\textures\tr-asphalt-p.rgb copy .\data\data\textures\tr-asphalt-p.rgb .\runtimed\data\textures\tr-asphalt-p.rgb
if exist .\data\data\textures\tr-asphalt.rgb copy .\data\data\textures\tr-asphalt.rgb .\runtimed\data\textures\tr-asphalt.rgb
if exist .\data\data\textures\tr-asphalt-right_nmm.rgb copy .\data\data\textures\tr-asphalt-right_nmm.rgb .\runtimed\data\textures\tr-asphalt-right_nmm.rgb
if exist .\data\data\textures\tr-asphalt-right.rgb copy .\data\data\textures\tr-asphalt-right.rgb .\runtimed\data\textures\tr-asphalt-right.rgb
if exist .\data\data\textures\tr-asphalt-sand.rgb copy .\data\data\textures\tr-asphalt-sand.rgb .\runtimed\data\textures\tr-asphalt-sand.rgb
if exist .\data\data\textures\tr-barrier.rgb copy .\data\data\textures\tr-barrier.rgb .\runtimed\data\textures\tr-barrier.rgb
if exist .\data\data\textures\tr-concrete_nmm.rgb copy .\data\data\textures\tr-concrete_nmm.rgb .\runtimed\data\textures\tr-concrete_nmm.rgb
if exist .\data\data\textures\tr-concrete.rgb copy .\data\data\textures\tr-concrete.rgb .\runtimed\data\textures\tr-concrete.rgb
if exist .\data\data\textures\tr-curb-l.rgb copy .\data\data\textures\tr-curb-l.rgb .\runtimed\data\textures\tr-curb-l.rgb
if exist .\data\data\textures\tr-curb-r.rgb copy .\data\data\textures\tr-curb-r.rgb .\runtimed\data\textures\tr-curb-r.rgb
if exist .\data\data\textures\tr-dirtb.rgb copy .\data\data\textures\tr-dirtb.rgb .\runtimed\data\textures\tr-dirtb.rgb
if exist .\data\data\textures\tr-dirt.rgb copy .\data\data\textures\tr-dirt.rgb .\runtimed\data\textures\tr-dirt.rgb
if exist .\data\data\textures\tree10.rgb copy .\data\data\textures\tree10.rgb .\runtimed\data\textures\tree10.rgb
if exist .\data\data\textures\tree11.rgb copy .\data\data\textures\tree11.rgb .\runtimed\data\textures\tree11.rgb
if exist .\data\data\textures\tree12.rgb copy .\data\data\textures\tree12.rgb .\runtimed\data\textures\tree12.rgb
if exist .\data\data\textures\tree13.rgb copy .\data\data\textures\tree13.rgb .\runtimed\data\textures\tree13.rgb
if exist .\data\data\textures\tree14.rgb copy .\data\data\textures\tree14.rgb .\runtimed\data\textures\tree14.rgb
if exist .\data\data\textures\tree15.rgb copy .\data\data\textures\tree15.rgb .\runtimed\data\textures\tree15.rgb
if exist .\data\data\textures\tree16.rgb copy .\data\data\textures\tree16.rgb .\runtimed\data\textures\tree16.rgb
if exist .\data\data\textures\tree17.rgb copy .\data\data\textures\tree17.rgb .\runtimed\data\textures\tree17.rgb
if exist .\data\data\textures\tree1.rgb copy .\data\data\textures\tree1.rgb .\runtimed\data\textures\tree1.rgb
if exist .\data\data\textures\tree2.rgb copy .\data\data\textures\tree2.rgb .\runtimed\data\textures\tree2.rgb
if exist .\data\data\textures\tree3.rgb copy .\data\data\textures\tree3.rgb .\runtimed\data\textures\tree3.rgb
if exist .\data\data\textures\tree4.rgb copy .\data\data\textures\tree4.rgb .\runtimed\data\textures\tree4.rgb
if exist .\data\data\textures\tree5.rgb copy .\data\data\textures\tree5.rgb .\runtimed\data\textures\tree5.rgb
if exist .\data\data\textures\tree7.rgb copy .\data\data\textures\tree7.rgb .\runtimed\data\textures\tree7.rgb
if exist .\data\data\textures\tree8.rgb copy .\data\data\textures\tree8.rgb .\runtimed\data\textures\tree8.rgb
if exist .\data\data\textures\tree9.rgb copy .\data\data\textures\tree9.rgb .\runtimed\data\textures\tree9.rgb
if exist .\data\data\textures\tr-fake-road-2.rgb copy .\data\data\textures\tr-fake-road-2.rgb .\runtimed\data\textures\tr-fake-road-2.rgb
if exist .\data\data\textures\tr-fake-road-borders.rgb copy .\data\data\textures\tr-fake-road-borders.rgb .\runtimed\data\textures\tr-fake-road-borders.rgb
if exist .\data\data\textures\tr-fake-road-lines.rgb copy .\data\data\textures\tr-fake-road-lines.rgb .\runtimed\data\textures\tr-fake-road-lines.rgb
if exist .\data\data\textures\tr-fake-road.rgb copy .\data\data\textures\tr-fake-road.rgb .\runtimed\data\textures\tr-fake-road.rgb
if exist .\data\data\textures\tr-grass2.rgb copy .\data\data\textures\tr-grass2.rgb .\runtimed\data\textures\tr-grass2.rgb
if exist .\data\data\textures\tr-grass3.rgb copy .\data\data\textures\tr-grass3.rgb .\runtimed\data\textures\tr-grass3.rgb
if exist .\data\data\textures\tr-grass4.rgb copy .\data\data\textures\tr-grass4.rgb .\runtimed\data\textures\tr-grass4.rgb
if exist .\data\data\textures\tr-grass5.rgb copy .\data\data\textures\tr-grass5.rgb .\runtimed\data\textures\tr-grass5.rgb
if exist .\data\data\textures\tr-grass.rgb copy .\data\data\textures\tr-grass.rgb .\runtimed\data\textures\tr-grass.rgb
if exist .\data\data\textures\tr-sand2.rgb copy .\data\data\textures\tr-sand2.rgb .\runtimed\data\textures\tr-sand2.rgb
if exist .\data\data\textures\tr-sand.rgb copy .\data\data\textures\tr-sand.rgb .\runtimed\data\textures\tr-sand.rgb
if exist .\data\data\textures\tr-snow.rgb copy .\data\data\textures\tr-snow.rgb .\runtimed\data\textures\tr-snow.rgb
if exist .\data\data\textures\tr-tirewall.rgb copy .\data\data\textures\tr-tirewall.rgb .\runtimed\data\textures\tr-tirewall.rgb
if exist .\data\data\textures\tr-wall_nmm.rgb copy .\data\data\textures\tr-wall_nmm.rgb .\runtimed\data\textures\tr-wall_nmm.rgb
if exist .\data\data\textures\tr-wall.rgb copy .\data\data\textures\tr-wall.rgb .\runtimed\data\textures\tr-wall.rgb
if exist .\data\data\textures\tr-water.rgb copy .\data\data\textures\tr-water.rgb .\runtimed\data\textures\tr-water.rgb
if exist .\data\data\textures\turn100L.rgb copy .\data\data\textures\turn100L.rgb .\runtimed\data\textures\turn100L.rgb
if exist .\data\data\textures\turn100R.rgb copy .\data\data\textures\turn100R.rgb .\runtimed\data\textures\turn100R.rgb
if exist .\data\data\textures\turn150L.rgb copy .\data\data\textures\turn150L.rgb .\runtimed\data\textures\turn150L.rgb
if exist .\data\data\textures\turn150R.rgb copy .\data\data\textures\turn150R.rgb .\runtimed\data\textures\turn150R.rgb
if exist .\data\data\textures\turn200L.rgb copy .\data\data\textures\turn200L.rgb .\runtimed\data\textures\turn200L.rgb
if exist .\data\data\textures\turn200R.rgb copy .\data\data\textures\turn200R.rgb .\runtimed\data\textures\turn200R.rgb
if exist .\data\data\textures\turn300L.rgb copy .\data\data\textures\turn300L.rgb .\runtimed\data\textures\turn300L.rgb
if exist .\data\data\textures\turn300R.rgb copy .\data\data\textures\turn300R.rgb .\runtimed\data\textures\turn300R.rgb
if exist .\data\data\textures\turn50L.rgb copy .\data\data\textures\turn50L.rgb .\runtimed\data\textures\turn50L.rgb
if exist .\data\data\textures\turn50R.rgb copy .\data\data\textures\turn50R.rgb .\runtimed\data\textures\turn50R.rgb
:data_data_textures

if not exist .\data\data\tracks goto data_data_tracks
call .\create_dir .\runtimed
call .\create_dir .\runtimed\data
call .\create_dir .\runtimed\data\tracks
if exist .\data\data\tracks\dirt.xml copy .\data\data\tracks\dirt.xml .\runtimed\data\tracks\dirt.xml
if exist .\data\data\tracks\objects.xml copy .\data\data\tracks\objects.xml .\runtimed\data\tracks\objects.xml
if exist .\data\data\tracks\oval.xml copy .\data\data\tracks\oval.xml .\runtimed\data\tracks\oval.xml
if exist .\data\data\tracks\road.xml copy .\data\data\tracks\road.xml .\runtimed\data\tracks\road.xml
if exist .\data\data\tracks\surfaces.xml copy .\data\data\tracks\surfaces.xml .\runtimed\data\tracks\surfaces.xml
:data_data_tracks

if not exist .\data\tracks\aalborg goto data_tracks_aalborg
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\aalborg
if exist .\data\tracks\aalborg\aalborg.xml copy .\data\tracks\aalborg\aalborg.xml .\runtimed\tracks\road\aalborg\aalborg.xml
if exist .\data\tracks\aalborg\aalborg.ac copy .\data\tracks\aalborg\aalborg.ac .\runtimed\tracks\road\aalborg\aalborg.ac
if exist .\data\tracks\aalborg\aalborg.png copy .\data\tracks\aalborg\aalborg.png .\runtimed\tracks\road\aalborg\aalborg.png
:data_tracks_aalborg

if not exist .\data\tracks\a-speedway goto data_tracks_a_speedway
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\oval
call .\create_dir .\runtimed\tracks\oval\a-speedway
if exist .\data\tracks\a-speedway\a-speedway.xml copy .\data\tracks\a-speedway\a-speedway.xml .\runtimed\tracks\oval\a-speedway\a-speedway.xml
if exist .\data\tracks\a-speedway\background.png copy .\data\tracks\a-speedway\background.png .\runtimed\tracks\oval\a-speedway\background.png
if exist .\data\tracks\a-speedway\a-speedway.ac copy .\data\tracks\a-speedway\a-speedway.ac .\runtimed\tracks\oval\a-speedway\a-speedway.ac
if exist .\data\tracks\a-speedway\a-speedway-relief.ac copy .\data\tracks\a-speedway\a-speedway-relief.ac .\runtimed\tracks\oval\a-speedway\a-speedway-relief.ac
if exist .\data\tracks\a-speedway\a-speedway.png copy .\data\tracks\a-speedway\a-speedway.png .\runtimed\tracks\oval\a-speedway\a-speedway.png
:data_tracks_a_speedway

if not exist .\data\tracks\dirt\alpine-d1 goto data_tracks_dirt_alpine_d1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\alpine-d1
if exist .\data\tracks\dirt\alpine-d1\alpine-d1.xml copy .\data\tracks\dirt\alpine-d1\alpine-d1.xml .\runtimed\tracks\dirt\alpine-d1\alpine-d1.xml
if exist .\data\tracks\dirt\alpine-d1\alpine-d1.png copy .\data\tracks\dirt\alpine-d1\alpine-d1.png .\runtimed\tracks\dirt\alpine-d1\alpine-d1.png
if exist .\data\tracks\dirt\alpine-d1\alpine-d1.ac copy .\data\tracks\dirt\alpine-d1\alpine-d1.ac .\runtimed\tracks\dirt\alpine-d1\alpine-d1.ac
if exist .\data\tracks\dirt\alpine-d1\elevation-map.png copy .\data\tracks\dirt\alpine-d1\elevation-map.png .\runtimed\tracks\dirt\alpine-d1\elevation-map.png
if exist .\data\tracks\dirt\alpine-d1\relief.ac copy .\data\tracks\dirt\alpine-d1\relief.ac .\runtimed\tracks\dirt\alpine-d1\relief.ac
:data_tracks_dirt_alpine_d1

if not exist .\data\tracks\dirt-1 goto data_tracks_dirt_1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\dirt-1
if exist .\data\tracks\dirt-1\dirt-1.xml copy .\data\tracks\dirt-1\dirt-1.xml .\runtimed\tracks\dirt\dirt-1\dirt-1.xml
if exist .\data\tracks\dirt-1\background.png copy .\data\tracks\dirt-1\background.png .\runtimed\tracks\dirt\dirt-1\background.png
if exist .\data\tracks\dirt-1\dirt-1.ac copy .\data\tracks\dirt-1\dirt-1.ac .\runtimed\tracks\dirt\dirt-1\dirt-1.ac
if exist .\data\tracks\dirt-1\dirt-1.png copy .\data\tracks\dirt-1\dirt-1.png .\runtimed\tracks\dirt\dirt-1\dirt-1.png
if exist .\data\tracks\dirt-1\elevation-map.png copy .\data\tracks\dirt-1\elevation-map.png .\runtimed\tracks\dirt\dirt-1\elevation-map.png
if exist .\data\tracks\dirt-1\dirt-1-relief.ac copy .\data\tracks\dirt-1\dirt-1-relief.ac .\runtimed\tracks\dirt\dirt-1\dirt-1-relief.ac
if exist .\data\tracks\dirt-1\objects-map1.png copy .\data\tracks\dirt-1\objects-map1.png .\runtimed\tracks\dirt\dirt-1\objects-map1.png
if exist .\data\tracks\dirt-1\objects-map2.png copy .\data\tracks\dirt-1\objects-map2.png .\runtimed\tracks\dirt\dirt-1\objects-map2.png
:data_tracks_dirt_1

if not exist .\data\tracks\dirt-2 goto data_tracks_dirt_2
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\dirt-2
if exist .\data\tracks\dirt-2\dirt-2.xml copy .\data\tracks\dirt-2\dirt-2.xml .\runtimed\tracks\dirt\dirt-2\dirt-2.xml
if exist .\data\tracks\dirt-2\background.png copy .\data\tracks\dirt-2\background.png .\runtimed\tracks\dirt\dirt-2\background.png
if exist .\data\tracks\dirt-2\dirt-2.ac copy .\data\tracks\dirt-2\dirt-2.ac .\runtimed\tracks\dirt\dirt-2\dirt-2.ac
if exist .\data\tracks\dirt-2\dirt-2.png copy .\data\tracks\dirt-2\dirt-2.png .\runtimed\tracks\dirt\dirt-2\dirt-2.png
:data_tracks_dirt_2

if not exist .\data\tracks\dirt-3 goto data_tracks_dirt_3
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\dirt-3
if exist .\data\tracks\dirt-3\dirt-3.xml copy .\data\tracks\dirt-3\dirt-3.xml .\runtimed\tracks\dirt\dirt-3\dirt-3.xml
if exist .\data\tracks\dirt-3\background.png copy .\data\tracks\dirt-3\background.png .\runtimed\tracks\dirt\dirt-3\background.png
if exist .\data\tracks\dirt-3\background2.png copy .\data\tracks\dirt-3\background2.png .\runtimed\tracks\dirt\dirt-3\background2.png
if exist .\data\tracks\dirt-3\dirt-3.ac copy .\data\tracks\dirt-3\dirt-3.ac .\runtimed\tracks\dirt\dirt-3\dirt-3.ac
if exist .\data\tracks\dirt-3\dirt-3-relief.ac copy .\data\tracks\dirt-3\dirt-3-relief.ac .\runtimed\tracks\dirt\dirt-3\dirt-3-relief.ac
if exist .\data\tracks\dirt-3\dirt-3.png copy .\data\tracks\dirt-3\dirt-3.png .\runtimed\tracks\dirt\dirt-3\dirt-3.png
:data_tracks_dirt_3

if not exist .\data\tracks\dirt-4 goto data_tracks_dirt_4
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\dirt-4
if exist .\data\tracks\dirt-4\dirt-4.xml copy .\data\tracks\dirt-4\dirt-4.xml .\runtimed\tracks\dirt\dirt-4\dirt-4.xml
if exist .\data\tracks\dirt-4\background.png copy .\data\tracks\dirt-4\background.png .\runtimed\tracks\dirt\dirt-4\background.png
if exist .\data\tracks\dirt-4\dirt-4.ac copy .\data\tracks\dirt-4\dirt-4.ac .\runtimed\tracks\dirt\dirt-4\dirt-4.ac
if exist .\data\tracks\dirt-4\dirt-4-relief.ac copy .\data\tracks\dirt-4\dirt-4-relief.ac .\runtimed\tracks\dirt\dirt-4\dirt-4-relief.ac
if exist .\data\tracks\dirt-4\dirt-4.png copy .\data\tracks\dirt-4\dirt-4.png .\runtimed\tracks\dirt\dirt-4\dirt-4.png
:data_tracks_dirt_4

if not exist .\data\tracks\dirt-5 goto data_tracks_dirt_5
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\dirt-5
if exist .\data\tracks\dirt-5\dirt-5.xml copy .\data\tracks\dirt-5\dirt-5.xml .\runtimed\tracks\dirt\dirt-5\dirt-5.xml
if exist .\data\tracks\dirt-5\background.png copy .\data\tracks\dirt-5\background.png .\runtimed\tracks\dirt\dirt-5\background.png
if exist .\data\tracks\dirt-5\dirt-5.ac copy .\data\tracks\dirt-5\dirt-5.ac .\runtimed\tracks\dirt\dirt-5\dirt-5.ac
if exist .\data\tracks\dirt-5\dirt-5.png copy .\data\tracks\dirt-5\dirt-5.png .\runtimed\tracks\dirt\dirt-5\dirt-5.png
:data_tracks_dirt_5

if not exist .\data\tracks\dirt-6 goto data_tracks_dirt_6
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\dirt-6
if exist .\data\tracks\dirt-6\dirt-6.xml copy .\data\tracks\dirt-6\dirt-6.xml .\runtimed\tracks\dirt\dirt-6\dirt-6.xml
if exist .\data\tracks\dirt-6\background.png copy .\data\tracks\dirt-6\background.png .\runtimed\tracks\dirt\dirt-6\background.png
if exist .\data\tracks\dirt-6\dirt-6.ac copy .\data\tracks\dirt-6\dirt-6.ac .\runtimed\tracks\dirt\dirt-6\dirt-6.ac
if exist .\data\tracks\dirt-6\dirt-6.png copy .\data\tracks\dirt-6\dirt-6.png .\runtimed\tracks\dirt\dirt-6\dirt-6.png
:data_tracks_dirt_6

if not exist .\data\tracks\eroad goto data_tracks_eroad
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\eroad
if exist .\data\tracks\eroad\eroad.xml copy .\data\tracks\eroad\eroad.xml .\runtimed\tracks\road\eroad\eroad.xml
if exist .\data\tracks\eroad\background.png copy .\data\tracks\eroad\background.png .\runtimed\tracks\road\eroad\background.png
if exist .\data\tracks\eroad\eroad.ac copy .\data\tracks\eroad\eroad.ac .\runtimed\tracks\road\eroad\eroad.ac
if exist .\data\tracks\eroad\eroad-relief.ac copy .\data\tracks\eroad\eroad-relief.ac .\runtimed\tracks\road\eroad\eroad-relief.ac
if exist .\data\tracks\eroad\eroad.png copy .\data\tracks\eroad\eroad.png .\runtimed\tracks\road\eroad\eroad.png
:data_tracks_eroad

if not exist .\data\tracks\e-track-1 goto data_tracks_e_track_1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\e-track-1
if exist .\data\tracks\e-track-1\e-track-1.xml copy .\data\tracks\e-track-1\e-track-1.xml .\runtimed\tracks\road\e-track-1\e-track-1.xml
if exist .\data\tracks\e-track-1\background.png copy .\data\tracks\e-track-1\background.png .\runtimed\tracks\road\e-track-1\background.png
if exist .\data\tracks\e-track-1\e-track-1.ac copy .\data\tracks\e-track-1\e-track-1.ac .\runtimed\tracks\road\e-track-1\e-track-1.ac
if exist .\data\tracks\e-track-1\e-track-1.png copy .\data\tracks\e-track-1\e-track-1.png .\runtimed\tracks\road\e-track-1\e-track-1.png
:data_tracks_e_track_1

if not exist .\data\tracks\e-track-2 goto data_tracks_e_track_2
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\e-track-2
if exist .\data\tracks\e-track-2\e-track-2.xml copy .\data\tracks\e-track-2\e-track-2.xml .\runtimed\tracks\road\e-track-2\e-track-2.xml
if exist .\data\tracks\e-track-2\e-track-2.acc copy .\data\tracks\e-track-2\e-track-2.acc .\runtimed\tracks\road\e-track-2\e-track-2.acc
if exist .\data\tracks\e-track-2\background.png copy .\data\tracks\e-track-2\background.png .\runtimed\tracks\road\e-track-2\background.png
if exist .\data\tracks\e-track-2\e-track-2.png copy .\data\tracks\e-track-2\e-track-2.png .\runtimed\tracks\road\e-track-2\e-track-2.png
if exist .\data\tracks\e-track-2\env.png copy .\data\tracks\e-track-2\env.png .\runtimed\tracks\road\e-track-2\env.png
if exist .\data\tracks\e-track-2\pylon3.rgb copy .\data\tracks\e-track-2\pylon3.rgb .\runtimed\tracks\road\e-track-2\pylon3.rgb
if exist .\data\tracks\e-track-2\e-track-2.ac copy .\data\tracks\e-track-2\e-track-2.ac .\runtimed\tracks\road\e-track-2\e-track-2.ac
if exist .\data\tracks\e-track-2\e-track-2-relief.ac copy .\data\tracks\e-track-2\e-track-2-relief.ac .\runtimed\tracks\road\e-track-2\e-track-2-relief.ac
if exist .\data\tracks\e-track-2\elevation-map.png copy .\data\tracks\e-track-2\elevation-map.png .\runtimed\tracks\road\e-track-2\elevation-map.png
if exist .\data\tracks\e-track-2\object-map1.png copy .\data\tracks\e-track-2\object-map1.png .\runtimed\tracks\road\e-track-2\object-map1.png
if exist .\data\tracks\e-track-2\object-map2.png copy .\data\tracks\e-track-2\object-map2.png .\runtimed\tracks\road\e-track-2\object-map2.png
:data_tracks_e_track_2

if not exist .\data\tracks\e-track-3 goto data_tracks_e_track_3
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\e-track-3
if exist .\data\tracks\e-track-3\e-track-3.xml copy .\data\tracks\e-track-3\e-track-3.xml .\runtimed\tracks\road\e-track-3\e-track-3.xml
if exist .\data\tracks\e-track-3\background.png copy .\data\tracks\e-track-3\background.png .\runtimed\tracks\road\e-track-3\background.png
if exist .\data\tracks\e-track-3\env.rgb copy .\data\tracks\e-track-3\env.rgb .\runtimed\tracks\road\e-track-3\env.rgb
if exist .\data\tracks\e-track-3\e-track-3.ac copy .\data\tracks\e-track-3\e-track-3.ac .\runtimed\tracks\road\e-track-3\e-track-3.ac
if exist .\data\tracks\e-track-3\e-track-3.png copy .\data\tracks\e-track-3\e-track-3.png .\runtimed\tracks\road\e-track-3\e-track-3.png
:data_tracks_e_track_3

if not exist .\data\tracks\e-track-4 goto data_tracks_e_track_4
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\e-track-4
if exist .\data\tracks\e-track-4\e-track-4.xml copy .\data\tracks\e-track-4\e-track-4.xml .\runtimed\tracks\road\e-track-4\e-track-4.xml
if exist .\data\tracks\e-track-4\background.png copy .\data\tracks\e-track-4\background.png .\runtimed\tracks\road\e-track-4\background.png
if exist .\data\tracks\e-track-4\e-track-4.ac copy .\data\tracks\e-track-4\e-track-4.ac .\runtimed\tracks\road\e-track-4\e-track-4.ac
if exist .\data\tracks\e-track-4\e-track-4.png copy .\data\tracks\e-track-4\e-track-4.png .\runtimed\tracks\road\e-track-4\e-track-4.png
:data_tracks_e_track_4

if not exist .\data\tracks\e-track-5 goto data_tracks_e_track_5
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\oval
call .\create_dir .\runtimed\tracks\oval\e-track-5
if exist .\data\tracks\e-track-5\e-track-5.xml copy .\data\tracks\e-track-5\e-track-5.xml .\runtimed\tracks\oval\e-track-5\e-track-5.xml
if exist .\data\tracks\e-track-5\background.png copy .\data\tracks\e-track-5\background.png .\runtimed\tracks\oval\e-track-5\background.png
if exist .\data\tracks\e-track-5\e-track-5.ac copy .\data\tracks\e-track-5\e-track-5.ac .\runtimed\tracks\oval\e-track-5\e-track-5.ac
if exist .\data\tracks\e-track-5\e-track-5-relief.ac copy .\data\tracks\e-track-5\e-track-5-relief.ac .\runtimed\tracks\oval\e-track-5\e-track-5-relief.ac
if exist .\data\tracks\e-track-5\e-track-5.png copy .\data\tracks\e-track-5\e-track-5.png .\runtimed\tracks\oval\e-track-5\e-track-5.png
:data_tracks_e_track_5

if not exist .\data\tracks\e-track-6 goto data_tracks_e_track_6
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\e-track-6
if exist .\data\tracks\e-track-6\e-track-6.xml copy .\data\tracks\e-track-6\e-track-6.xml .\runtimed\tracks\road\e-track-6\e-track-6.xml
if exist .\data\tracks\e-track-6\background.png copy .\data\tracks\e-track-6\background.png .\runtimed\tracks\road\e-track-6\background.png
if exist .\data\tracks\e-track-6\e-track-6.ac copy .\data\tracks\e-track-6\e-track-6.ac .\runtimed\tracks\road\e-track-6\e-track-6.ac
if exist .\data\tracks\e-track-6\e-track-6.png copy .\data\tracks\e-track-6\e-track-6.png .\runtimed\tracks\road\e-track-6\e-track-6.png
:data_tracks_e_track_6

if not exist .\data\tracks\g-track-1 goto data_tracks_g_track_1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\oval
call .\create_dir .\runtimed\tracks\oval\g-track-1
if exist .\data\tracks\g-track-1\g-track-1.xml copy .\data\tracks\g-track-1\g-track-1.xml .\runtimed\tracks\oval\g-track-1\g-track-1.xml
if exist .\data\tracks\g-track-1\g-track-1.ac copy .\data\tracks\g-track-1\g-track-1.ac .\runtimed\tracks\oval\g-track-1\g-track-1.ac
if exist .\data\tracks\g-track-1\background.png copy .\data\tracks\g-track-1\background.png .\runtimed\tracks\oval\g-track-1\background.png
if exist .\data\tracks\g-track-1\g-track-1.png copy .\data\tracks\g-track-1\g-track-1.png .\runtimed\tracks\oval\g-track-1\g-track-1.png
if exist .\data\tracks\g-track-1\alltree2.rgb copy .\data\tracks\g-track-1\alltree2.rgb .\runtimed\tracks\oval\g-track-1\alltree2.rgb
if exist .\data\tracks\g-track-1\alltree.rgb copy .\data\tracks\g-track-1\alltree.rgb .\runtimed\tracks\oval\g-track-1\alltree.rgb
if exist .\data\tracks\g-track-1\asphalt2.rgb copy .\data\tracks\g-track-1\asphalt2.rgb .\runtimed\tracks\oval\g-track-1\asphalt2.rgb
if exist .\data\tracks\g-track-1\asphalt3.rgb copy .\data\tracks\g-track-1\asphalt3.rgb .\runtimed\tracks\oval\g-track-1\asphalt3.rgb
if exist .\data\tracks\g-track-1\env.rgb copy .\data\tracks\g-track-1\env.rgb .\runtimed\tracks\oval\g-track-1\env.rgb
if exist .\data\tracks\g-track-1\grassg1.rgb copy .\data\tracks\g-track-1\grassg1.rgb .\runtimed\tracks\oval\g-track-1\grassg1.rgb
if exist .\data\tracks\g-track-1\grassg2.rgb copy .\data\tracks\g-track-1\grassg2.rgb .\runtimed\tracks\oval\g-track-1\grassg2.rgb
if exist .\data\tracks\g-track-1\grassg3.rgb copy .\data\tracks\g-track-1\grassg3.rgb .\runtimed\tracks\oval\g-track-1\grassg3.rgb
if exist .\data\tracks\g-track-1\rock2.rgb copy .\data\tracks\g-track-1\rock2.rgb .\runtimed\tracks\oval\g-track-1\rock2.rgb
if exist .\data\tracks\g-track-1\rock3.rgb copy .\data\tracks\g-track-1\rock3.rgb .\runtimed\tracks\oval\g-track-1\rock3.rgb
if exist .\data\tracks\g-track-1\texte1.rgb copy .\data\tracks\g-track-1\texte1.rgb .\runtimed\tracks\oval\g-track-1\texte1.rgb
:data_tracks_g_track_1

if not exist .\data\tracks\michigan goto data_tracks_michigan
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\oval
call .\create_dir .\runtimed\tracks\oval\michigan
if exist .\data\tracks\michigan\michigan.xml copy .\data\tracks\michigan\michigan.xml .\runtimed\tracks\oval\michigan\michigan.xml
if exist .\data\tracks\michigan\background.png copy .\data\tracks\michigan\background.png .\runtimed\tracks\oval\michigan\background.png
if exist .\data\tracks\michigan\michigan.ac copy .\data\tracks\michigan\michigan.ac .\runtimed\tracks\oval\michigan\michigan.ac
if exist .\data\tracks\michigan\michigan.png copy .\data\tracks\michigan\michigan.png .\runtimed\tracks\oval\michigan\michigan.png
:data_tracks_michigan

if not exist .\data\tracks\mixed-1 goto data_tracks_mixed_1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\mixed-1
if exist .\data\tracks\mixed-1\mixed-1.xml copy .\data\tracks\mixed-1\mixed-1.xml .\runtimed\tracks\dirt\mixed-1\mixed-1.xml
if exist .\data\tracks\mixed-1\mixed-1.ac copy .\data\tracks\mixed-1\mixed-1.ac .\runtimed\tracks\dirt\mixed-1\mixed-1.ac
if exist .\data\tracks\mixed-1\background.png copy .\data\tracks\mixed-1\background.png .\runtimed\tracks\dirt\mixed-1\background.png
if exist .\data\tracks\mixed-1\env1.png copy .\data\tracks\mixed-1\env1.png .\runtimed\tracks\dirt\mixed-1\env1.png
if exist .\data\tracks\mixed-1\mixed-1.png copy .\data\tracks\mixed-1\mixed-1.png .\runtimed\tracks\dirt\mixed-1\mixed-1.png
:data_tracks_mixed_1

if not exist .\data\tracks\mixed-2 goto data_tracks_mixed_2
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\dirt
call .\create_dir .\runtimed\tracks\dirt\mixed-2
if exist .\data\tracks\mixed-2\mixed-2.xml copy .\data\tracks\mixed-2\mixed-2.xml .\runtimed\tracks\dirt\mixed-2\mixed-2.xml
if exist .\data\tracks\mixed-2\background.png copy .\data\tracks\mixed-2\background.png .\runtimed\tracks\dirt\mixed-2\background.png
if exist .\data\tracks\mixed-2\env.rgb copy .\data\tracks\mixed-2\env.rgb .\runtimed\tracks\dirt\mixed-2\env.rgb
if exist .\data\tracks\mixed-2\mixed-2.ac copy .\data\tracks\mixed-2\mixed-2.ac .\runtimed\tracks\dirt\mixed-2\mixed-2.ac
if exist .\data\tracks\mixed-2\mixed-2.png copy .\data\tracks\mixed-2\mixed-2.png .\runtimed\tracks\dirt\mixed-2\mixed-2.png
:data_tracks_mixed_2

if not exist .\data\tracks\oval\daytona goto data_tracks_oval_daytona
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\oval
call .\create_dir .\runtimed\tracks\oval\daytona
if exist .\data\tracks\oval\daytona\daytona.xml copy .\data\tracks\oval\daytona\daytona.xml .\runtimed\tracks\oval\daytona\daytona.xml
if exist .\data\tracks\oval\daytona\daytona.ac copy .\data\tracks\oval\daytona\daytona.ac .\runtimed\tracks\oval\daytona\daytona.ac
if exist .\data\tracks\oval\daytona\daytona.png copy .\data\tracks\oval\daytona\daytona.png .\runtimed\tracks\oval\daytona\daytona.png
:data_tracks_oval_daytona

if not exist .\data\tracks\road\alpine-1 goto data_tracks_road_alpine_1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\alpine-1
if exist .\data\tracks\road\alpine-1\alpine-1.xml copy .\data\tracks\road\alpine-1\alpine-1.xml .\runtimed\tracks\road\alpine-1\alpine-1.xml
if exist .\data\tracks\road\alpine-1\alpine-1.ac copy .\data\tracks\road\alpine-1\alpine-1.ac .\runtimed\tracks\road\alpine-1\alpine-1.ac
if exist .\data\tracks\road\alpine-1\alpine-1.png copy .\data\tracks\road\alpine-1\alpine-1.png .\runtimed\tracks\road\alpine-1\alpine-1.png
if exist .\data\tracks\road\alpine-1\elevation-map.png copy .\data\tracks\road\alpine-1\elevation-map.png .\runtimed\tracks\road\alpine-1\elevation-map.png
if exist .\data\tracks\road\alpine-1\relief.ac copy .\data\tracks\road\alpine-1\relief.ac .\runtimed\tracks\road\alpine-1\relief.ac
if exist .\data\tracks\road\alpine-1\background.png copy .\data\tracks\road\alpine-1\background.png .\runtimed\tracks\road\alpine-1\background.png
:data_tracks_road_alpine_1

if not exist .\data\tracks\road\ep-pau goto data_tracks_road_ep_pau
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\ep-pau
if exist .\data\tracks\road\ep-pau\ep-pau.xml copy .\data\tracks\road\ep-pau\ep-pau.xml .\runtimed\tracks\road\ep-pau\ep-pau.xml
if exist .\data\tracks\road\ep-pau\ep-pau.ac copy .\data\tracks\road\ep-pau\ep-pau.ac .\runtimed\tracks\road\ep-pau\ep-pau.ac
:data_tracks_road_ep_pau

if not exist .\data\tracks\road\g-track-2 goto data_tracks_road_g_track_2
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\g-track-2
if exist .\data\tracks\road\g-track-2\g-track-2.xml copy .\data\tracks\road\g-track-2\g-track-2.xml .\runtimed\tracks\road\g-track-2\g-track-2.xml
if exist .\data\tracks\road\g-track-2\g-track-2.acc copy .\data\tracks\road\g-track-2\g-track-2.acc .\runtimed\tracks\road\g-track-2\g-track-2.acc
if exist .\data\tracks\road\g-track-2\g-track-2.ac copy .\data\tracks\road\g-track-2\g-track-2.ac .\runtimed\tracks\road\g-track-2\g-track-2.ac
if exist .\data\tracks\road\g-track-2\g-track-2-relief.ac copy .\data\tracks\road\g-track-2\g-track-2-relief.ac .\runtimed\tracks\road\g-track-2\g-track-2-relief.ac
if exist .\data\tracks\road\g-track-2\g-track-2.png copy .\data\tracks\road\g-track-2\g-track-2.png .\runtimed\tracks\road\g-track-2\g-track-2.png
if exist .\data\tracks\road\g-track-2\background.png copy .\data\tracks\road\g-track-2\background.png .\runtimed\tracks\road\g-track-2\background.png
if exist .\data\tracks\road\g-track-2\alltree.rgb copy .\data\tracks\road\g-track-2\alltree.rgb .\runtimed\tracks\road\g-track-2\alltree.rgb
if exist .\data\tracks\road\g-track-2\arbor01.rgb copy .\data\tracks\road\g-track-2\arbor01.rgb .\runtimed\tracks\road\g-track-2\arbor01.rgb
if exist .\data\tracks\road\g-track-2\asasphr.rgb copy .\data\tracks\road\g-track-2\asasphr.rgb .\runtimed\tracks\road\g-track-2\asasphr.rgb
if exist .\data\tracks\road\g-track-2\asb2l.rgb copy .\data\tracks\road\g-track-2\asb2l.rgb .\runtimed\tracks\road\g-track-2\asb2l.rgb
if exist .\data\tracks\road\g-track-2\asb2r.rgb copy .\data\tracks\road\g-track-2\asb2r.rgb .\runtimed\tracks\road\g-track-2\asb2r.rgb
if exist .\data\tracks\road\g-track-2\asconcr.rgb copy .\data\tracks\road\g-track-2\asconcr.rgb .\runtimed\tracks\road\g-track-2\asconcr.rgb
if exist .\data\tracks\road\g-track-2\asgrassr.rgb copy .\data\tracks\road\g-track-2\asgrassr.rgb .\runtimed\tracks\road\g-track-2\asgrassr.rgb
if exist .\data\tracks\road\g-track-2\asphalt3.rgb copy .\data\tracks\road\g-track-2\asphalt3.rgb .\runtimed\tracks\road\g-track-2\asphalt3.rgb
if exist .\data\tracks\road\g-track-2\asphalt4.rgb copy .\data\tracks\road\g-track-2\asphalt4.rgb .\runtimed\tracks\road\g-track-2\asphalt4.rgb
if exist .\data\tracks\road\g-track-2\asphalt.rgb copy .\data\tracks\road\g-track-2\asphalt.rgb .\runtimed\tracks\road\g-track-2\asphalt.rgb
if exist .\data\tracks\road\g-track-2\asp_n.rgb copy .\data\tracks\road\g-track-2\asp_n.rgb .\runtimed\tracks\road\g-track-2\asp_n.rgb
if exist .\data\tracks\road\g-track-2\assandr.rgb copy .\data\tracks\road\g-track-2\assandr.rgb .\runtimed\tracks\road\g-track-2\assandr.rgb
if exist .\data\tracks\road\g-track-2\astiled.rgb copy .\data\tracks\road\g-track-2\astiled.rgb .\runtimed\tracks\road\g-track-2\astiled.rgb
if exist .\data\tracks\road\g-track-2\barg1_n.rgb copy .\data\tracks\road\g-track-2\barg1_n.rgb .\runtimed\tracks\road\g-track-2\barg1_n.rgb
if exist .\data\tracks\road\g-track-2\barg2.rgb copy .\data\tracks\road\g-track-2\barg2.rgb .\runtimed\tracks\road\g-track-2\barg2.rgb
if exist .\data\tracks\road\g-track-2\barg3.rgb copy .\data\tracks\road\g-track-2\barg3.rgb .\runtimed\tracks\road\g-track-2\barg3.rgb
if exist .\data\tracks\road\g-track-2\barr1.rgb copy .\data\tracks\road\g-track-2\barr1.rgb .\runtimed\tracks\road\g-track-2\barr1.rgb
if exist .\data\tracks\road\g-track-2\concdal.rgb copy .\data\tracks\road\g-track-2\concdal.rgb .\runtimed\tracks\road\g-track-2\concdal.rgb
if exist .\data\tracks\road\g-track-2\gconcrete.rgb copy .\data\tracks\road\g-track-2\gconcrete.rgb .\runtimed\tracks\road\g-track-2\gconcrete.rgb
if exist .\data\tracks\road\g-track-2\grassg1.rgb copy .\data\tracks\road\g-track-2\grassg1.rgb .\runtimed\tracks\road\g-track-2\grassg1.rgb
if exist .\data\tracks\road\g-track-2\grassg3.rgb copy .\data\tracks\road\g-track-2\grassg3.rgb .\runtimed\tracks\road\g-track-2\grassg3.rgb
if exist .\data\tracks\road\g-track-2\grtiled.rgb copy .\data\tracks\road\g-track-2\grtiled.rgb .\runtimed\tracks\road\g-track-2\grtiled.rgb
if exist .\data\tracks\road\g-track-2\gsand.rgb copy .\data\tracks\road\g-track-2\gsand.rgb .\runtimed\tracks\road\g-track-2\gsand.rgb
if exist .\data\tracks\road\g-track-2\gsandtiled.rgb copy .\data\tracks\road\g-track-2\gsandtiled.rgb .\runtimed\tracks\road\g-track-2\gsandtiled.rgb
if exist .\data\tracks\road\g-track-2\gtirewall.rgb copy .\data\tracks\road\g-track-2\gtirewall.rgb .\runtimed\tracks\road\g-track-2\gtirewall.rgb
if exist .\data\tracks\road\g-track-2\poutre3.rgb copy .\data\tracks\road\g-track-2\poutre3.rgb .\runtimed\tracks\road\g-track-2\poutre3.rgb
if exist .\data\tracks\road\g-track-2\poutre4.rgb copy .\data\tracks\road\g-track-2\poutre4.rgb .\runtimed\tracks\road\g-track-2\poutre4.rgb
if exist .\data\tracks\road\g-track-2\reflect.rgb copy .\data\tracks\road\g-track-2\reflect.rgb .\runtimed\tracks\road\g-track-2\reflect.rgb
if exist .\data\tracks\road\g-track-2\rock4.rgb copy .\data\tracks\road\g-track-2\rock4.rgb .\runtimed\tracks\road\g-track-2\rock4.rgb
if exist .\data\tracks\road\g-track-2\spec.rgb copy .\data\tracks\road\g-track-2\spec.rgb .\runtimed\tracks\road\g-track-2\spec.rgb
if exist .\data\tracks\road\g-track-2\std.rgb copy .\data\tracks\road\g-track-2\std.rgb .\runtimed\tracks\road\g-track-2\std.rgb
if exist .\data\tracks\road\g-track-2\tent.rgb copy .\data\tracks\road\g-track-2\tent.rgb .\runtimed\tracks\road\g-track-2\tent.rgb
if exist .\data\tracks\road\g-track-2\torcs0.rgb copy .\data\tracks\road\g-track-2\torcs0.rgb .\runtimed\tracks\road\g-track-2\torcs0.rgb
if exist .\data\tracks\road\g-track-2\torcs1.rgb copy .\data\tracks\road\g-track-2\torcs1.rgb .\runtimed\tracks\road\g-track-2\torcs1.rgb
if exist .\data\tracks\road\g-track-2\torcs2.rgb copy .\data\tracks\road\g-track-2\torcs2.rgb .\runtimed\tracks\road\g-track-2\torcs2.rgb
if exist .\data\tracks\road\g-track-2\trcurbl.rgb copy .\data\tracks\road\g-track-2\trcurbl.rgb .\runtimed\tracks\road\g-track-2\trcurbl.rgb
if exist .\data\tracks\road\g-track-2\trcurbr.rgb copy .\data\tracks\road\g-track-2\trcurbr.rgb .\runtimed\tracks\road\g-track-2\trcurbr.rgb
if exist .\data\tracks\road\g-track-2\treecl1.rgb copy .\data\tracks\road\g-track-2\treecl1.rgb .\runtimed\tracks\road\g-track-2\treecl1.rgb
if exist .\data\tracks\road\g-track-2\treewate.rgb copy .\data\tracks\road\g-track-2\treewate.rgb .\runtimed\tracks\road\g-track-2\treewate.rgb
:data_tracks_road_g_track_2

if not exist .\data\tracks\road\g-track-3 goto data_tracks_road_g_track_3
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\g-track-3
if exist .\data\tracks\road\g-track-3\g-track-3.xml copy .\data\tracks\road\g-track-3\g-track-3.xml .\runtimed\tracks\road\g-track-3\g-track-3.xml
if exist .\data\tracks\road\g-track-3\g-track-3.acc copy .\data\tracks\road\g-track-3\g-track-3.acc .\runtimed\tracks\road\g-track-3\g-track-3.acc
if exist .\data\tracks\road\g-track-3\background.png copy .\data\tracks\road\g-track-3\background.png .\runtimed\tracks\road\g-track-3\background.png
if exist .\data\tracks\road\g-track-3\env.png copy .\data\tracks\road\g-track-3\env.png .\runtimed\tracks\road\g-track-3\env.png
if exist .\data\tracks\road\g-track-3\envshadow.png copy .\data\tracks\road\g-track-3\envshadow.png .\runtimed\tracks\road\g-track-3\envshadow.png
if exist .\data\tracks\road\g-track-3\g-track-3.png copy .\data\tracks\road\g-track-3\g-track-3.png .\runtimed\tracks\road\g-track-3\g-track-3.png
if exist .\data\tracks\road\g-track-3\arbor01.rgb copy .\data\tracks\road\g-track-3\arbor01.rgb .\runtimed\tracks\road\g-track-3\arbor01.rgb
if exist .\data\tracks\road\g-track-3\asasphr.rgb copy .\data\tracks\road\g-track-3\asasphr.rgb .\runtimed\tracks\road\g-track-3\asasphr.rgb
if exist .\data\tracks\road\g-track-3\asb2l.rgb copy .\data\tracks\road\g-track-3\asb2l.rgb .\runtimed\tracks\road\g-track-3\asb2l.rgb
if exist .\data\tracks\road\g-track-3\asconcr.rgb copy .\data\tracks\road\g-track-3\asconcr.rgb .\runtimed\tracks\road\g-track-3\asconcr.rgb
if exist .\data\tracks\road\g-track-3\asgrassr_n.rgb copy .\data\tracks\road\g-track-3\asgrassr_n.rgb .\runtimed\tracks\road\g-track-3\asgrassr_n.rgb
if exist .\data\tracks\road\g-track-3\asphalt4.rgb copy .\data\tracks\road\g-track-3\asphalt4.rgb .\runtimed\tracks\road\g-track-3\asphalt4.rgb
if exist .\data\tracks\road\g-track-3\asp_n.rgb copy .\data\tracks\road\g-track-3\asp_n.rgb .\runtimed\tracks\road\g-track-3\asp_n.rgb
if exist .\data\tracks\road\g-track-3\asp.rgb copy .\data\tracks\road\g-track-3\asp.rgb .\runtimed\tracks\road\g-track-3\asp.rgb
if exist .\data\tracks\road\g-track-3\assandr.rgb copy .\data\tracks\road\g-track-3\assandr.rgb .\runtimed\tracks\road\g-track-3\assandr.rgb
if exist .\data\tracks\road\g-track-3\astiled.rgb copy .\data\tracks\road\g-track-3\astiled.rgb .\runtimed\tracks\road\g-track-3\astiled.rgb
if exist .\data\tracks\road\g-track-3\barg1_n.rgb copy .\data\tracks\road\g-track-3\barg1_n.rgb .\runtimed\tracks\road\g-track-3\barg1_n.rgb
if exist .\data\tracks\road\g-track-3\barg2.rgb copy .\data\tracks\road\g-track-3\barg2.rgb .\runtimed\tracks\road\g-track-3\barg2.rgb
if exist .\data\tracks\road\g-track-3\barg3.rgb copy .\data\tracks\road\g-track-3\barg3.rgb .\runtimed\tracks\road\g-track-3\barg3.rgb
if exist .\data\tracks\road\g-track-3\barg4.rgb copy .\data\tracks\road\g-track-3\barg4.rgb .\runtimed\tracks\road\g-track-3\barg4.rgb
if exist .\data\tracks\road\g-track-3\barr1.rgb copy .\data\tracks\road\g-track-3\barr1.rgb .\runtimed\tracks\road\g-track-3\barr1.rgb
if exist .\data\tracks\road\g-track-3\concdal.rgb copy .\data\tracks\road\g-track-3\concdal.rgb .\runtimed\tracks\road\g-track-3\concdal.rgb
if exist .\data\tracks\road\g-track-3\gconcrete.rgb copy .\data\tracks\road\g-track-3\gconcrete.rgb .\runtimed\tracks\road\g-track-3\gconcrete.rgb
if exist .\data\tracks\road\g-track-3\ggrass3.rgb copy .\data\tracks\road\g-track-3\ggrass3.rgb .\runtimed\tracks\road\g-track-3\ggrass3.rgb
if exist .\data\tracks\road\g-track-3\ground0.rgb copy .\data\tracks\road\g-track-3\ground0.rgb .\runtimed\tracks\road\g-track-3\ground0.rgb
if exist .\data\tracks\road\g-track-3\ground1.rgb copy .\data\tracks\road\g-track-3\ground1.rgb .\runtimed\tracks\road\g-track-3\ground1.rgb
if exist .\data\tracks\road\g-track-3\grtiled.rgb copy .\data\tracks\road\g-track-3\grtiled.rgb .\runtimed\tracks\road\g-track-3\grtiled.rgb
if exist .\data\tracks\road\g-track-3\gsand.rgb copy .\data\tracks\road\g-track-3\gsand.rgb .\runtimed\tracks\road\g-track-3\gsand.rgb
if exist .\data\tracks\road\g-track-3\gsandtiled.rgb copy .\data\tracks\road\g-track-3\gsandtiled.rgb .\runtimed\tracks\road\g-track-3\gsandtiled.rgb
if exist .\data\tracks\road\g-track-3\gtirewall.rgb copy .\data\tracks\road\g-track-3\gtirewall.rgb .\runtimed\tracks\road\g-track-3\gtirewall.rgb
if exist .\data\tracks\road\g-track-3\house.rgb copy .\data\tracks\road\g-track-3\house.rgb .\runtimed\tracks\road\g-track-3\house.rgb
if exist .\data\tracks\road\g-track-3\mur2.rgb copy .\data\tracks\road\g-track-3\mur2.rgb .\runtimed\tracks\road\g-track-3\mur2.rgb
if exist .\data\tracks\road\g-track-3\road1.rgb copy .\data\tracks\road\g-track-3\road1.rgb .\runtimed\tracks\road\g-track-3\road1.rgb
if exist .\data\tracks\road\g-track-3\road2.rgb copy .\data\tracks\road\g-track-3\road2.rgb .\runtimed\tracks\road\g-track-3\road2.rgb
if exist .\data\tracks\road\g-track-3\road3.rgb copy .\data\tracks\road\g-track-3\road3.rgb .\runtimed\tracks\road\g-track-3\road3.rgb
if exist .\data\tracks\road\g-track-3\road4.rgb copy .\data\tracks\road\g-track-3\road4.rgb .\runtimed\tracks\road\g-track-3\road4.rgb
if exist .\data\tracks\road\g-track-3\road5.rgb copy .\data\tracks\road\g-track-3\road5.rgb .\runtimed\tracks\road\g-track-3\road5.rgb
if exist .\data\tracks\road\g-track-3\rockg0.rgb copy .\data\tracks\road\g-track-3\rockg0.rgb .\runtimed\tracks\road\g-track-3\rockg0.rgb
if exist .\data\tracks\road\g-track-3\shadow2.rgb copy .\data\tracks\road\g-track-3\shadow2.rgb .\runtimed\tracks\road\g-track-3\shadow2.rgb
if exist .\data\tracks\road\g-track-3\torcs0.rgb copy .\data\tracks\road\g-track-3\torcs0.rgb .\runtimed\tracks\road\g-track-3\torcs0.rgb
if exist .\data\tracks\road\g-track-3\torcs1.rgb copy .\data\tracks\road\g-track-3\torcs1.rgb .\runtimed\tracks\road\g-track-3\torcs1.rgb
if exist .\data\tracks\road\g-track-3\torcs2.rgb copy .\data\tracks\road\g-track-3\torcs2.rgb .\runtimed\tracks\road\g-track-3\torcs2.rgb
if exist .\data\tracks\road\g-track-3\trcurbl.rgb copy .\data\tracks\road\g-track-3\trcurbl.rgb .\runtimed\tracks\road\g-track-3\trcurbl.rgb
if exist .\data\tracks\road\g-track-3\trcurbr.rgb copy .\data\tracks\road\g-track-3\trcurbr.rgb .\runtimed\tracks\road\g-track-3\trcurbr.rgb
if exist .\data\tracks\road\g-track-3\treebui1.rgb copy .\data\tracks\road\g-track-3\treebui1.rgb .\runtimed\tracks\road\g-track-3\treebui1.rgb
if exist .\data\tracks\road\g-track-3\treeg10.rgb copy .\data\tracks\road\g-track-3\treeg10.rgb .\runtimed\tracks\road\g-track-3\treeg10.rgb
if exist .\data\tracks\road\g-track-3\truck0.rgb copy .\data\tracks\road\g-track-3\truck0.rgb .\runtimed\tracks\road\g-track-3\truck0.rgb
if exist .\data\tracks\road\g-track-3\truck1.rgb copy .\data\tracks\road\g-track-3\truck1.rgb .\runtimed\tracks\road\g-track-3\truck1.rgb
if exist .\data\tracks\road\g-track-3\walls2.rgb copy .\data\tracks\road\g-track-3\walls2.rgb .\runtimed\tracks\road\g-track-3\walls2.rgb
if exist .\data\tracks\road\g-track-3\walls.rgb copy .\data\tracks\road\g-track-3\walls.rgb .\runtimed\tracks\road\g-track-3\walls.rgb
:data_tracks_road_g_track_3

if not exist .\data\tracks\wheel-1 goto data_tracks_wheel_1
call .\create_dir .\runtimed
call .\create_dir .\runtimed\tracks
call .\create_dir .\runtimed\tracks\road
call .\create_dir .\runtimed\tracks\road\wheel-1
if exist .\data\tracks\wheel-1\wheel-1.xml copy .\data\tracks\wheel-1\wheel-1.xml .\runtimed\tracks\road\wheel-1\wheel-1.xml
if exist .\data\tracks\wheel-1\background.png copy .\data\tracks\wheel-1\background.png .\runtimed\tracks\road\wheel-1\background.png
if exist .\data\tracks\wheel-1\env.rgb copy .\data\tracks\wheel-1\env.rgb .\runtimed\tracks\road\wheel-1\env.rgb
if exist .\data\tracks\wheel-1\wheel-1.ac copy .\data\tracks\wheel-1\wheel-1.ac .\runtimed\tracks\road\wheel-1\wheel-1.ac
if exist .\data\tracks\wheel-1\wheel-1.png copy .\data\tracks\wheel-1\wheel-1.png .\runtimed\tracks\road\wheel-1\wheel-1.png
:data_tracks_wheel_1

if not exist . goto _home_torcs_sb3_torcs_torcs
call .\create_dir .\runtimed
call .\create_dir .\runtimed\.
if exist .\CHANGELOG.html copy .\CHANGELOG.html .\runtimed\.\CHANGELOG.html
if exist .\COPYING copy .\COPYING .\runtimed\.\COPYING
:_home_torcs_sb3_torcs_torcs
