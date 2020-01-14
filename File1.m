function [outputArg1,outputArg2] = RainfallCPCAug24Sep5(inputArg1,inputArg2)
plotheight=20;
plotwidth=18;
subplotsx=2; % number of columns
subplotsy=4; % number of rows 
leftedge=2;
rightedge=1.5;  
topedge=1;
bottomedge=1.5;
spacex=0.2;
% spacey=0.2;
spacey=1.5;
fontsize=6;   
sub_pos=subplot_pos(plotwidth,plotheight,leftedge,rightedge,bottomedge,topedge,subplotsx,subplotsy,spacex,spacey);
f = figure('visible','on');
clf(f);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [plotwidth plotheight]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 plotwidth plotheight]);
load('E:\code\matlab\colorbar\BBbarWBGYR.mat');
addpath('E:\code\m_map');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Frequency
CN = 6; 
CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1948-2019-JFMAM.csv']);
C14 = CC(:,2) + 1;  % from python to matlab
C14(C14==1) = 10;
C14(C14==5) = 1;
C14(C14==10) = 5;
T(1:72,1:CN,1:2) = 0; % from 1948
ST = [];
    for i = 1948 : 2019        
          if i == 2019 
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,31);
          else
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,31);
          end
          
          if i == 1948 
              startday =  1;             
          end
           
           endday =  startday + daysact(date1,date2) ;
           sdays = C14(startday:endday);
           
           k = 0; % number of elements in the same cluster
           ST = 0;
           for j = 1 : numel(sdays)
                if j == 1
%                      T = sdays(1);
                     k  = 1;
                else
                     if sdays(j) == sdays(j-1)
                           k = k + 1;
                     else 
                           if k >= 4
                                T(i-1947,sdays(j-1),1)  = T(i-1947,sdays(j-1),1) + 1;  
                                T(i-1947,sdays(j-1),2) = T(i-1947,sdays(j-1),2) +  k;
%                                 ST{i-1978,sdays(j-1)}  = [k; ST{i-1978,sdays(j-1)} ] ;
                           end
                           k = 1;
                     end
                end
           end
           
               T(i-1947,1,3) =  T(i-1947,sdays(j-1),1)/numel(find(sdays  == 1));
               T(i-1947,2,3) =  T(i-1947,sdays(j-1),1)/numel(find(sdays  == 2));
               T(i-1947,3,3) =  T(i-1947,sdays(j-1),1)/numel(find(sdays  == 3));
               T(i-1947,4,3) =  T(i-1947,sdays(j-1),1)/numel(find(sdays  == 4));
               T(i-1947,5,3) =  T(i-1947,sdays(j-1),1)/numel(find(sdays  == 5));
               T(i-1947,6,3) =  T(i-1947,sdays(j-1),1)/numel(find(sdays  == 6));
           
             T(i-1947,1,4) = numel(find(sdays  == 1));
             T(i-1947,2,4) = numel(find(sdays  == 2));
             T(i-1947,3,4) = numel(find(sdays  == 3));
             T(i-1947,4,4) = numel(find(sdays  == 4));
             T(i-1947,5,4) = numel(find(sdays  == 5));
             T(i-1947,6,4) = numel(find(sdays  == 6));
             
              startday = endday + 1;
    end

    COLOR(1,:) = [227,26,28]/255;
    COLOR(2,:) = [31,120,180]/255;
    COLOR(3,:) = [51,160,44]/255;
    COLOR(4,:) = [255,127,0]/255; 
    COLOR(5,:) = [106,61,154]/255;
    COLOR(6,:) = [0,0,0]/255;
    
    sub_pos{1,1}(1) = 0.2
    sub_pos{1,1}(3) = 0.6
    
    ax(1) = axes('position',sub_pos{1,1},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     
    
     for i = 1 : 1
        hold on
         plot((3:72)',squeeze(T(3:72,i,4)),'Color',COLOR(1,:),'linewidth',0.5) %,(1:71)',squeeze(T(:,3,1)),...
     end
     FREREANA(3:72,1) = transpose(squeeze(T(3:72,1,4)));
      SP1 = [];
    for j = 1 : 1
       TCF =squeeze(T(3:72,j,4));
       [b,dev,stats] = glmfit((3:72)',TCF ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(3:72)','log');  
       ypred(:,j) = yfit;  
       SP1(j,1) =  stats.beta(2)
       SP1(j,2) =  stats.p(2)    
    end
        hold on;
     for i = 1 : 1
        hold on
         if i == 1 || i == 3 || i == 5
               h(1) =    plot((3:72)',squeeze(ypred(:,i)),'Color',COLOR(1,:),'linewidth',2);
        
         else
                 plot((3:72)',squeeze(ypred(:,i)),'--','Color',COLOR(1,:),'linewidth',2)
         end
         %,(1:71)',squeeze(T(:,3,1)),...
        %'Color',squeeze(COLOR(3,:)),(1:71)',squeeze(T(:,4,1)),'Color',squeeze(COLOR(4,:)),(1:71)',squeeze(T(:,5,1)),'Color',COLOR(5,:))
     end
% %      

       %%%%%%%%%% MERRA2
       CC = [];
       C14 =[];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1980-2019-merra2.csv']); 
    C14 = CC(:,2) + 1;  % from python to matlab
    C14(C14==1) = 10;
    C14(C14==2) = 1;
    C14(C14==10) = 2;
    T = [];
    T(1:40,1:CN,1:4) = 0;
ST = [];
    for i = 1980: 2019
        i
           date0 = datetime(1980,1,1);
           
          if i == 2019 
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,30);
          else
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,30);
           end
           
           startday =  daysact(date0,date1) + 1;
           endday = daysact(date0,date2) + 1;
           sdays = C14(startday:endday);
           
           k = 0; % number of elements in the same cluster
           ST = 0;
           for j = 1 : numel(sdays)
                if j == 1
%                      T = sdays(1);
                     k  = 1;
                else
                     if sdays(j) == sdays(j-1)
                           k = k + 1;
                     else 
                           if k >= 4
                               T(i-1979,sdays(j-1),1)  = T(i-1979,sdays(j-1),1) + 1;  
                               T(i-1979,sdays(j-1),2) =  T(i-1979,sdays(j-1),2) +  k;
%                                 ST{i-1979,sdays(j-1)}  = [k; ST{i-1979,sdays(j-1)} ] ;
                           end
                           k = 1;
                     end
                end
           end
           
           T(i-1979,1,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 1));
           T(i-1979,2,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 2));
           T(i-1979,3,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 3));
           T(i-1979,4,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 4));
           T(i-1979,5,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 5));
           T(i-1979,6,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 6));
           
             T(i-1979,1,4) = numel(find(sdays  == 1));
             T(i-1979,2,4) = numel(find(sdays  == 2));
             T(i-1979,3,4) = numel(find(sdays  == 3));
             T(i-1979,4,4) = numel(find(sdays  == 4));
             T(i-1979,5,4) = numel(find(sdays  == 5));
             T(i-1979,6,4) = numel(find(sdays  == 6));
    end
            hold on;
       plot((33:72)',squeeze(T(:,1,4)),'Color',COLOR(2,:),'linewidth',0.5) %,(1:71)',squeeze(T(:,3,1)),...
          FREREANA(1:40,2) = squeeze(T(:,1,4));
       
        SP1 = [];
        ypred = [];
    for j = 1 : 1
       TCF =squeeze(T(:,j,4));
       [b,dev,stats] = glmfit((33:72)',TCF ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(33:72)','log');  
       ypred(:,j) = yfit;  
       SP1(j,1) =  stats.beta(2)
       SP1(j,2) =  stats.p(2)    
    end
        hold on;
     for i = 1 : 1
        hold on
         if i == 1 || i == 3 || i == 5
              h(2) = plot((33:72)',squeeze(ypred(:,i)),'Color',COLOR(2,:),'linewidth',2)
        
         else
                 plot((33:72)',squeeze(ypred(:,i)),'--','Color',COLOR(2,:),'linewidth',2)
         end
         %,(1:71)',squeeze(T(:,3,1)),...
        %'Color',squeeze(COLOR(3,:)),(1:71)',squeeze(T(:,4,1)),'Color',squeeze(COLOR(4,:)),(1:71)',squeeze(T(:,5,1)),'Color',COLOR(5,:))
     end
       %%%%%%%%%%%%% MERRA2
       
       
       %%%%%%%%%%%%%%%eraI
       CC = [];
       C14 =[];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1980-2019-ERAI.csv']); 
    C14 = CC(:,2) + 1;  % from python to matlab
    T = [];
    T(1:39,1:CN,1:4) = 0;
ST = [];
    for i = 1980: 2018
        i
           date0 = datetime(1979,1,1);
           
          if i == 2019 
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,30);
          else
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,30);
           end
           
           startday =  daysact(date0,date1) + 1;
           endday = daysact(date0,date2) + 1;
           sdays = C14(startday:endday);
           
           k = 0; % number of elements in the same cluster
           ST = 0;
           for j = 1 : numel(sdays)
                if j == 1
%                      T = sdays(1);
                     k  = 1;
                else
                     if sdays(j) == sdays(j-1)
                           k = k + 1;
                     else 
                           if k >= 4
                               T(i-1979,sdays(j-1),1)  = T(i-1979,sdays(j-1),1) + 1;  
                               T(i-1979,sdays(j-1),2) =  T(i-1979,sdays(j-1),2) +  k;
%                                 ST{i-1979,sdays(j-1)}  = [k; ST{i-1979,sdays(j-1)} ] ;
                           end
                           k = 1;
                     end
                end
           end
           
           T(i-1979,1,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 1));
           T(i-1979,2,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 2));
           T(i-1979,3,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 3));
           T(i-1979,4,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 4));
           T(i-1979,5,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 5));
           T(i-1979,6,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 6));
           
             T(i-1979,1,4) = numel(find(sdays  == 1));
             T(i-1979,2,4) = numel(find(sdays  == 2));
             T(i-1979,3,4) = numel(find(sdays  == 3));
             T(i-1979,4,4) = numel(find(sdays  == 4));
             T(i-1979,5,4) = numel(find(sdays  == 5));
             T(i-1979,6,4) = numel(find(sdays  == 6));
    end
    
%        hold on;
%        plot((2:40)',squeeze(T(:,1,4)),'Color',COLOR(3,:),'linewidth',0.5) %,(1:71)',squeeze(T(:,3,1)),...
%          
        FREREANA(1:39,3) = squeeze(T(:,1,4));
        SP1 = [];
        ypred = [];
    for j = 1 : 1
       TCF =squeeze(T(:,j,4));
       [b,dev,stats] = glmfit((1:39)',TCF ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(1:39)','log');  
       ypred(:,j) = yfit;  
       SP1(j,1) =  stats.beta(2)
       SP1(j,2) =  stats.p(2)    
    end

%         hold on
%         h(3) = plot((2:40)',squeeze(ypred(:,1)),'Color',COLOR(3,:),'linewidth',2)
%         %%%%%%%%%%%% era-iNTERIM
        
        %%%%%%%%%%%%%% ERA-5
                
       CC = [];
       C14 =[];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1980-2019-ERA5.csv']); 
    C14 = CC(:,2) + 1;  % from python to matlab
    C14(C14==1) = 10;
    C14(C14==5) = 1;
    C14(C14==10) = 5;
    T = [];
    T(1:39,1:CN,1:4) = 0;
ST = [];
    for i = 1980: 2018
        i
           date0 = datetime(1979,1,1);
           
          if i == 2019 
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,30);
          else
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,30);
           end
           
           startday =  daysact(date0,date1) + 1;
           endday = daysact(date0,date2) + 1;
           sdays = C14(startday:endday);
           
           k = 0; % number of elements in the same cluster
           ST = 0;
           for j = 1 : numel(sdays)
                if j == 1
%                      T = sdays(1);
                     k  = 1;
                else
                     if sdays(j) == sdays(j-1)
                           k = k + 1;
                     else 
                           if k >= 4
                               T(i-1979,sdays(j-1),1)  = T(i-1979,sdays(j-1),1) + 1;  
                               T(i-1979,sdays(j-1),2) =  T(i-1979,sdays(j-1),2) +  k;
%                                 ST{i-1979,sdays(j-1)}  = [k; ST{i-1979,sdays(j-1)} ] ;
                           end
                           k = 1;
                     end
                end
           end
           
           T(i-1979,1,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 1));
           T(i-1979,2,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 2));
           T(i-1979,3,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 3));
           T(i-1979,4,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 4));
           T(i-1979,5,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 5));
           T(i-1979,6,3) =  T(i-1979,sdays(j-1),1)/numel(find(sdays  == 6));
           
             T(i-1979,1,4) = numel(find(sdays  == 1));
             T(i-1979,2,4) = numel(find(sdays  == 2));
             T(i-1979,3,4) = numel(find(sdays  == 3));
             T(i-1979,4,4) = numel(find(sdays  == 4));
             T(i-1979,5,4) = numel(find(sdays  == 5));
             T(i-1979,6,4) = numel(find(sdays  == 6));
    end
    
%        hold on;
%        plot((2:40)',squeeze(T(:,1,4)),'Color',COLOR(4,:),'linewidth',0.5) %,(1:71)',squeeze(T(:,3,1)),...
       FREREANA(1:39,4) = squeeze(T(:,1,4));   
       
       save FREREANA.mat FREREANA;
        SP1 = [];
        ypred = [];
    for j = 1 : 1
       TCF =squeeze(T(:,j,4));
       [b,dev,stats] = glmfit((1:39)',TCF ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(1:39)','log');  
       ypred(:,j) = yfit;  
       SP1(j,1) =  stats.beta(2)
       SP1(j,2) =  stats.p(2)    
    end

%         hold on
%         h(4) = plot((2:40)',squeeze(ypred(:,1)),'Color',COLOR(4,:),'linewidth',2)
        
        
        %%%%%%%% ERA-5
       
       legend(h(1:2),'NCEP/NCAR','MERRA2')
    xlim([2 73])
   set(gca, 'XTick', [3 13 23 33 43 53 63 ])
   set(gca, 'XTickLabel', { '1950','1960', '1970','1980','1990', '2000','2010'},'fontsize',8)
  set(gca, 'Box', 'on', 'TickDir', 'out')
%   title('Frequency of WT')
   grid on
  ylabel('Frequency')
  ylim([10 62])
  text(0.05,1.1,'a)','units','normalized','fontsize',10)
  
       ax.XAxis.MinorTickValues = 0:1:73;
     grid on;
     ax.XMinorGrid = 'on';
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Frequency





CN = 5; % THIS IS THE NUMBER OF CLUSTERS
% CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1948-2019-June.csv']);
% CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1980-2019-ERA-Interim.csv']); %% C6-daily-new-1980-2019-ERA5-1x1.csv
CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1980-2019-MERRA2.csv']); 
%%% C6-daily-new-1948-2019.csv
% [X1a,Y1a] = meshgrid(LON1,LAT1);
% [X1,Y1] = meshgrid(lon1,lat1);
% FAR3 = interp2(X1,Y1,scale1',X1a,Y1a, 'linear') ;

 C14 = CC(:,2) + 1;  % from python to matlab
% % C14(C14==1) = 10;
% % C14(C14==4) = 1;
% % C14(C14==10) = 4;

T(1:40,1:CN,1:2) = 0;
ST = [];

WT1 = [];
    for i = 1980: 2019
        i
           date0 = datetime(1980,1,1);
           
%           if i == 2019 
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,31);
%           else
%                date1 = datetime(i,3,1);
%                date2 = datetime(i,5,31);
%            end
           
           startday =  daysact(date0,date1) + 1;
           endday = daysact(date0,date2) + 1;
           sdays = C14(startday:endday);
           
           k = 0; % number of elements in the same cluster
           ST = 0;
           for j = 1 : numel(sdays)
                if j == 1
%                      T = sdays(1);
                     k  = 1;
                else
                     if sdays(j) == sdays(j-1)
                           k = k + 1;
                     else 
                           if k >= 3
                                T(i-1979,sdays(j-1),1)  = T(i-1979,sdays(j-1),1) + 1;  
                                T(i-1979,sdays(j-1),2) = T(i-1979,sdays(j-1),2) +  k;
%                                 ST{i-1979,sdays(j-1)}  = [k; ST{i-1979,sdays(j-1)} ] ;
                           end
                           k = 1;
                     end
                end
           end                  
           WT1{i - 1979}  = find(sdays  == 2);
%            WT1{i - 1979} = a;
    end

%     figure;
%     plot(squeeze(T(:,1,4)))


  lat1 =  ncread(['Y:\CPC\precip.V1.0.' num2str(1948) '.nc'],'lat'); 
  lon1 =  ncread(['Y:\CPC\precip.V1.0.' num2str(1948) '.nc'],'lon');

load PrecipWT1-obs.mat;
load Precip1-obs.mat;

     ax(2) = axes('position',sub_pos{1,2},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
    m_pcolor(lon1,lat1,squeeze(nanmean(Precip(end,:,:),1))'./squeeze(nanmean(Precip1(end,:,:),1))'); % plot imagesc (grid)

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
   caxis([0 0.8])
%    title('(b) MERRA-2 2019','fontsize',10)
   text(0.05,1.1,'(b) MERRA-2 2019','units','normalized','fontsize',10)
   
    ax(3) = axes('position',sub_pos{1,3},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
   m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
    m_pcolor(lon1,lat1,squeeze(nanmean(Precip(1:end,:,:),1))'./squeeze(nanmean(Precip1(1:end,:,:),1))'); % plot imagesc (grid)
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
    
   caxis([0 0.8])
   text(0.05,1.1,'(c) MERRA-2 Climatology','units','normalized','fontsize',10)

   
CN = 6; % 

CC = [];
CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-1979-2019-June.csv']); 
C14 = CC(:,2) + 1;  % from python to matlab
C14(C14==1) = 10;
C14(C14==2) = 1;
C14(C14==10) = 2;

T(1:40,1:CN,1:2) = 0;
ST = [];

WT1 = [];
    for i = 1980: 2019
        i
             date0 = datetime(1979,1,1);
           
%           if i == 2019 
               date1 = datetime(i,1,1);
               date2 = datetime(i,5,31);
%           else
%                date1 = datetime(i,3,1);
%                date2 = datetime(i,5,31);
%            end
           
           startday =  daysact(date0,date1) + 1;
           endday = daysact(date0,date2) + 1;
           sdays = C14(startday:endday);
           
           k = 0; % number of elements in the same cluster
           ST = 0;
           for j = 1 : numel(sdays)
                if j == 1
%                      T = sdays(1);
                     k  = 1;
                else
                     if sdays(j) == sdays(j-1)
                           k = k + 1;
                     else 
                           if k >= 3
                                T(i-1979,sdays(j-1),1)  = T(i-1979,sdays(j-1),1) + 1;  
                                T(i-1979,sdays(j-1),2) = T(i-1979,sdays(j-1),2) +  k;
%                                 ST{i-1979,sdays(j-1)}  = [k; ST{i-1979,sdays(j-1)} ] ;
                           end
                           k = 1;
                     end
                end
           end                  
           WT1{i - 1979}  = find(sdays  == 1);
%            WT1{i - 1979} = a;
    end

  lat1 =  ncread(['Y:\CPC\precip.V1.0.' num2str(1948) '.nc'],'lat'); 
  lon1 =  ncread(['Y:\CPC\precip.V1.0.' num2str(1948) '.nc'],'lon');
    Precip = [];
    Precip1 = [];

load Precip-ncepncar.mat;
load Precip1-ncepncar.mat;

     ax(4) = axes('position',sub_pos{2,2},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
     m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
    m_pcolor(lon1,lat1,squeeze(nanmean(Precip(end,:,:),1))'./squeeze(nanmean(Precip1(end,:,:),1))'); % plot imagesc (grid)

    colormap(ax(4),BBbar)
    shading flat;
    hold on
    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
   caxis([0 0.8])
%    title('(d) NCEP/NCAR 2019','fontsize',10)
 text(0.05,1.1,'(d) NCEP/NCAR 2019','units','normalized','fontsize',10)
   
    ax(5) = axes('position',sub_pos{2,3},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
   m_proj('Lambert','longitudes',[251 280],'latitudes',[35 48],'rectbox','on');
    hold on
    m_grid('linestyle','none','tickdir','out','linewidth',1,'xticklabels',[],'yticklabels',[]);

    set(findobj('tag','m_grid_color'),'facecolor','none') 
    hold on;
    m_pcolor(lon1,lat1,squeeze(nanmean(Precip(1:end,:,:),1))'./squeeze(nanmean(Precip1(1:end,:,:),1))'); % plot imagesc (grid)
    colormap(ax(5),BBbar)
    shading flat;
    hold on

    m_coast('linewidth',1,'color','b');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color','k'); 
    end
    
   caxis([0 0.8])
%     caxis([-15 15])
%    title('(e) NCEP/NCAR Climatology','fontsize',10)
    text(0.05,1.1,'(e) NCEP/NCAR Climatology','units','normalized','fontsize',10)
   %%%%%%%%%%%%%%%%%%%%%%
   
%    colorbar('horiz','ticklength',0);
   set([ax(2) ax(3) ax(4) ax(5) ],'clim',[0 0.8]); % set color limit for each subplot
%    set([ax(1) ax(2) ax(3) ax(4) ax(5) ax(6) ax(7) ax(8) ax(9) ax(10)],'clim',[-0.3 0.3]); % set color limit for each subplot
   B= colorbar('horzi','ticklength',0); % colorbar('vert')
   set(B, 'Position', [ 0.14 0.278 .74 .025]);  
   set(B,'fontsize',8);      
   text(275.6,28.6,'unit: mm','fontsize',7)
   
   
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WT1
  
 load('E:\code\matlab\colorbar\BlueRed64.mat');
 BBbar1 = (BBbar(1:60,:));

%%%%%%%%%%%%%%%%%%
    gph = ncread('E:\code\python\Weatherregimes\Kmean-5C-center-gph-MERRA2-19792019.nc','gph');
    lon2 = ncread('E:\code\python\Weatherregimes\Kmean-5C-center-gph-MERRA2-19792019.nc','lon');
    lat2 = ncread('E:\code\python\Weatherregimes\Kmean-5C-center-gph-MERRA2-19792019.nc','lat');

 ax(6) = axes('position',sub_pos{1,4},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','off','Layer','top'); 
m_proj('Lambert','longitudes',[220 300],'latitudes',[20 50],'rectbox','on');
    m_grid('linestyle','none','tickdir','out','linewidth',0.2,'fontsize',10,'xtick',[ 260 280],'ytick',[20 40],'xticklabels',[],'yticklabels',[]);    
    set(findobj('tag','m_grid_color'),'facecolor','none')   
[lon22,lat22] = meshgrid(lon2,lat2);
hold on;
 m_grid('linestyle','none','tickdir','out','linewidth',0.2,'fontsize',10,'xticklabels',[],'ytick',[20 40],'yticklabels',[]);  

 [cs,h]= m_contourf(lon2,lat2,squeeze(gph(:,:,2))',-180:10:180,'edgecolor','none');
% [cs,h]= m_contourf(lon1+360,lat1,squeeze(nanmean(qu(:,:,1:6),3))','edgecolor','none');
colormap(ax(6),BBbar1)
     m_coast('linewidth',0.2,'color','black');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color',[0.5 0.5 0.5]); 
    end   
%    title('(f) MERR2 GPH Anomaly','fontsize',10)
text(0.05,1.1,'(f) MERR2 GPH Anomaly','units','normalized','fontsize',10)
   
   gph = [];
   lon2 = [];
   lat2 = [];
      gph = ncread('E:\code\python\Weatherregimes\Kmean-5C-center-gph-ncep-ncar-19792019.nc','gph');
    lon2 = ncread('E:\code\python\Weatherregimes\Kmean-5C-center-gph-ncep-ncar-19792019.nc','lon');
    lat2 = ncread('E:\code\python\Weatherregimes\Kmean-5C-center-gph-ncep-ncar-19792019.nc','lat');
    
     ax(7) = axes('position',sub_pos{2,4},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','off','Layer','top'); 
m_proj('Lambert','longitudes',[220 300],'latitudes',[20 50],'rectbox','on');
    m_grid('linestyle','none','tickdir','out','linewidth',0.2,'fontsize',10,'xtick',[ 260 280],'ytick',[20 40],'xticklabels',[],'yticklabels',[]);  
    set(findobj('tag','m_grid_color'),'facecolor','none') 
    
[lon22,lat22] = meshgrid(lon2,lat2);
hold on;

 [cs,h]= m_contourf(lon2,lat2,squeeze(gph(:,:,5))',-180:10:180,'edgecolor','none');
% [cs,h]= m_contourf(lon1+360,lat1,squeeze(nanmean(qu(:,:,1:6),3))','edgecolor','none');

colormap(ax(7),BBbar1)
% 
% hold on;
% %  m_vec(1, lon11+360,lat11,squeeze(nanmean(qu(:,:,1:6),3))'*0.005,squeeze(nanmean(qv(:,:,1:6),3))'*0.005,'k');
% m_vec;
% [hpv5, htv5] = m_vec(1,203, 2, 0.25, 0, 'b', 'key', '500 kgm^-^1s^-^1');
     m_coast('linewidth',0.2,'color','black');
    M = m_shaperead('E:\coast\USA_adm\USA_adm1');
    hold ;
    for k=1: size(M.ncst)-1
        hold on
       m_plot(M.ncst{k}(1:1:end,1)+360,M.ncst{k}(1:1:end,2),'linewidth',0.2,'color',[0.5 0.5 0.5]); 
    end   
     text(0.05,1.1,'(g) NCEP/NCAR GPH Anomaly','units','normalized','fontsize',10)

   set([ax(6) ax(7) ],'clim',[-180 180]); % set color limit for each subplot
   B= colorbar('horzi','ticklength',0); % colorbar('vert')
   set(B, 'Position', [ 0.14 0.045 .74 .025]);  
   set(B,'fontsize',8);      
                h=gcf;
                set(h,'PaperPositionMode','auto');         
                set(h,'PaperOrientation','landscape');   % 

end

