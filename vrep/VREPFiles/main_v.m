%************************************************************************%
% Sirena Tech: Generating Content (Actions)                              %
%                                                                        %
% September 2016                                                         %
%************************************************************************%

% move arms and head in vrep using inbuilt IK. Measure joint angles from
% Matlab and maybe send these angles to the real robot.

clear all
close all
clc

%% Simulation
run simulation.m;

%% Analysis
run analysis.m;

