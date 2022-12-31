%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'A5_v1';
M_.dynare_version = '5.2';
oo_.dynare_version = '5.2';
options_.dynare_version = '5.2';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'e'};
M_.exo_names_tex(1) = {'e'};
M_.exo_names_long(1) = {'e'};
M_.endo_names = cell(8,1);
M_.endo_names_tex = cell(8,1);
M_.endo_names_long = cell(8,1);
M_.endo_names(1) = {'pi'};
M_.endo_names_tex(1) = {'pi'};
M_.endo_names_long(1) = {'pi'};
M_.endo_names(2) = {'c'};
M_.endo_names_tex(2) = {'c'};
M_.endo_names_long(2) = {'c'};
M_.endo_names(3) = {'m1'};
M_.endo_names_tex(3) = {'m1'};
M_.endo_names_long(3) = {'m1'};
M_.endo_names(4) = {'m2'};
M_.endo_names_tex(4) = {'m2'};
M_.endo_names_long(4) = {'m2'};
M_.endo_names(5) = {'i'};
M_.endo_names_tex(5) = {'i'};
M_.endo_names_long(5) = {'i'};
M_.endo_names(6) = {'im'};
M_.endo_names_tex(6) = {'im'};
M_.endo_names_long(6) = {'im'};
M_.endo_names(7) = {'s'};
M_.endo_names_tex(7) = {'s'};
M_.endo_names_long(7) = {'s'};
M_.endo_names(8) = {'chi'};
M_.endo_names_tex(8) = {'chi'};
M_.endo_names_long(8) = {'chi'};
M_.endo_partitions = struct();
M_.param_names = cell(4,1);
M_.param_names_tex = cell(4,1);
M_.param_names_long = cell(4,1);
M_.param_names(1) = {'rho'};
M_.param_names_tex(1) = {'rho'};
M_.param_names_long(1) = {'rho'};
M_.param_names(2) = {'y'};
M_.param_names_tex(2) = {'y'};
M_.param_names_long(2) = {'y'};
M_.param_names(3) = {'d'};
M_.param_names_tex(3) = {'d'};
M_.param_names_long(3) = {'d'};
M_.param_names(4) = {'lambda'};
M_.param_names_tex(4) = {'lambda'};
M_.param_names_long(4) = {'lambda'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 8;
M_.param_nbr = 4;
M_.orig_endo_nbr = 8;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.orig_eq_nbr = 8;
M_.eq_nbr = 8;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 13;
 0 6 14;
 1 7 0;
 2 8 0;
 0 9 0;
 3 10 0;
 0 11 15;
 4 12 0;]';
M_.nstatic = 1;
M_.nfwrd   = 3;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 3;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [2; 1; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'pi' ;
  2 , 'name' , 'm1' ;
  3 , 'name' , 'm2' ;
  4 , 'name' , 'c' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
};
M_.mapping.pi.eqidx = [1 2 3 4 5 6 7 ];
M_.mapping.c.eqidx = [1 4 5 6 ];
M_.mapping.m1.eqidx = [1 2 5 ];
M_.mapping.m2.eqidx = [1 3 6 ];
M_.mapping.i.eqidx = [4 7 ];
M_.mapping.im.eqidx = [1 3 6 ];
M_.mapping.s.eqidx = [1 7 ];
M_.mapping.chi.eqidx = [6 8 ];
M_.mapping.e.eqidx = [8 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 4 6 8 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(8, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(4, 1);
M_.endo_trends = struct('deflator', cell(8, 1), 'log_deflator', cell(8, 1), 'growth_factor', cell(8, 1), 'log_growth_factor', cell(8, 1));
M_.NNZDerivatives = [34; -1; -1; ];
M_.static_tmp_nbr = [2; 0; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.03;
rho = M_.params(1);
M_.params(2) = 100;
y = M_.params(2);
M_.params(3) = 100;
d = M_.params(3);
M_.params(4) = 0.97;
lambda = M_.params(4);
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
oo_.dr.eigval = check(M_,options_,oo_);
options_.hp_filter = 1600;
options_.irf = 40;
options_.order = 1;
var_list_ = {};
[info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, var_list_);


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'A5_v1_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
