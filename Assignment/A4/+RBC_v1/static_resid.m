function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = RBC_v1.static_resid_tt(T, y, x, params);
end
residual = zeros(8, 1);
lhs = 1/y(1);
rhs = T(1)*(1+y(5)-params(2));
residual(1) = lhs - rhs;
lhs = y(3)^params(3);
rhs = y(4)/y(1);
residual(2) = lhs - rhs;
lhs = y(5);
rhs = T(4)*T(5);
residual(3) = lhs - rhs;
lhs = y(4);
rhs = y(6)*(1-params(4))*T(6)*T(7);
residual(4) = lhs - rhs;
lhs = y(1)+y(2);
rhs = T(2)*(1-params(2))+T(5)*y(6)*T(6);
residual(5) = lhs - rhs;
lhs = log(y(6));
rhs = log(y(6))*params(5)+x(1);
residual(6) = lhs - rhs;
lhs = y(7);
rhs = T(5)*y(6)*T(6);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = y(2)-T(2)*(1-params(2));
residual(8) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
