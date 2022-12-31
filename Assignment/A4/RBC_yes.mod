//Simple RBC model, see supposting document.

var C K N w r A; //Define endogenous variables
varexo e;

parameters rho delta gamma alpha lambda g; //Define parameters and exogenous variables
alpha = 0.33; //capital share
delta = 0.1;// capital depreciation rate
rho = 0.03; // the rate of time preference parameter that implies beta=1/(1+0.03) = 0.97
lambda = 0.97; //persistence of productivity shock
gamma = 0;  //leisure parameter 
g = 0.015;  //economy's growth

model;
1/C=1/(1+rho)*(1/(C(+1)*(1+g)))*(r(+1)+1-delta);
N^gamma = w/C; 
r = alpha*A*(K(-1)/(1+g))^(alpha-1)*N^(1-alpha);
w = (1-alpha)*A*(K(-1)/(1+g))^alpha*N^(-alpha);
K+C = (K(-1)/(1+g))*(1-delta)
+A*(K(-1)/(1+g))^alpha*N^(1-alpha);
log(A) = lambda*log(A(-1))+e;
end;

steady_state_model;
A = 1;
r = (1+g)*(1+rho)+delta-1;
N = ((1-alpha)/(r/alpha-delta-g))*r/alpha;
K = (1+g)*(r/alpha)^(1/(alpha-1))*N;
C = (1-delta)*K/(1+g)
+(K/(1+g))^alpha*N^(1-alpha)-K;
w = C;
end;

steady;

shocks;
var e; stderr 0.01;
end;

check;
stoch_simul(order=1,irf=40,hp_filter=1600);