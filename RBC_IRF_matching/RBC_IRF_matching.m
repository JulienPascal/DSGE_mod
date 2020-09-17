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
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'RBC_IRF_matching';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('RBC_IRF_matching.log');
M_.exo_names = 'eps_z';
M_.exo_names_tex = '{\varepsilon_z}';
M_.exo_names_long = 'TFP shock';
M_.exo_names = char(M_.exo_names, 'eps_g');
M_.exo_names_tex = char(M_.exo_names_tex, '{\varepsilon_g}');
M_.exo_names_long = char(M_.exo_names_long, 'government spending shock');
M_.endo_names = 'y';
M_.endo_names_tex = '{y}';
M_.endo_names_long = 'output';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, '{c}');
M_.endo_names_long = char(M_.endo_names_long, 'consumption');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, '{k}');
M_.endo_names_long = char(M_.endo_names_long, 'capital');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, '{l}');
M_.endo_names_long = char(M_.endo_names_long, 'hours');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, '{z}');
M_.endo_names_long = char(M_.endo_names_long, 'TFP');
M_.endo_names = char(M_.endo_names, 'ghat');
M_.endo_names_tex = char(M_.endo_names_tex, '{\hat g}');
M_.endo_names_long = char(M_.endo_names_long, 'government spending');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, '{r}');
M_.endo_names_long = char(M_.endo_names_long, 'annualized interest rate');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, '{w}');
M_.endo_names_long = char(M_.endo_names_long, 'real wage');
M_.endo_names = char(M_.endo_names, 'invest');
M_.endo_names_tex = char(M_.endo_names_tex, '{i}');
M_.endo_names_long = char(M_.endo_names_long, 'investment');
M_.endo_names = char(M_.endo_names, 'log_y');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log(y)}');
M_.endo_names_long = char(M_.endo_names_long, 'log output');
M_.endo_names = char(M_.endo_names, 'log_k');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log(k)}');
M_.endo_names_long = char(M_.endo_names_long, 'log capital stock');
M_.endo_names = char(M_.endo_names, 'log_c');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log(c)}');
M_.endo_names_long = char(M_.endo_names_long, 'log consumption');
M_.endo_names = char(M_.endo_names, 'log_l');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log(l)}');
M_.endo_names_long = char(M_.endo_names_long, 'log labor');
M_.endo_names = char(M_.endo_names, 'log_w');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log(w)}');
M_.endo_names_long = char(M_.endo_names_long, 'log real wage');
M_.endo_names = char(M_.endo_names, 'log_invest');
M_.endo_names_tex = char(M_.endo_names_tex, '{\log(i)}');
M_.endo_names_long = char(M_.endo_names_long, 'log investment');
M_.endo_names = char(M_.endo_names, 'AUX_ENDO_LAG_5_1');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_ENDO\_LAG\_5\_1');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_ENDO_LAG_5_1');
M_.endo_partitions = struct();
M_.param_names = 'beta';
M_.param_names_tex = '{\beta}';
M_.param_names_long = 'discount factor';
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, '{\psi}');
M_.param_names_long = char(M_.param_names_long, 'labor disutility parameter');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, '{\sigma}');
M_.param_names_long = char(M_.param_names_long, 'risk aversion');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, '{\delta}');
M_.param_names_long = char(M_.param_names_long, 'depreciation rate');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, '{\alpha}');
M_.param_names_long = char(M_.param_names_long, 'capital share');
M_.param_names = char(M_.param_names, 'rhoz');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_z}');
M_.param_names_long = char(M_.param_names_long, 'persistence TFP shock');
M_.param_names = char(M_.param_names, 'root_g_1');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_g}');
M_.param_names_long = char(M_.param_names_long, 'persistence G shock');
M_.param_names = char(M_.param_names, 'root_g_2');
M_.param_names_tex = char(M_.param_names_tex, '{\rho_g}');
M_.param_names_long = char(M_.param_names_long, 'persistence G shock');
M_.param_names = char(M_.param_names, 'gammax');
M_.param_names_tex = char(M_.param_names_tex, '{\gamma_x}');
M_.param_names_long = char(M_.param_names_long, 'composite growth rate');
M_.param_names = char(M_.param_names, 'gshare');
M_.param_names_tex = char(M_.param_names_tex, '{\frac{G}{Y}}');
M_.param_names_long = char(M_.param_names_long, 'government spending share');
M_.param_names = char(M_.param_names, 'n');
M_.param_names_tex = char(M_.param_names_tex, '{n}');
M_.param_names_long = char(M_.param_names_long, 'population growth');
M_.param_names = char(M_.param_names, 'x');
M_.param_names_tex = char(M_.param_names_tex, '{x}');
M_.param_names_long = char(M_.param_names_long, 'technology growth (per capita output growth)');
M_.param_names = char(M_.param_names, 'i_y');
M_.param_names_tex = char(M_.param_names_tex, '{\frac{I}{Y}}');
M_.param_names_long = char(M_.param_names_long, 'investment-output ratio');
M_.param_names = char(M_.param_names, 'k_y');
M_.param_names_tex = char(M_.param_names_tex, '{\frac{K}{Y}}');
M_.param_names_long = char(M_.param_names_long, 'capital-output ratio');
M_.param_names = char(M_.param_names, 'g_ss');
M_.param_names_tex = char(M_.param_names_tex, '{\bar G}');
M_.param_names_long = char(M_.param_names_long, 'government spending in steady state');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 16;
M_.param_nbr = 15;
M_.orig_endo_nbr = 15;
M_.aux_vars(1).endo_index = 16;
M_.aux_vars(1).type = 1;
M_.aux_vars(1).orig_index = 6;
M_.aux_vars(1).orig_lead_lag = -1;
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('RBC_IRF_matching_static');
erase_compiled_function('RBC_IRF_matching_dynamic');
M_.orig_eq_nbr = 15;
M_.eq_nbr = 16;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 5 0;
 0 6 21;
 1 7 0;
 0 8 22;
 2 9 23;
 3 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;
 0 19 0;
 4 20 0;]';
M_.nstatic = 10;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 3;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.equations_tags = {
  1 , 'name' , 'Euler equation' ;
  2 , 'name' , 'Labor FOC' ;
  3 , 'name' , 'Law of motion capital' ;
  4 , 'name' , 'resource constraint' ;
  5 , 'name' , 'production function' ;
  6 , 'name' , 'real wage/firm FOC labor' ;
  7 , 'name' , 'annualized real interst rate/firm FOC capital' ;
  8 , 'name' , 'exogenous TFP process' ;
  9 , 'name' , 'government spending process' ;
  10 , 'name' , 'Definition log output' ;
  11 , 'name' , 'Definition log capital' ;
  12 , 'name' , 'Definition log consumption' ;
  13 , 'name' , 'Definition log hours' ;
  14 , 'name' , 'Definition log wage' ;
  15 , 'name' , 'Definition log investment' ;
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(15, 1);
M_.NNZDerivatives = [46; -1; -1];
M_.params( 3 ) = 1;
sigma = M_.params( 3 );
M_.params( 5 ) = 0.33;
alpha = M_.params( 5 );
M_.params( 13 ) = 0.25;
i_y = M_.params( 13 );
M_.params( 14 ) = 10.4;
k_y = M_.params( 14 );
M_.params( 12 ) = 0.0055;
x = M_.params( 12 );
M_.params( 11 ) = 0.0027;
n = M_.params( 11 );
M_.params( 6 ) = 0.97;
rhoz = M_.params( 6 );
M_.params( 7 ) = 0.9602;
root_g_1 = M_.params( 7 );
M_.params( 8 ) = 0;
root_g_2 = M_.params( 8 );
M_.params( 10 ) = 0.2038;
gshare = M_.params( 10 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(2, 2) = 1;
resid(1);
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 80;
options_.order = 1;
var_list_ = char('log_y','log_c','ghat');
info = stoch_simul(var_list_);
[IRF_empirical,IRF_weighting,IRF_quantiles]=get_empirical_IRFs(80)
x_start=[root_g_1 root_g_2]; 
options_.nomoments=1;
options_.nofunctions=1;
options_.nograph=1;
options_.verbosity=0;
options_.noprint=1;
H0 = 1e-2*eye(length(x_start)); 
crit = 1e-8; 
nit = 1000;  
[fhat,x_opt_hat] = csminwel(@IRF_matching_objective,x_start,H0,[],crit,nit,IRF_empirical,IRF_weighting);
[fval, IRF_model]=IRF_matching_objective(x_opt_hat,IRF_empirical,IRF_weighting);
figure
subplot(2,1,1)
plot(1:options_.irf,IRF_empirical(:,1),1:options_.irf,IRF_model(:,1),1:options_.irf,IRF_quantiles(1,:,1),'r--',1:options_.irf,IRF_quantiles(1,:,2),'r--');
title('G')
subplot(2,1,2)
plot(1:options_.irf,IRF_empirical(:,2),1:options_.irf,IRF_model(:,2),1:options_.irf,IRF_quantiles(2,:,1),'r--',1:options_.irf,IRF_quantiles(2,:,2),'r--');
title('Y')
legend('Empirical','Model')
save('RBC_IRF_matching_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('RBC_IRF_matching_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('RBC_IRF_matching_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('RBC_IRF_matching_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('RBC_IRF_matching_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('RBC_IRF_matching_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('RBC_IRF_matching_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
