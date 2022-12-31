// Take Home Q1.

var c n i w y pi; // Define endogenous variables
varexo e; // Define exogenous variables
parameters phi gamma beta psi epsilon lambda rho; // Define parameters variables
phi = 0.6; 
gamma = 1;
beta = 0.95; // discount rate
psi = 0.5; 
epsilon = 1.2;
lambda = 1.5;
rho = 0.9; 

model;
w = phi*c*n^(gamma); 
1/c=beta*(1/(c(+1)))*((1+i)/(1+pi(+1)));
psi*pi*(1+pi) = (1/(1-epsilon))*(1-epsilon*w)*n
 + beta*psi*(pi(+1))*(1+(pi(+1)));
y = n;
n = c+(psi/2)*pi^2;
i = rho*(i(-1))+(1-rho)*(1/beta-1)+lambda*pi+e;
end;

steady_state_model;
    c = 1/((phi*epsilon)^(1/(gamma+1)));
    i = 1/beta-1;
    w = 1/epsilon;
    n = 1/((phi*epsilon)^(1/(gamma+1)));
    y = 1/((phi*epsilon)^(1/(gamma+1)));
    pi = 0;
end;

steady; // calculate the steady state

shocks;
    var e; // type of the shock
    stderr 0.01; 
end;

check;
stoch_simul(order=1,irf=40,hp_filter=1600);