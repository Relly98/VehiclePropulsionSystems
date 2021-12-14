% Start with a clean workspace
clearvars;
close all;
clc;

%% Define parameters
gravAccel = 9.81; % m/s^2
rhoAir = 1.2; % kg/m^3
lhvGasoline = 32.6e6; % MJ/l
densityGasoline = 0.75; % kg/l

frontalDragArea = 0.78; % m^2
deltaRollFricCoeff = 1.94e-4; % s/m, * velocity
rollFricCoeff = 0.0092; % -
hybridMass = 21; % kg
vehMass = 1700+hybridMass; % kg
wheelRadius = 0.225; % m
wheelMass = 79; % kg = 2*wheelMomentOfInertia/wheelRadius^2
wheelMomentOfInertia = 2; % kg*m^2
motorMomentOfInertia = 1/2 * 0.5 * 0.040^2; % kg*m^2

powerEngine = 145; % kW
idleLosses = 1.765; % kW

engineEffic = 0.3414; % -
ethaTransm = 0.95; % -
ethaMotor = 0.78; % -

openCircuitVoltage = 350; % V
internalResistance = 0.8; % Ohm
specPowerMotor = 1.1; % kW/kg
specPowerBattery = 1; % kW/kg
specEnergyBattery = 100; % Wh/kg
SOC_max = 0.8; % -
SOC_min = 0.2; % -

%% Define problem and simulation horizon
NEDCdata = load("NEDC.mat");
NEDCvelocity = NEDCdata.CYC.v;
NEDCtime = NEDCdata.CYC.t;
Ts = 1;
N = max(NEDCtime);
