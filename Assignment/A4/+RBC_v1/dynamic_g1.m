function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = RBC_v1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(8, 13);
g1(1,3)=(-1)/(y(3)*y(3));
g1(1,11)=(-((1+y(12)-params(2))*1/(1+params(1))*(-(1+params(6)))/(y(11)*(1+params(6))*y(11)*(1+params(6)))));
g1(1,12)=(-T(1));
g1(2,3)=(-((-y(6))/(y(3)*y(3))));
g1(2,5)=getPowerDeriv(y(5),params(3),1);
g1(2,6)=(-(1/y(3)));
g1(3,1)=(-(T(5)*params(4)*y(8)*1/(1+params(6))*getPowerDeriv(T(2),params(4)-1,1)));
g1(3,5)=(-(T(4)*T(9)));
g1(3,7)=1;
g1(3,8)=(-(T(5)*params(4)*T(3)));
g1(4,1)=(-(T(7)*y(8)*(1-params(4))*T(8)));
g1(4,5)=(-(y(8)*(1-params(4))*T(6)*getPowerDeriv(y(5),(-params(4)),1)));
g1(4,6)=1;
g1(4,8)=(-(T(7)*(1-params(4))*T(6)));
g1(5,3)=1;
g1(5,1)=(-((1-params(2))*1/(1+params(6))+T(5)*y(8)*T(8)));
g1(5,4)=1;
g1(5,5)=(-(y(8)*T(6)*T(9)));
g1(5,8)=(-(T(5)*T(6)));
g1(6,2)=(-(params(5)*1/y(2)));
g1(6,8)=1/y(8);
g1(6,13)=(-1);
g1(7,1)=(-(T(5)*y(8)*T(8)));
g1(7,5)=(-(y(8)*T(6)*T(9)));
g1(7,8)=(-(T(5)*T(6)));
g1(7,9)=1;
g1(8,1)=(1-params(2))*1/(1+params(6));
g1(8,4)=(-1);
g1(8,10)=1;

end
