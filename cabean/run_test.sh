cat > example.ispl <<EOF
Agent M
	Vars:	
		x1: boolean;
		x2: boolean;	
		x3: boolean;
		x4: boolean;
		x5: boolean;
		x6: boolean;
		end Vars
	Actions = {none};
	Protocol:
		Other: {none};
	end Protocol
	Evolution:
		x1=true if  x2=true;
		x1=false if  x2=false;	
		x2=true if  x1=true;
		x2=false if  x1=false;
		x3=true if  (~x2)|x4=true;
		x3=false if  (~x2)|x4=false;
		x4=true if  x3=true;
		x4=false if  x3=false;
		x5=true if  (x1|x6)&x5=true;
		x5=false if  (x1|x6)&x5=false;
		x6=true if x4&x5=true;
		x6=false if x4&x5=false;
	end Evolution
end Agent

InitStates
		M.x1=true or M.x1=false;
end InitStates
EOF
cabean -steadystates -asynbn -newtarjan -newpred -compositional 2 -control AST -allpairs example.ispl
