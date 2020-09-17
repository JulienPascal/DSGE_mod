clc;
clear;
dynare Solow_SS_transition.mod;

./configure --with-matlab=/usr/local/MATLAB/R2016a MATLAB_VERSION=R2016a

