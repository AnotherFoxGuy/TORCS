#ifndef __GRMULTI
#define __GRMULTI
class  grMultiTexState : public ssgSimpleState
{
	public:
		~grMultiTexState() {}
		virtual void apply (int unit) ;
};
#endif
