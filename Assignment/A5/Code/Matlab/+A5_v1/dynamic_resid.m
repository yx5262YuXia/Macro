function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
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
%   residual
%

if T_flag
    T = A5_v1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(8, 1);
lhs = y(5);
rhs = (y(1)+(1+y(3))*y(2))/(y(6)+y(7)+y(8)+y(11)-params(2)-y(11)-params(3))-1;
residual(1) = lhs - rhs;
lhs = y(7);
rhs = y(1)/(1+y(5));
residual(2) = lhs - rhs;
lhs = y(8);
rhs = (1+y(3))*y(8)/(1+y(5));
residual(3) = lhs - rhs;
lhs = y(6);
rhs = (1+y(13))*y(14)/T(2);
residual(4) = lhs - rhs;
lhs = 1/y(7);
rhs = 1/y(6)-T(1)/((1+y(13))*y(14));
residual(5) = lhs - rhs;
lhs = y(12)/y(8);
rhs = 1/y(6)-T(1)*(1+y(10))/((1+y(13))*y(14));
residual(6) = lhs - rhs;
lhs = 1+y(9);
rhs = (1+y(5))*(params(3)+y(15))/y(11);
residual(7) = lhs - rhs;
lhs = log(y(12));
rhs = params(4)*log(y(4))+x(it_, 1);
residual(8) = lhs - rhs;

end
