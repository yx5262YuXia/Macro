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
    T = Q1_v1.static_resid_tt(T, y, x, params);
end
residual = zeros(8, 1);
lhs = 1/y(1);
rhs = 1/y(1)*params(1)*(1+y(4)-params(2));
residual(1) = lhs - rhs;
lhs = y(5);
rhs = y(1)*params(6);
residual(2) = lhs - rhs;
lhs = y(4);
rhs = T(2)*T(3);
residual(3) = lhs - rhs;
lhs = y(5);
rhs = y(7)*(1-params(3))*T(4)*T(5);
residual(4) = lhs - rhs;
lhs = y(1)+y(2)+y(8);
rhs = y(2)*(1-params(2))+T(3)*y(7)*T(4);
residual(5) = lhs - rhs;
lhs = log(y(7));
rhs = log(y(7))*params(5)+x(2);
residual(6) = lhs - rhs;
lhs = y(6);
rhs = T(3)*y(7)*T(4);
residual(7) = lhs - rhs;
lhs = y(8);
rhs = y(8)*params(4)+x(1);
residual(8) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
