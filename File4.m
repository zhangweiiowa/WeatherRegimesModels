function [outputArg1,outputArg2] = PlotWTrainfallCMIP6(inputArg1,inputArg2)
%PLOTWTRAINFALLCMIP6 Summary of this function goes here
%   Detailed explanation goes here


plotheight=20;
plotwidth=18;
subplotsx=1; % number of columns
subplotsy=3; % number of rows 
leftedge=2;
rightedge=1.5;  
topedge=1;
bottomedge=2.6;
spacex=0.2;
% spacey=0.2;
spacey=1;
fontsize=6;   
sub_pos=subplot_pos(plotwidth,plotheight,leftedge,rightedge,bottomedge,topedge,subplotsx,subplotsy,spacex,spacey);
%setting the Matlab figure
f = figure('visible','on');
clf(f);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [plotwidth plotheight]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 plotwidth plotheight]);
   load('E:\code\matlab\colorbar\BBbarWBGYR.mat');
% load('E:\code\matlab\colorbar\BlueRed20.mat');
% BBbar(1,:) = 1;

% addpath('E:\code\matlab\m_map');
addpath('E:\code\m_map');
lon2 = 0.5:1:359.5;
lat2 = -89.5:1:89.5;

% % % % %%%%%%%%%%%%%%%%% BCC-ESM1
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\BCC-ESM1\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\BCC-ESM1\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\BCC-ESM1\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % 
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-BCC-ESM1-HISTALL-19792014.csv']);
% % % % 
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % 
% % % % IDX = find(C16GHG == 5);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % 
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,1) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%% BCC-ESM1
% % % % 
% % % % %%%%%%%%%%%%%%%%% cesm2
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CESM2\GFDL-ESM2M-region-pr-19792014-r2.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CESM2\GFDL-ESM2M-region-pr-19792014-r2.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CESM2\GFDL-ESM2M-region-pr-19792014-r2.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-cesm2-HISTALL-19792014-r2.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 2);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % 
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,2) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%% cesm2
% % % % 
% % % % 
% % % % %%%%%%%%%%%%%%%%% HadGEM3-GC31
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\HadGEM3-GC31\GFDL-ESM2M-region-pr-19792014-r2.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\HadGEM3-GC31\GFDL-ESM2M-region-pr-19792014-r2.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\HadGEM3-GC31\GFDL-ESM2M-region-pr-19792014-r2.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-HadGEM3-GC31HISTALL-19792014-r2.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 5);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,3) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%% HadGEM3-GC31
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%%  CNRM-ESM2-1
% % % % 
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CNRM-ESM2-1\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CNRM-ESM2-1\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CNRM-ESM2-1\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-ESM2-1-HISTALL-19792014.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 5);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,4) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%%%%%%  CNRM-ESM2-1
% % % % 
% % % % 
% % % % %%%%%%%%%%%%%%%%%  IPSL-CM6A-LR
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\IPSL-CM6A-LR\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\IPSL-CM6A-LR\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\IPSL-CM6A-LR\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CIPSL-CM6A-LR-HISTALL-19792014.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 5);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,5) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%%%%%% IPSL-CM6A-LR
% % % % 
% % % % 
% % % % 
% % % % %%%%%%%%%%%%%%%%%%%%%%% CNRM-CM6
% % % % 
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CNRM-CM6\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CNRM-CM6\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\CNRM-CM6\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-HISTALL-19792014.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 5);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,6) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%%%%%% CNRM-CM6
% % % % 
% % % % %%%%%%%%%%% gfdl-cm4
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\GFDL-CM4\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\GFDL-CM4\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\GFDL-CM4\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-CM4-HISTALL-19792014.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 3);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,7) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%% gfdl-cm4
% % % % 
% % % % %%%%%%%%%%% gfdl-esm4
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\GFDL-ESM4\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\GFDL-ESM4\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\GFDL-ESM4\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-ESM4-HISTALL-19792014--r1.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 1);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,8) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%% gfdl-esm4
% % % % 
% % % % 
% % % % %%%%%%%%%%% MRI-ESM2-0
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\MRI-ESM2-0\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\MRI-ESM2-0\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\MRI-ESM2-0\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTALL-19792014.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 1);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,9) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % % 
% % % % %%%%%%%%%%%%%% MRI-ESM2-0
% % % % 
% % % % 
% % % % %%%%%%%%%%% UKESM1-0
% % % % prbnu = [];
% % % % lon1 = [];
% % % % lat1 = [];
% % % % CC = [];
% % % % C16GHG = [];
% % % % IDX = [];
% % % % X1 = [];
% % % % Y1 = [];
% % % % prbnughg = [];
% % % % 
% % % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\UKESM1-0\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\UKESM1-0\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\UKESM1-0\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-UKESM1-0-HISTALL-19792014--r1.csv']);
% % % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % % IDX = find(C16GHG == 1);
% % % % 
% % % % lon2 = 0.5:1:359.5;
% % % % lat2 = -89.5:1:89.5;
% % % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % % [X1,Y1] = meshgrid(lon1,lat1);
% % % % [X2,Y2] = meshgrid(lon2,lat2);
% % % % prbnughg1(:,:,10) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  

%%%%%%%%%%%%%% UKESM1-0


% % %%%%%%%%%%%GISS-E2-1
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\UKESM1-0\GFDL-ESM2M-region-19792014-pr.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\UKESM1-0\GFDL-ESM2M-region-19792014-pr.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\HIST\UKESM1-0\GFDL-ESM2M-region-19792014-pr.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GISS-E2-1-G-HISTALL-19792014-GHG.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 4);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg1(:,:,11) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % 
% % %%%%%%%%%%%%%% GISS-E2-1

% save prbnughg1-HISTmean.mat prbnughg1;
load prbnughg1-HISTmean.mat;



%%%%%%%%%%%%%%%%%%%%%%%%%%%% GHG-HIST
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r1.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r1.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r1.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r1.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 5);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,1) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % 
% % 
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r2.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r2.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r2.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r2.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 1);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,2) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % 
% % 
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r3.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r3.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r3.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r3.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 1);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,3) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % 
% % 
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r1.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r1.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r1.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r1.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 5);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,4) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % 
% % 
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r3.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r3.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r3.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r3.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 3);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,5) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % 
% % 
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r5.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r5.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r5.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r5.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 4);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,6) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % 
% % 
% % prbnu = [];
% % lon1 = [];
% % lat1 = [];
% % CC = [];
% % C16GHG = [];
% % IDX = [];
% % X1 = [];
% % Y1 = [];
% % prbnughg = [];
% % 
% % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\IPSL-CM6A-LR\GFDL-ESM2M-region-pr-19792014-r1.nc','pr');
% % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\IPSL-CM6A-LR\GFDL-ESM2M-region-pr-19792014-r1.nc','lon');
% % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\GHG\IPSL-CM6A-LR\GFDL-ESM2M-region-pr-19792014-r1.nc','lat');
% % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv']);
% % C16GHG = CC(:,2) + 1;  % from python to matlab
% % IDX = find(C16GHG == 4);
% % 
% % lon2 = 0.5:1:359.5;
% % lat2 = -89.5:1:89.5;
% % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % [X1,Y1] = meshgrid(lon1,lat1);
% % [X2,Y2] = meshgrid(lon2,lat2);
% % prbnughg2(:,:,7) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GHG HIST
% % save prbnughg2-HISTGHGmean.mat prbnughg2;

%%%%%%%%%%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%% HIST-NAT
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r1.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r1.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r1.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r1.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 2);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,1) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % 
% % % 
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r2.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r2.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r2.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r2.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 1);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,2) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ;  
% % % 
% % % 
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r3.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r3.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\CNRM-CM6-1\GFDL-ESM2M-region-pr-19792014-r3.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r3.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 4);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,3) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % % 
% % % 
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r1.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r1.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r1.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r1.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 3);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,4) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % % 
% % % 
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =   ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r3.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r3.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r3.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r3.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 5);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,5) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % % 
% % % 
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r5.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r5.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\MRI-ESM2-0\GFDL-ESM2M-region-pr-19792014-r5.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r5.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 1);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,6) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % % 
% % % 
% % % prbnu = [];
% % % lon1 = [];
% % % lat1 = [];
% % % CC = [];
% % % C16GHG = [];
% % % IDX = [];
% % % X1 = [];
% % % Y1 = [];
% % % prbnughg = [];
% % % 
% % % prbnu =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\IPSL-CM6A-LR\GFDL-ESM2M-region-pr-19792014-r1.nc','pr');
% % % lon1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\IPSL-CM6A-LR\GFDL-ESM2M-region-pr-19792014-r1.nc','lon');
% % % lat1 =    ncread('Z:\CMIP5_daily_zg\CMIP6\NAT\IPSL-CM6A-LR\GFDL-ESM2M-region-pr-19792014-r1.nc','lat');
% % % CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r1.csv']);
% % % C16GHG = CC(:,2) + 1;  % from python to matlab
% % % IDX = find(C16GHG == 6);
% % % 
% % % lon2 = 0.5:1:359.5;
% % % lat2 = -89.5:1:89.5;
% % % prbnughg = squeeze(nanmean(prbnu(:,:,IDX),3))*3600*24;
% % % [X1,Y1] = meshgrid(lon1,lat1);
% % % [X2,Y2] = meshgrid(lon2,lat2);
% % % prbnughg3(:,:,7) = (interp2(X1,Y1,(prbnughg'),X2,Y2, 'nearest')) ; 
% % % 
% % % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GHG HIST
% % % save prbnughg3-HISTNATmean.mat prbnughg3;

%%%%%%%%%%%%%
load prbnughg2-HISTGHGmean.mat;

 ax(1) = axes('position',sub_pos{1,1},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;

    m_pcolor(lon2,lat2,squeeze(nanmean(prbnughg1,3))); % plot imagesc (grid)

    colormap(ax(1),BBbar)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
   caxis([0 5])
   title('HIST-All','fontsize',10)


   
   load prbnughg2-HISTGHGmean.mat;

 ax(2) = axes('position',sub_pos{1,2},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;

    m_pcolor(lon2,lat2,squeeze(nanmean(prbnughg2,3))); % plot imagesc (grid)

    colormap(ax(2),BBbar)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
   caxis([0 5])
   title('HIST-GHG','fontsize',10)


   
   
   load prbnughg3-HISTNATmean.mat
   ax(3) = axes('position',sub_pos{1,3},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;

    m_pcolor(lon2,lat2,squeeze(nanmean(prbnughg3,3))); % plot imagesc (grid)

    colormap(ax(3),BBbar)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
        m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
   caxis([0 5])
   title('HIST-NAT','fontsize',10)

   
      
   set([ax(5) ax(6) ax(7) ax(8) ],'clim',[-0.5 0.5]); % set color limit for each subplot
%    set([ax(1) ax(2) ax(3) ax(4) ax(5) ax(6) ax(7) ax(8) ax(9) ax(10)],'clim',[-0.3 0.3]); % set color limit for each subplot
   B1= colorbar('horzi','ticklength',0); % colorbar('vert')
   set(B1, 'Position', [ 0.58 0.075 .28 .025]);  
   set(B1,'fontsize',8);      
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WT1 
   
end

