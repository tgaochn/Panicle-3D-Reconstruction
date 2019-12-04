% preprocess.m
% Author      : Tian Gao (tgaochn@gmail.com)
% Link        : 
% Date        : Tue, 12/03/2019, 15:55
% Description : 
%   

%%
clc; clear; close all; warning off all;

addpath('./lib')

imgInputPath = './input';
imgOutputPath = './output';

maskColorSpaceType = 'HSV';
maskFuncType = 'keep';
maskThresLis = [0, 1, 0, 1, 0.2, 1];
enableDenoise = true;
intensThres = 10;
minAreaThres = 50;
debugMode = false;
debugImgFn = 'tmp.jpg';

prepareImgSinglePath(imgInputPath, imgOutputPath, maskColorSpaceType, maskFuncType, maskThresLis, enableDenoise, intensThres, minAreaThres, debugMode, debugImgFn)
