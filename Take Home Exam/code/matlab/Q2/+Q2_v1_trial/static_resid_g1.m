function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
% function [residual, g1] = static_resid_g1(T, y, x, params, T_flag)
%
% Wrapper function automatically created by Dynare
%

    if T_flag
        T = Q2_v1_trial.static_g1_tt(T, y, x, params);
    end
    residual = Q2_v1_trial.static_resid(T, y, x, params, false);
    g1       = Q2_v1_trial.static_g1(T, y, x, params, false);

end
