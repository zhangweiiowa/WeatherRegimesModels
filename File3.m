function [outputArg1,outputArg2] = PlotTrendofWT1rainfallJanMay(inputArg1,inputArg2)
%PLOTTRENDOFWT1RAINFALLJANMAY Summary of this function goes here
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



% addpath('E:\code\matlab\m_map');
addpath('E:\code\m_map');
lon2 = 0.5:1:359.5;
lat2 = -89.5:1:89.5;

%   load prbnughg1-HISTmean-Jan-May-1979-2014.mat ;
  load('E:\code\matlab\colorbar\BBbar-Precip-Div');
  BBbar2 = BBbar;
  
  load prbnughg1-10models-Jan-May-1979-2014.mat;
  
 ax(1) = axes('position',sub_pos{1,1},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
 
%     PRE = squeeze(nanmean(prbnughg1(:,:,:,:),4));
%     
%     for i = 1 : size(PRE,1)
%          for j = 1 :size(PRE,2)
%               a = squeeze(PRE(i,j,:));
% %               a
%               if isnan(a(1)) == 0
%                   stats = regstats(a,(1:36)','linear');      
%                   beta(i,j) = stats.beta(2) ;   
%                   sig(i,j) = stats.tstat.pval(2);
%               else 
%                   beta(i,j) = nan ;   
%                   sig(i,j) =  nan;
%               end
%          end
%         
%     end 
% %     beta(sig > 0.1) = nan;
%     
%     m_pcolor(lon2,lat2, beta); % plot imagesc (grid)
m_pcolor(lon2,lat2,squeeze(trend(nanmean(prbnughg1(:,:,:,:),4)/25.4,[],3)));
    colormap(ax(1),BBbar2)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
 caxis([-2 2])
   title('(a) HIST-All','fontsize',10)
   
%    load prbnughg2-HISTGHGmean-Jan-May-1979-2014.mat;
 

load   prbnughg2-10models-Jan-May-1979-2014.mat;
 ax(2) = axes('position',sub_pos{1,2},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
    
%     PRE = [];
%     beta = [];
%     sig = [];
%      PRE = squeeze(nanmean(prbnughg2(:,:,:,:),4));
%     
%     for i = 1 : size(PRE,1)
%          for j = 1 :size(PRE,2)
%               a = squeeze(PRE(i,j,:));
% %               a
%               if isnan(a(1)) == 0
%                   stats = regstats(a,(1:36)','linear');      
%                   beta(i,j) = stats.beta(2) ;   
%                   sig(i,j) = stats.tstat.pval(2);
%               else 
%                   beta(i,j) = nan ;   
%                   sig(i,j) =  nan;
%               end
%          end
%         
%     end 
% %     beta(sig > 0.1) = nan;    
%     m_pcolor(lon2,lat2, beta); % plot imagesc (grid)
    
    m_pcolor(lon2,lat2,squeeze(trend(nanmean(prbnughg2(:,:,:,:)/25.4,4),[],3)));
% m_pcolor(lon2,lat2,squeeze(trend(nanmean(prbnughg2(:,:,:,:),4),[],3)));
%          m_pcolor(lon2,lat2,squeeze(nanmean(trend(prbnughg2(:,:,:,:),[],3),3)));

    colormap(ax(2),BBbar2)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
   caxis([-2 2])
   title('(b) HIST-GHG','fontsize',10)

   
   
   load prbnughg3-HISTNATmean-Jan-May-1979-2014.mat
   
   ax(3) = axes('position',sub_pos{1,3},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
    
% %     PRE = [];
% %     beta = [];
% %     sig = [];
% %      PRE = squeeze(nanmean(prbnughg3(:,:,:,:),4));
% %     
% %     for i = 1 : size(PRE,1)
% %          for j = 1 :size(PRE,2)
% %               a = squeeze(PRE(i,j,:));
% % %               a
% %               if isnan(a(1)) == 0
% %                   stats = regstats(a,(1:36)','linear');      
% %                   beta(i,j) = stats.beta(2) ;   
% %                   sig(i,j) = stats.tstat.pval(2);
% %               else 
% %                   beta(i,j) = nan ;   
% %                   sig(i,j) =  nan;
% %               end
% %          end
% %         
% %     end 
% % %     beta(sig > 0.1) = nan;    
% %     m_pcolor(lon2,lat2, beta); % plot imagesc (grid)
    m_pcolor(lon2,lat2,squeeze(trend(nanmean(prbnughg3(:,:,:,:)/25.4,4),[],3)));
    
% m_pcolor(lon2,lat2,squeeze(trend(nanmean(prbnughg3(:,:,:,:),4),[],3)));
%      m_pcolor(lon2,lat2,squeeze(trend(prbnughg3,[],3)));

    colormap(ax(3),BBbar2)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
        m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
   caxis([-2 2])
   title('(c) HIST-NAT','fontsize',10)
   
   set([ax(1) ax(2) ax(3)  ],'clim',[-0.1 0.1]); % set color limit for each subplot
%    set([ax(1) ax(2) ax(3) ax(4) ax(5) ax(6) ax(7) ax(8) ax(9) ax(10)],'clim',[-0.3 0.3]); % set color limit for each subplot
   B1= colorbar('horzi','ticklength',0); % colorbar('vert')
   set(B1, 'Position', [ 0.24 0.075 .55 .025]);  
   set(B1,'fontsize',8);      
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WT1 
 
 
end

