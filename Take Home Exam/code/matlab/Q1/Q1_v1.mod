// Take Home Q1.

var c k n r w y a g; // Define endogenous variables
varexo eg ea; // Define exogenous variables
parameters beta delta alpha rhog rhoa phi; // Define parameters variables
alpha = 0.3; // capital share
beta = 0.95; // discount rate
phi = 0.6; // parameter in the consumer's utility: scale parameter
delta = 0.025;// capital depreciation rate
rhog = 0.9; // auto-correlation of g
rhoa = 0.9; // auto-correlation of a

model;
1/c=beta*(1/(c(+1)))*(r(+1)+1-delta);
w = phi*c; 
r = alpha*a*(k(-1))^(alpha-1)*n^(1-alpha);
w = (1-alpha)*a*(k(-1))^alpha*n^(-alpha);
k+c+g = (k(-1))*(1-delta)
+a*(k(-1))^alpha*n^(1-alpha);
log(a) = rhoa*log(a(-1))+ea;
y = a*(k(-1))^alpha*n^(1-alpha);
g = rhog*g(-1)+eg;
end;

steady_state_model;
    a = 1;
    g = 0;
    r = 1/beta - (1-delta);
    c = r/phi * (1-alpha)/alpha * (r/alpha)^(1/(alpha-1));
    w = phi*c;
    n = c / ( (r/alpha)^(alpha/(alpha-1)) - delta*(r/alpha)^(1/(alpha-1)));
    k = alpha/(1-alpha) * w/r *n;
    y = n^(1-alpha)*k^(alpha);
end;

steady; // calculate the steady state

shocks;
    var ea; // type of the shock
    stderr 0.01; // Scale of the shock
    var eg; // type of the shock
    stderr 0.01; // Scale of the shock
end;

check;
stoch_simul(order=1,irf=40,hp_filter=1600);