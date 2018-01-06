
endogenous pai, "Inflation", y, "Output gap", r, "Interest rate"
exogenous EPS_Y,  "Output shock", EPS_PAI,  "Inflation shock", EPS_R,  "Monetary policy shock"

% Macierz przejścia
% [0.91, 0.09 ; 0.09, 0.091];
% Polityka aktywna - 1, pasywna = 2

parameters alph, betta, kappa, rhor, gamma, a_tp_1_2, a_tp_2_1
parameters(a,2) delta, epsi


model

	y = y(+1) - alph*(r - pai(+1)- gamma) + EPS_Y;
	pai = betta * pai(+1) + (1-betta) * pai(-1) + kappa*y + EPS_PAI;
	r = gamma + delta * y + epsi * pai + rhor * (r(-1) - gamma) + EPS_R;

	
parameterization

	a_tp_1_2, 0.09;
	a_tp_2_1, 0.09;
	
	alph,.15;
	
	betta, 0.5;
	
    delta(a,1),0.6;
    delta(a,2),0.4;
	
	epsi(a,1), 1.45;
    epsi(a,2), 0.4;
    
	kappa, 0.03;
	rhor, 0.8;
	gamma, 0.01;
	


