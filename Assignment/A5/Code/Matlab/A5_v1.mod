//Name: A5_v1.mod
//Author: Yu Xia (Based on Prof Zervou's file RBC_yes)
//Description: the file used for A5 Long 1
//Last updated: Nov 6, 2022

var pi c m1 m2 i im s chi; //Define endogenous variables
varexo e;

parameters rho y d lambda; //Define parameters 
rho = 0.03; // the rate of time preference parameter that implies beta=1/(1+0.03) = 0.97
y = 100;
d = 100; //Ignore firms' problem
lambda = 0.97; //persistence of productivity shock

model;
pi = (m1(-1)+(1+im(-1))*m2(-1))/(c+m1+m2+s-y-s-d)-1;
m1 = m1(-1)/(1+pi);
m2 = (1+im(-1))*m2/(1+pi);
c = (1+pi(+1))*c(+1)/((1/(1+rho))*(1+i));
1/m1 = 1/c-(1/(1+rho))/((1+pi(+1))*c(+1));
chi/m2 = 1/c-(1/(1+rho))*(1+im)/((1+pi(+1))*c(+1));
1+i = ((1+pi)*(s(+1)+d))/s;
log(chi) = lambda*log(chi(-1))+e;
end;

steady_state_model;
chi = 1;
im = 0;
pi = 0;
c = y+d;
i = 1/((1/(1+rho))*(1+pi))-1;
m1 = c*(1+pi)/(1+pi-(1/(1+rho)));
m2 = chi*c/(1+pi-(1/(1+rho))*(1+im));
s = d*(1+pi)/(i-pi);
end;

steady;

shocks;
var e; stderr 0.01;
end;

check;
stoch_simul(order=1,irf=40,hp_filter=1600);