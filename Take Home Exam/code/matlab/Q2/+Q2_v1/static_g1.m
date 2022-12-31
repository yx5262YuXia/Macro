function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = Q2_v1.static_g1_tt(T, y, x, params);
end
g1 = zeros(6, 6);
g1(1,1)=(-(params(1)*T(1)));
g1(1,2)=(-(params(1)*y(1)*getPowerDeriv(y(2),params(2),1)));
g1(1,4)=1;
g1(2,1)=(-1)/(y(1)*y(1))-(1+y(3))/(1+y(6))*params(3)*(-1)/(y(1)*y(1));
g1(2,3)=(-(1/y(1)*params(3)*1/(1+y(6))));
g1(2,6)=(-(1/y(1)*params(3)*(-(1+y(3)))/((1+y(6))*(1+y(6)))));
g1(3,2)=(-(1/(1-params(5))*(1-y(4)*params(5))));
g1(3,4)=(-(y(2)*1/(1-params(5))*(-params(5))));
g1(3,6)=y(6)*params(4)+(1+y(6))*params(4)-(y(6)*params(3)*params(4)+(1+y(6))*params(3)*params(4));
g1(4,2)=(-1);
g1(4,5)=1;
g1(5,1)=(-1);
g1(5,2)=1;
g1(5,6)=(-(params(4)/2*2*y(6)));
g1(6,3)=1-params(7);
g1(6,6)=(-params(6));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
