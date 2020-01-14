function [outputArg1,outputArg2] = PlotFigure2TrendSlope4Panels(inputArg1,inputArg2)
%PLOTFIGURE2TRENDSLOPE4PANELS Summary of this function goes here
%   Detailed explanation goes here


plotheight=20;
plotwidth=18;
subplotsx=2; % number of columns
subplotsy=2; % number of rows 
leftedge=2;
rightedge=1.5;  
topedge=1;
bottomedge=2.6;
spacex=1.5;
% spacey=0.2;
spacey=1.2;
fontsize=6;   
sub_pos=subplot_pos(plotwidth,plotheight,leftedge,rightedge,bottomedge,topedge,subplotsx,subplotsy,spacex,spacey);
%setting the Matlab figure
f = figure('visible','on');
clf(f);
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperSize', [plotwidth plotheight]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 plotwidth plotheight]);


CN = 6; % THIS IS THE NUMBER OF CLUSTERS
 
for TT = 1 : 1


fre = [];
WT2 = [2 6 1 3 6 3 5 3 6 1]
for i = 1 : 10 
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CanESM2-HISTALL-19792014-r' ENS '.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
          fre(i,j) = numel(PP(PP == WT2(i)));
    end
end


CC =[];
C141 = [];
CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CIPSL-CM6A-LR-HISTALL-19792014.csv']);
C14 = CC(:,2) + 1;  % from python to matlab
NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')
end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
     fre(11,i) = numel(PP(PP == 5)) 
end
    
 
     CC =[];
    C141 = [];
    NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-HISTALL-19792014.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014

        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    % NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
    A = [1:365];
    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 5)) 
    end
      
     %%%%%%%% gfdl-cm4
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-CM4-HISTALL-19792014.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(7,j) = numel(PP(PP == 3));
% %     end
% %     %%%%%%%%   7


% %     
% %          %%%%%%%% gfdl-esm4
% %     
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-ESM4-HISTALL-19792014--r1.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(8,j) = numel(PP(PP == 1));
% %     end
    %%%%%%%%   7
    
   %%%  
      CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(13,i) = numel(PP(PP == 4))
end

   %%%%%%%%   
    CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab

for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(14,i) = numel(PP(PP == 5))
end
 
    
 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r3.csv']);
 NumDays = [];
 C14 = CC(:,2) + 1;  % from python to matlab

for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(15,i) = numel(PP(PP == 6))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(16,i) = numel(PP(PP == 3))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(17,i) = numel(PP(PP == 4))
end


 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(18,i) = numel(PP(PP == 6))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(19,i) = numel(PP(PP == 4))
end

    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(20,i) = numel(PP(PP == 1))
end

%     subplot(1,1,TT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot


ax(1) = axes('position',sub_pos{1,1},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');

hist = nanmean(fre,1);
bb(:,1) =  2*std(fre,[],1)/sqrt(20);
bb(:,2) = 2*std(fre,[],1)/sqrt(20);

boundedline((2:36)',hist(2:end),bb(2:end,2),'k-','alpha');

hold on;
xx(1) = plot(2:36,hist(2:end),'k-','linewidth',1.5);

%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% CMIP5
%%%%%%%%%%%%%%%%%%%%%%%%%% CMIP5
   CC = [];
   C14 = [];
   CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-GFDL-esm2m-HISTALL.csv']);
% [X1a,Y1a] = meshgrid(LON1,LAT1);
% [X1,Y1] = meshgrid(lon1,lat1);
% FAR3 = interp2(X1,Y1,scale1',X1a,Y1a, 'linear') ;
C14 = CC(:,2) + 1;  % from python to matlab
C15ALL = reshape(C14,[365 55]);

CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-GFDL-esm2m-HISTNAT.csv']);
C15NAT = reshape(CC(:,2)+1,[365 55]);

CC = [];
CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-GFDL-esm2m-HISTGHG.csv']);
C15GHG = reshape(CC(:,2)+1,[365 55]);

% A = [31:150 1:365];
A = [1:152];
frecmip5 = [];
for i = 1 : 55
     PP = [];
     PP = C15ALL(A,i);
     PP1 = C15NAT(A,i);
     PP2 = C15GHG(A,i);
     frecmip5(i,1) = numel(PP(PP == 6))
     frecmip5(i,2) = numel(PP1(PP1 == 5))
     frecmip5(i,3) = numel(PP2(PP2 == 6))
end


C14 = [];
CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-BNU-HISTALL.csv']);
C14 = CC(:,2)+1;  % from python to matlab
C15ALL = reshape(C14,[365 56]);

CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-BNU-HISTNAT.csv']);
C15NAT = reshape(CC(:,2)+1,[365 56]);

CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-BNU-HISTGHG.csv']);
C15GHG = reshape(CC(:,2)+1,[365 56]);

A = [1:152];
fre1cmip5 = [];
for i = 1 : 56
     PP = [];
     PP = C15ALL(A,i);
     PP1 = C15NAT(A,i);
     PP2 = C15GHG(A,i);
     fre1cmip5(i,1) = numel(PP(PP == 4))
     fre1cmip5(i,2) = numel(PP1(PP1 == 4))
     fre1cmip5(i,3) = numel(PP2(PP2 == 4))
end

CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-IPSL-CM5A-LR-HISTALL.csv']);
C14 = CC(:,2) + 1;  % from python to matlab
C15ALL = reshape(C14,[365 56]);

CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-IPSL-CM5A-LR-HISTNAT.csv']);
C15NAT = reshape(CC(:,2)+1,[365 56]);

CC = [];
CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-1951-2005-IPSL-CM5A-LR-HISTGHG.csv']);
C15GHG = reshape(CC(:,2)+1,[365 56]);

% A = [1:150 1:365];
A = [1:152];
fre2cmip5 = []
for i = 1 : 56
     PP = [];
     PP = C15ALL(A,i);
     PP1 = C15NAT(A,i);
     PP2 = C15GHG(A,i);
     fre2cmip5(i,1) = numel(PP(PP == 6)); % ALL FORCING
     fre2cmip5(i,2) = numel(PP1(PP1 == 3));
     fre2cmip5(i,3) = numel(PP2(PP2 == 5));
end


% fre3 = (fre + fre1(2:56,:) + fre2(2:56,:))/3;

%         SP = [];
%         ypred = [];
%     for j = 1 : 3
%          TCF =squeeze(fre3(11+19:end,j)); % MODELS
%          [b,dev,stats] = glmfit((1:26)',TCF ,'poisson','link','log'); % common glm 
%         yfit = glmval(b,(1:26)','log');  % 1960:2005
%         ypred(:,j) = yfit;  
% %         mdl = fitlm((1:72)',TCF);
%        SP(j,1) =  stats.beta(2)
%        SP(j,2) =  stats.p(2)
% %           pp(j) = mdl.Coefficients.pValue(2);  
% %         ppv(j) = mdl.Coefficients.Estimate(2);        
% %         ypred(:,j) = predict(mdl,(1:72)');      
%     end
    
%     colormap(BBbar)
%     hold on;
%     for i = 1 : 3
%         hold on
%         
%         if i == 1 % all
%               h(6) = plot((1:26)',squeeze(ypred(:,i)),'Color',[0 0 0],'linewidth',2)  ;            
%         elseif i == 2 % nat
%               h(7) =  plot((1:26)',squeeze(ypred(:,i)),'Color',[0.85 0.85 0.85],'linewidth',2)   ;
%         else % GHG
%               h(8) =  plot((1:26)',squeeze(ypred(:,i)),'Color',[0.5 0.5 0.5],'linewidth',2);
%         end%,(1:72)',squeeze(T(:,3,1)),...
%         %'Color',squeeze(COLOR(3,:)),(1:72)',squeeze(T(:,4,1)),'Color',squeeze(COLOR(4,:)),(1:72)',squeeze(T(:,5,1)),'Color',COLOR(5,:))
%     end


hold on
FRE1(:,1) = frecmip5(:,1);
FRE1(:,2) = fre1cmip5(2:56,1);
FRE1(:,3) = fre2cmip5(2:56,1);
FRE11 = FRE1(30:end,:);
histcmip5 = nanmean(FRE11,2);
bbcmip5(:,1) =  2*std(FRE11,[],2)/sqrt(10);
bbcmip5(:,2) = 2*std(FRE11,[],2)/sqrt(10);
boundedline((2:27)',histcmip5,bbcmip5(:,1),'m-','alpha');
hold on;
xx(2) = plot(2:27,histcmip5(1:end),'m-','linewidth',1.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CMIP5


% % % %%%%%%%%%%%%%%%%%%%%%%%%% CESM
% % %           %%%%%%%%%%%%%%%%%%%%%%%CESM
% % %        
WT1 = [6 6 3 5 2 3 5 6 6 5 5 5 4 5 2 2 2 4 2 2 3 1 2 6 4 5 4 3 6 4 5 4 3 2 2];

for i = 1 : 35 
    if i <= 9
        ENS  = ['00' num2str(i)];
    else
        ENS  = ['0' num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-cesm-le-' ENS '.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 58]);

    A = [1:152];
    for j = 33 : 58
         PP = [];
         PP = C141(A,j);
         frecesm(i,j-32) = numel(PP(PP == WT1(i))); 
    end
end %% 
% load E:\code\matlab\colorbar\BBbar-Sole-12.mat
     cesmfre =  squeeze(nanmean(frecesm,1));
%      FRE11 = fre(30:end,:);
% histCESM = nanmean(fre,1);
bbcesm(:,1) =  2*std(frecesm,[],1)/sqrt(35);
bbcesm(:,2) = 2*std(frecesm,[],1)/sqrt(35);
boundedline((2:27)',cesmfre,bbcesm(:,1),'g-','alpha');
hold on;
xx(3) = plot(2:27,cesmfre(1:end),'g-','linewidth',1.5);
     
%          SP1 = [];
%         ypred = [];
%     for j = 1 : 1
%    
%        [b,dev,stats] = glmfit((1:26)',cesmfre(13+20:end) ,'poisson','link','log'); % common glm 
%        yfit = glmval(b,(1:26)','log');  
%        ypred(:,j) = yfit;  
%        SP1(j,1) =  stats.beta(2)
%        SP1(j,2) =  stats.p(2)    
%     end
%         hold on;
%      for i = 1 : 1
%               h(5) = plot((1:26)',squeeze(ypred(:,i)),'Color',COLOR(5,:),'linewidth',2);
%      end
%%%%%%% cesm 

%%%%%%%%%%%%%%%%% CESM

  load  E:\code\matlab\Iowa2019\FREREANA.mat;
        FREREANA = transpose(FREREANA(1:40,:));
        reana(1:39) = nanmean(FREREANA(:,1:39),1);
        reana(40) = nanmean(FREREANA(1:2,40),1);
        
        hold on
        bb4(1:39,1) = 2* std(FREREANA(:,1:39),[],1)/sqrt(4);
        bb4(1:39,2) = 2*std( FREREANA(:,1:39),[],1)/sqrt(4);
        
        bb4(40,1) = 2* std(FREREANA(1:2,40),[],1)/sqrt(2);
        bb4(40,2) = 2* std( FREREANA(1:2,40),[],1)/sqrt(2);
boundedline((2:36)',reana(1:35)',bb4(1:35,:),'cmap',[0,0,255]/255,'alpha');


xx(4) = plot(2:36,reana(1:35)','color',[0,0,255]/255,'linewidth',1.5);
hold on;
set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.01 .01])% 'Grid', 'on')
    
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = ax.XAxis.Limits(1):1:ax.XAxis.Limits(2);

      if TT == 1
          legend(xx(1:4),'HIST-All-CMIP6','HIST-All-CMIP5','CESM-LE','OBS')
      end
      ylabel('Frequency')
      xlim([1 37])
      set(gca, 'XTick', [2 12 22 32],'XMinorTick','on')
      set(gca, 'XTickLabel', { '1980', '1990', '2000','2010'},'fontsize',8)
      set(gca, 'Box', 'on', 'TickDir', 'out')
      grid on;
end 

text(0.1,0.92,'a)','fontsize',10,'units','normalized')

%%%%%%%%%%%%%%%%%%% trend
  ax(2) = axes('position',sub_pos{2,1},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');
 
for i = 1 : size(fre,1)
      [b,dev,stats] = glmfit((2:36)',fre(i,2:end) ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(2:36)','log');  
       ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       hold on;
       h(1) = plot((2:36)',squeeze(ypred(1:end,1)),'Color',[0.8 0.8 0.8],'linewidth',0.5);
end      
hold on;

[b,dev,stats] = glmfit((2:36)',nanmean(fre(:,2:end),1) ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(2:36)','log');  
       ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       hold on;
       h(2) = plot((2:36)',squeeze(ypred(1:end,1)),'Color','black','linewidth',2);
       
 set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.01 .01])% 'Grid', 'on')
  
%    set(gca, 'Box', 'on','TickLength', [.01 .01], 'YMinorTick', 'on')% 'Grid', 'on')
   
        ax = gca;
        ax.XAxis.MinorTick = 'on';
        ax.XAxis.MinorTickValues = ax.XAxis.Limits(1):1:ax.XAxis.Limits(2);
        
        reana = [];
        load  E:\code\matlab\Iowa2019\FREREANA.mat;
        FREREANA = transpose(FREREANA(1:40,:));
        reana(1:35) = nanmean(FREREANA(:,1:35),1);
%         reana(40) = nanmean(FREREANA(1:2,40),1);
        
        hold on
        bb4(1:35,1) = 2*std(FREREANA(:,1:35),[],1)/sqrt(4);
        bb4(1:35,2) = 2*std( FREREANA(:,1:35),[],1)/sqrt(4);
        
%         bb4(40,1) = 2* std(FREREANA(1:2,40),[],1)/sqrt(2);
%         bb4(40,2) = 2* std( FREREANA(1:2,40),[],1)/sqrt(2);

       ypred = [];
      [b,dev,stats] = glmfit((2:36)',reana,'poisson','link','log'); % common glm 
       yfit = glmval(b,(2:36)','log');  
       ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       hold on;
       h(3) = plot((2:36)',squeeze(ypred(:,1)),'-','Color',[0,0,255]/255,'linewidth',1.5);
%        
%        COLOR(4,:) = [255,127,0]/255;
       
       
      if TT == 1
         legend(h(1:3),'HIST-All Member','HIST-ALL Mean','OBS-Four Reanalysis Mean')
      end
       ylabel('Frequency')

% title(SEASON)
        xlim([1 37])
   set(gca, 'XTick', [2 12 22 32],'XMinorTick','on')
   set(gca, 'XTickLabel', { '1980', '1990', '2000','2010'},'fontsize',8)
  set(gca, 'Box', 'on', 'TickDir', 'out')
  grid on;
  text(0.1,0.92,'b)','fontsize',10,'units','normalized')
%%%%%%%%%%%%%%%%%%% trend


%%%%%%%%%%%%%%%%%%%%%%%%% YM 
   for TT = 1 : 1

fre = [];
WT2 = [2 6 1 3 6 3 5 3 6 1]
for i = 1 : 10 
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CanESM2-HISTALL-19792014-r' ENS '.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
          fre(i,j) = numel(PP(PP == WT2(i)));
    end
end


CC =[];
C141 = [];
CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CIPSL-CM6A-LR-HISTALL-19792014.csv']);
C14 = CC(:,2) + 1;  % from python to matlab
NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')
end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
     fre(11,i) = numel(PP(PP == 5)) 
end
    
    %%%%%%%% C6-daily-new-CIPSL-CM6A-LR-HISTALL-19792014.csv
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-cesm2-HISTALL-19792014-r2.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(3,j) = numel(PP(PP == 2));
% %     end
% %     %%%%%%%%
% %     
% %     CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-HadGEM3-GC31HISTALL-19792014-r2.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[360 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(4,j) = numel(PP(PP == 5));
% %     end
% %     %%%%%%%C6-daily-new-CNRM-ESM2-1-HISTALL-19792014.csv
% %     
% %            CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-ESM2-1-HISTALL-19792014.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     for i = 1979 : 2014
% % 
% %         str = ['1-jan-' num2str(i)]
% %         str1 = ['31-dec-' num2str(i)]
% %         NumDays(i-1978) = daysact(str,str1) + 1;
% %        if i == 1979  
% %            C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
% %        else
% %            C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
% %        end
% %     % NumDays = daysact('1-jan-2006','31-dec-2100')
% % 
% % end
% % 
% % % A = [1:150 151:365];
% %     A = [1:365];
% %     for i = 1 : 36
% %          PP = [];
% %          PP = C16ALL{i}(:);
% %          fre(5,i) = numel(PP(PP == 5)) 
% %     end
    
 
     CC =[];
    C141 = [];
    NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-HISTALL-19792014.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014

        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    % NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
    A = [1:365];
    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 5)) 
    end
      
     %%%%%%%% gfdl-cm4
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-CM4-HISTALL-19792014.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(7,j) = numel(PP(PP == 3));
% %     end
% %     %%%%%%%%   7


% %     
% %          %%%%%%%% gfdl-esm4
% %     
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-ESM4-HISTALL-19792014--r1.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(8,j) = numel(PP(PP == 1));
% %     end
    %%%%%%%%   7
    
   %%%  
      CC =[];
    C141 = [];
    NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTALL-19792014.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(13,i) = numel(PP(PP == 1))
end


   %%%%%%%%   
    CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab

for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(14,i) = numel(PP(PP == 5))
end
 
    
 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r3.csv']);
 NumDays = [];
 C14 = CC(:,2) + 1;  % from python to matlab

for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(15,i) = numel(PP(PP == 6))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(16,i) = numel(PP(PP == 3))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(17,i) = numel(PP(PP == 4))
end


 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(18,i) = numel(PP(PP == 6))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(19,i) = numel(PP(PP == 4))
end

    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(20,i) = numel(PP(PP == 1))
end

    %%%%%%%%   
    
    %%% 
% % %           CC =[];
% % %     C141 = [];
% % %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-BCC-ESM1-HISTALL-19792014.csv']);
% % %     C14 = CC(:,2) + 1;  % from python to matlab
% % %        C141 = reshape(C14,[365 36]);
% % % 
% % %     A = [1:365];
% % %     for j = 1 : 36
% % %          PP = [];
% % %          PP = C141(:,j);
% % %          fre(10,j) = numel(PP(PP == 1));
% % %     end
% % %     
% % %     
% % %     CC =[];
% % %     C141 = [];
% % %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-UKESM1-0-HISTALL-19792014--r1.csv']);
% % %     C14 = CC(:,2) + 1;  % from python to matlab
% % %     C141 = reshape(C14,[360 36]);
% % % 
% % %     A = [1:365];
% % %     for j = 1 : 36
% % %          PP = [];
% % %          PP = C141(:,j);
% % %          fre(11,j) = numel(PP(PP == 1));
% % %     end
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GISS-E2-1-G-HISTALL-19792014-GHG.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(12,j) = numel(PP(PP == 4));
% %     end 

ax(3) = axes('position',sub_pos{1,2},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');     
hist = nanmean(fre,1);
bb(:,1) =  2*std(fre,[],1)/sqrt(20);
bb(:,2) = 2*std(fre,[],1)/sqrt(20);

% boundedline((1:36)',hist,bb,'k-');

hold on;
xx(1) = plot(2:36,hist(2:end),'k-','linewidth',1.5);
hold on;
 set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.01 .01])% 'Grid', 'on')
  
%    set(gca, 'Box', 'on','TickLength', [.01 .01], 'YMinorTick', 'on')% 'Grid', 'on')
ax = gca;
ax.XAxis.MinorTick = 'on';
ax.XAxis.MinorTickValues = ax.XAxis.Limits(1):1:ax.XAxis.Limits(2);

text(0.1,0.92,'c)','fontsize',10,'units','normalized')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %     plot(nanmean(fre,1),'r-','linewidth',1.5) 
% %    
   ypred =[];
   
      [b,dev,stats] = glmfit((1:36)',nanmean(fre,1) ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(1:36)','log');  
       ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       hold on;
       h(1) = plot((2:36)',squeeze(ypred(2:end,1)),'Color','black','linewidth',2);
% %        
 
   fre = [];
 %%%%%%%%%%%%%%%% ghg
   WT1 = [1 2 3 4 6 1 2 5 6 4]; % ghg
   WT2 = [6 1 4 2 2 3 2 5 1 2]; % nat
%%%%%%%%%%%%%%%%%%%%%% ghg
% WT1 = [6 6 3 5 2 3 5 6 6 5 5 ];

for i = 1 : 10 %% i = 12
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CanESM-HISTALL-19792014--r' ENS '-GHG.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
    %      PP1 = C16NAT(A,i);
    %      PP2 = C16GHG(A,i);
    %       fre(i,1) = numel(PP(PP == 1))
          fre(i,j) = numel(PP(PP == WT1(i)));
    % %       fre(i,3) = numel(PP(PP == 3))
    % %             fre(i,4) = numel(PP(PP == 4))
    % %       fre(i,5) = numel(PP(PP == 5))
    % %             fre(i,6) = numel(PP(PP == 6))
    % % %       fre(i,7) = numel(PP(PP == 7))
    %             fre(i,8) = numel(PP(PP == 8))

    end
end
% load E:\code\matlab\colorbar\BBbar-Sole-12.mat


%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG
    CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(11,i) = numel(PP(PP == 5))
    end
    
        CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 1))
    end

     CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(13,i) = numel(PP(PP == 1))
    end
%%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG

%%%%%%%%%%%%% MRI-ESM
CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(14,i) = numel(PP(PP == 5))
    end
    

    CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(15,i) = numel(PP(PP == 3))
    end
    
    
        CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(16,i) = numel(PP(PP == 4))
    end
    
%%%%%%%%%%%%% MRI-ESM

%%%%%%%%%%%%%% C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv
        CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(17,i) = numel(PP(PP == 4))
    end
    
            CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(18,i) = numel(PP(PP == 1))
    end
    
                CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(19,i) = numel(PP(PP == 5))
    end
    
                    CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(20,i) = numel(PP(PP == 4))
    end

% %     
% %                      CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r6.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     for i = 1979 : 2014
% %         str = ['1-jan-' num2str(i)]
% %         str1 = ['31-dec-' num2str(i)]
% %         NumDays(i-1978) = daysact(str,str1) + 1;
% %        if i == 1979  
% %            C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
% %        else
% %            C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
% %        end
% %     end
% % 
% %     for i = 1 : 36
% %          PP = [];
% %          PP = C16ALL{i};
% %          fre(21,i) = numel(PP(PP == 2))
% %     end
% %     
% %                          CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r7.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     for i = 1979 : 2014
% %         str = ['1-jan-' num2str(i)]
% %         str1 = ['31-dec-' num2str(i)]
% %         NumDays(i-1978) = daysact(str,str1) + 1;
% %        if i == 1979  
% %            C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
% %        else
% %            C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
% %        end
% %     end
% % 
% %     for i = 1 : 36
% %          PP = [];
% %          PP = C16ALL{i};
% %          fre(22,i) = numel(PP(PP == 6))
% %     end

%%%%%%%%%%%%%%% C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv

% plot(fre','color',[0.8 0.8 0.8],'linewidth',0.3)
% hold on
e20 = nanmean(fre,1);
hold on
bb1(:,1) =  2*std(fre,[],1)/sqrt(20);
bb1(:,2) = 2*std(fre,[],1)/sqrt(20);
% bb1(:,1) = e20 - min(fre,[],1);
% bb1(:,2) = max(fre,[],1) - e20;
% % boundedline((1:36)',e20,bb1,'r-','alpha');
% plot(87:181,eep20f,'color',[1 0.8 0.2],'linewidth',1);
% hold on;
xx(2) = plot(2:36,e20(2:end),'color','red','linewidth',1.5);


% % hold on
% % plot(nanmean(fre,1),'k-','linewidth',1.5)
      [b,dev,stats] = glmfit((1:36)',nanmean(fre,1) ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(1:36)','log');  
       ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       hold on;
       h(2) = plot((2:36)',squeeze(ypred(2:end,1)),'Color','red','linewidth',2);

%%%%%%%%%%%%
fre = [];
for i = 1 : 10 
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CanESM-HISTALL-19792014--r' ENS '-NAT.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
    %      PP1 = C16NAT(A,i);
    %      PP2 = C16GHG(A,i);
    %       fre(i,1) = numel(PP(PP == 1))
          fre(i,j) = numel(PP(PP == WT2(i)));
    % %       fre(i,3) = numel(PP(PP == 3))
    % %             fre(i,4) = numel(PP(PP == 4))
    % %       fre(i,5) = numel(PP(PP == 5))
    % %             fre(i,6) = numel(PP(PP == 6))
    % % %       fre(i,7) = numel(PP(PP == 7))
    %             fre(i,8) = numel(PP(PP == 8))

    end
end

%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG
    CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(11,i) = numel(PP(PP == 2))
    end
    
        CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 1))
    end

     CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(13,i) = numel(PP(PP == 4))
    end
%%%%%%%%%%%%%% -CNRM-CM6-1 GHG

%%%%%%%%%%% MRI-ESM
CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
       NumDays = [];
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(14,i) = numel(PP(PP == 3))
    end
    

    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(15,i) = numel(PP(PP == 5))
    end
    
    
        CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(16,i) = numel(PP(PP == 1))
    end
    
%%%%%%%%%%%%% MRI-ESM

%%%%%%%%%%%%%% C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv
        CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(17,i) = numel(PP(PP == 6))
    end
    
            CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(18,i) = numel(PP(PP == 2))
    end
    
    CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(19,i) = numel(PP(PP == 5))
    end
    
            CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(20,i) = numel(PP(PP == 1))
    end
    

% hold on
% plot(fre','color',[0.4 0.4 0.4],'linewidth',0.3)

e15 = nanmean(fre,1);
hold on
bb2(:,1) =  2*std(fre,[],1)/sqrt(20);
bb2(:,2) =  2*std(fre,[],1)/sqrt(20);
% bb2(:,1) = e15 - min(fre,[],1);
% bb2(:,2) = max(fre,[],1) - e15;
% boundedline((1:36)',e15,bb2,'b-','alpha');

% plot(87:181,eep15f,'k-','color',[0.6 1 1],'linewidth',1);
hold on;
xx(3) = plot(2:36,e15(2:end),'color',[0.2 0 1],'linewidth',1.5);
% % 
% % hold on
% %  plot(nanmean(fre,1),'b-','linewidth',1.5)
      [b,dev,stats] = glmfit((2:36)',nanmean(fre(:,2:end),1) ,'poisson','link','log'); % common glm 
       
       yfit = []; 
       ypred = [];
       yfit = glmval(b,(2:36)','log');  
       ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       hold on;
       h(3) = plot((2:36)',squeeze(ypred(:,1)),'--','Color','blue','linewidth',2);
   
       
% % %          COLOR(4,:) = [255,127,0]/255; 
% % %        
% % %         load  FREREANA.mat;
% % %         FREREANA = transpose(FREREANA(1:40,:));
% % %         reana(1:39) = nanmean(FREREANA(:,1:39),1);
% % %         reana(40) = nanmean(FREREANA(1:2,40),1);
% % %         
% % %         hold on
% % %         bb4(1:39,1) =  std(FREREANA(:,1:39),[],1);
% % %         bb4(1:39,2) = std( FREREANA(:,1:39),[],1);
% % %         
% % %         bb4(40,1) =  std(FREREANA(1:2,40),[],1);
% % %         bb4(40,2) = std( FREREANA(1:2,40),[],1);
% % % % bb2(:,1) = e15 - min(fre,[],1);
% % % % bb2(:,2) = max(fre,[],1) - e15;
% % % 
% % % % ,'cmap',[255 255  0]/255,'transparency', 1
% % % 
% % % 
% % % boundedline((2:41)',reana,bb4,'cmap',[255,127,0]/255,'alpha');
% % % 
% % % % plot(87:181,eep15f,'k-','color',[0.6 1 1],'linewidth',1);
% % % % hold on;
% % % xx(4) = plot(2:41,reana','color',[255,127,0]/255,'linewidth',1.5);
% % % 
% % % ypred = [];
% % %       [b,dev,stats] = glmfit((2:41)',reana,'poisson','link','log'); % common glm 
% % %        yfit = glmval(b,(2:41)','log');  
% % %        ypred(:,1) = yfit;  
% % %        SP1(6,1) =  stats.beta(2)
% % %        SP1(6,2) =  stats.p(2)   
% % %        hold on;
% % %        h(3) = plot((2:41)',squeeze(ypred(:,1)),'-','Color',[255,127,0]/255,'linewidth',2);
% % % %        
%        COLOR(4,:) = [255,127,0]/255;
       
       
      if TT == 1
         legend(xx(1:3),'HIST-All','HIST-GHG','HIST-NAT')
      end
       ylabel('Frequency')

% title(SEASON)
        xlim([1 37])
          ylim([20 34])
   set(gca, 'XTick', [2 12 22 32],'XMinorTick','on')
   set(gca, 'XTickLabel', { '1980', '1990', '2000','2010'},'fontsize',8)
   set(gca, 'Box', 'on', 'TickDir', 'out')
   grid on;
  
   end  

% %    %%%%%%%%%% cmip5
% %    hold on ;
% %    plot(2:36,e15(2:end),'color',[0.2 0 1],'linewidth',1.5);
% %    hold on
% %     FRE1(:,1) = frecmip5(:,1);
% %     FRE1(:,2) = fre1cmip5(2:56,1);
% %     FRE1(:,3) = fre2cmip5(2:56,1);
% %     FRE11 = FRE1(30:end,:);
% %     histcmip5 = nanmean(FRE11,2);
% %     hold on;
% %     plot(2:27,histcmip5(1:end),'k-','linewidth',0.5);
% %     
% %     
% %     hold on 
% %         FRE1(:,1) = frecmip5(:,2);
% %     FRE1(:,2) = fre1cmip5(2:56,2);
% %     FRE1(:,3) = fre2cmip5(2:56,2);
% %     FRE11 = FRE1(30:end,:);
% %     histcmip5 = nanmean(FRE11,2);
% %     hold on;
% %     plot(2:27,histcmip5(1:end),'r-','linewidth',0.5);
% %     
% %         hold on 
% %         FRE1(:,1) = frecmip5(:,3);
% %     FRE1(:,2) = fre1cmip5(2:56,3);
% %     FRE1(:,3) = fre2cmip5(2:56,3);
% %     FRE11 = FRE1(30:end,:);
% %     histcmip5 = nanmean(FRE11,2);
% %     hold on;
% %     plot(2:27,histcmip5(1:end),'b-','linewidth',0.5);
% %    %%%%%%%%%%% cmip5
   
%%%%%%%%%%%%%%%%%%%%%%%%% YM


%%%%%%%%%%%%%%% slope

ax(4) = axes('position',sub_pos{2,2},'XGrid','off','XMinorGrid','off','FontSize',fontsize,'Box','on','Layer','top');     

for TT = 1 : 1
%%%%%%%%%%%%%%%%%%%%%%%%%%% HIST
%   DAYS = 1:150;
% DAYS = ;
% if TT == 1
%    DAYS = 61:150;  
% %    SEASON = 'MAM'
% elseif TT == 2
%    DAYS = 151:240;   
%     SEASON = 'JJA'
% elseif TT == 3
%    DAYS = 241:330;
%     SEASON = 'SON'
% else 
%   DAYS = [1:60 330:360]; 
%    SEASON = 'DJF'
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%% HIST
% %     CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-Canesm-HISTALL-19792014.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(1:152,j);
% %          fre(1,j) = numel(PP(PP == 5));
% %     end
    

fre = [];
WT2 = [2 6 1 3 6 3 5 3 6 1]
for i = 1 : 10 
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CanESM2-HISTALL-19792014-r' ENS '.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
          fre(i,j) = numel(PP(PP == WT2(i)));
    end
end


CC =[];
C141 = [];
CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CIPSL-CM6A-LR-HISTALL-19792014.csv']);
C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')
end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
     fre(11,i) = numel(PP(PP == 5)) 
end
    
    %%%%%%%% C6-daily-new-CIPSL-CM6A-LR-HISTALL-19792014.csv
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-cesm2-HISTALL-19792014-r2.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(3,j) = numel(PP(PP == 2));
% %     end
% %     %%%%%%%%
% %     
% %     CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-HadGEM3-GC31HISTALL-19792014-r2.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[360 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(4,j) = numel(PP(PP == 5));
% %     end
% %     %%%%%%%C6-daily-new-CNRM-ESM2-1-HISTALL-19792014.csv
% %     
% %            CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-ESM2-1-HISTALL-19792014.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     for i = 1979 : 2014
% % 
% %         str = ['1-jan-' num2str(i)]
% %         str1 = ['31-dec-' num2str(i)]
% %         NumDays(i-1978) = daysact(str,str1) + 1;
% %        if i == 1979  
% %            C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
% %        else
% %            C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
% %        end
% %     % NumDays = daysact('1-jan-2006','31-dec-2100')
% % 
% % end
% % 
% % % A = [1:150 151:365];
% %     A = [1:365];
% %     for i = 1 : 36
% %          PP = [];
% %          PP = C16ALL{i}(:);
% %          fre(5,i) = numel(PP(PP == 5)) 
% %     end
    
 
     CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-HISTALL-19792014.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014

        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    % NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
    A = [1:365];
    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 5)) 
    end
      
     %%%%%%%% gfdl-cm4
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-CM4-HISTALL-19792014.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(7,j) = numel(PP(PP == 3));
% %     end
% %     %%%%%%%%   7


% %     
% %          %%%%%%%% gfdl-esm4
% %     
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GFDL-ESM4-HISTALL-19792014--r1.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(8,j) = numel(PP(PP == 1));
% %     end
    %%%%%%%%   7
    
   %%%  
      CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTALL-19792014.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(13,i) = numel(PP(PP == 4))
end

%%%%%%%%   
    CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab

for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(14,i) = numel(PP(PP == 5))
end
 
    
 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r3.csv']);
 NumDays = [];
 C14 = CC(:,2) + 1;  % from python to matlab

for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(15,i) = numel(PP(PP == 6))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(16,i) = numel(PP(PP == 3))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-MRI-ESM2-0-HISTALL-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(17,i) = numel(PP(PP == 4))
end


 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(18,i) = numel(PP(PP == 6))
end

 CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
 NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(19,i) = numel(PP(PP == 4))
end

    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C5-daily-new-CNRM-CM6-HISTALL-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    NumDays = [];
for i = 1979 : 2014
    
    str = ['1-jan-' num2str(i)]
    str1 = ['31-dec-' num2str(i)]
    NumDays(i-1978) = daysact(str,str1) + 1;
   if i == 1979  
       C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
   else
       C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
   end
% NumDays = daysact('1-jan-2006','31-dec-2100')

end

% A = [1:150 151:365];
A = [1:365];
for i = 1 : 36
     PP = [];
     PP = C16ALL{i}(1:152);
%      PP1 = C16NAT(A,i);
%      PP2 = C16GHG(A,i);
%       fre(i,1) = numel(PP(PP == 1))
      fre(20,i) = numel(PP(PP == 1))
end

    %%%%%%%%   
    
    %%% 
% % %           CC =[];
% % %     C141 = [];
% % %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-BCC-ESM1-HISTALL-19792014.csv']);
% % %     C14 = CC(:,2) + 1;  % from python to matlab
% % %        C141 = reshape(C14,[365 36]);
% % % 
% % %     A = [1:365];
% % %     for j = 1 : 36
% % %          PP = [];
% % %          PP = C141(:,j);
% % %          fre(10,j) = numel(PP(PP == 1));
% % %     end
% % %     
% % %     
% % %     CC =[];
% % %     C141 = [];
% % %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-UKESM1-0-HISTALL-19792014--r1.csv']);
% % %     C14 = CC(:,2) + 1;  % from python to matlab
% % %     C141 = reshape(C14,[360 36]);
% % % 
% % %     A = [1:365];
% % %     for j = 1 : 36
% % %          PP = [];
% % %          PP = C141(:,j);
% % %          fre(11,j) = numel(PP(PP == 1));
% % %     end
    
% %    CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-GISS-E2-1-G-HISTALL-19792014-GHG.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     C141 = reshape(C14,[365 36]);
% % 
% %     A = [1:365];
% %     for j = 1 : 36
% %          PP = [];
% %          PP = C141(:,j);
% %          fre(12,j) = numel(PP(PP == 4));
% %     end 
    

   
%     subplot(1,1,TT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% plot

% hist = nanmean(fre,1);
% bb(:,1) =  std(fre,[],1);
% bb(:,2) = std(fre,[],1);
% boundedline((1:36)',hist,bb,'k-');
% hold on;
% xx(1) = plot(1:36,hist,'k-','linewidth',1.5);
% hold on;
%  set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.01 .01])% 'Grid', 'on')
%   
%   
% ax = gca;
% ax.XAxis.MinorTick = 'on';
% ax.XAxis.MinorTickValues = ax.XAxis.Limits(1):1:ax.XAxis.Limits(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% %     plot(nanmean(fre,1),'r-','linewidth',1.5) 
% %    

for i = 1 : size(fre)
      [b,dev,stats] = glmfit((2:36)',fre(i,2:end) ,'poisson','link','log'); % common glm 
      yfit = [];
      ypred = [];
       yfit = glmval(b,(1:36)','log');  
       ypred(:,1) = yfit;  
       TT1(i) =  stats.beta(2)
end      
           pd = fitdist(TT1','Normal'); % control run 1990 CONTROL  
  
%    text(345,2.52,'FAR = 0.81','color','magenta'); 
    x_values = -0.01:0.001:0.03;
    y = normpdf(x_values,pd.mu,pd.sigma);       
    y1 = y/sum(y)*100;
    hold on;
    h(1) = plot(x_values,y1,'k-','LineWidth',2);
   
    fre = [];
 %%%%%%%%%%%%%%%% ghg
   WT1 = [1 2 3 4 6 1 2 5 6 4]; % ghg
   WT2 = [6 1 4 2 2 3 2 5 1 2]; % nat
%%%%%%%%%%%%%%%%%%%%%% ghg
% WT1 = [6 6 3 5 2 3 5 6 6 5 5 ];

for i = 1 : 10 %% i = 12
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CanESM-HISTALL-19792014--r' ENS '-GHG.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
    %      PP1 = C16NAT(A,i);
    %      PP2 = C16GHG(A,i);
    %       fre(i,1) = numel(PP(PP == 1))
          fre(i,j) = numel(PP(PP == WT1(i)));
    % %       fre(i,3) = numel(PP(PP == 3))
    % %             fre(i,4) = numel(PP(PP == 4))
    % %       fre(i,5) = numel(PP(PP == 5))
    % %             fre(i,6) = numel(PP(PP == 6))
    % % %       fre(i,7) = numel(PP(PP == 7))
    %             fre(i,8) = numel(PP(PP == 8))

    end
end
% load E:\code\matlab\colorbar\BBbar-Sole-12.mat


%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG
    CC =[];
    C141 = [];
    NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(11,i) = numel(PP(PP == 5))
    end
    
        CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 1))
    end

     CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTGHG-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(13,i) = numel(PP(PP == 1))
    end
%%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG

%%%%%%%%%%%%% MRI-ESM
CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(14,i) = numel(PP(PP == 5))
    end
    

    CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(15,i) = numel(PP(PP == 3))
    end
    
    
        CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTGHG-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(16,i) = numel(PP(PP == 4))
    end
    
%%%%%%%%%%% MRI-ESM

%%%%%%%%%%%% C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv
        CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(17,i) = numel(PP(PP == 4))
    end
    
            CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i};
         fre(18,i) = numel(PP(PP == 1))
    end
    
                CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i};
         fre(19,i) = numel(PP(PP == 5))
    end
    
     CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i};
         fre(20,i) = numel(PP(PP == 4))
    end
% % 
% %     
% %                      CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r6.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     for i = 1979 : 2014
% %         str = ['1-jan-' num2str(i)]
% %         str1 = ['31-dec-' num2str(i)]
% %         NumDays(i-1978) = daysact(str,str1) + 1;
% %        if i == 1979  
% %            C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
% %        else
% %            C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
% %        end
% %     end
% % 
% %     for i = 1 : 36
% %          PP = [];
% %          PP = C16ALL{i};
% %          fre(21,i) = numel(PP(PP == 2))
% %     end
% %     
% %                          CC =[];
% %     C141 = [];
% %     CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r7.csv']);
% %     C14 = CC(:,2) + 1;  % from python to matlab
% %     for i = 1979 : 2014
% %         str = ['1-jan-' num2str(i)]
% %         str1 = ['31-dec-' num2str(i)]
% %         NumDays(i-1978) = daysact(str,str1) + 1;
% %        if i == 1979  
% %            C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
% %        else
% %            C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
% %        end
% %     end
% % 
% %     for i = 1 : 36
% %          PP = [];
% %          PP = C16ALL{i};
% %          fre(22,i) = numel(PP(PP == 6))
% %     end

%%%%%%%%%%%%%%% C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv

% plot(fre','color',[0.8 0.8 0.8],'linewidth',0.3)
% hold on
% % e20 = nanmean(fre,1);
% % hold on
% % bb1(:,1) =  std(fre,[],1);
% % bb1(:,2) = std(fre,[],1);
% % % bb1(:,1) = e20 - min(fre,[],1);
% % % bb1(:,2) = max(fre,[],1) - e20;
% % boundedline((1:36)',e20,bb1,'r-','alpha');
% % % plot(87:181,eep20f,'color',[1 0.8 0.2],'linewidth',1);
% % % hold on;
% % xx(2) = plot(1:36,e20,'color','red','linewidth',1.5);
% % 
% % 
% % % % hold on
% % % % plot(nanmean(fre,1),'k-','linewidth',1.5)
% %       [b,dev,stats] = glmfit((1:36)',nanmean(fre,1) ,'poisson','link','log'); % common glm 
% %        yfit = glmval(b,(1:36)','log');  
% %        ypred(:,1) = yfit;  
% %        SP1(6,1) =  stats.beta(2)
% %        SP1(6,2) =  stats.p(2)   
% %        hold on;
% %        h(2) = plot((1:36)',squeeze(ypred(:,1)),'Color','red','linewidth',2);

for i = 1 : size(fre)
      [b,dev,stats] = glmfit((2:36)',fre(i,2:end) ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(1:36)','log');  
       ypred(:,1) = yfit;  
       TT1(i) =  stats.beta(2)
end      
           pd = fitdist(TT1','Normal'); % control run 1990 CONTROL  
  
%    text(345,2.52,'FAR = 0.81','color','magenta'); 
    x_values = -0.02:0.001:0.03;
    y = normpdf(x_values,pd.mu,pd.sigma);   
    
    
    GHG = 1 -  normcdf(0.0104,pd.mu,pd.sigma)
    y1 = y/sum(y)*100;
    hold on;
    h(2) = plot(x_values,y1,'r-','LineWidth',2);

%%%%%%%%%%%%
fre = [];
for i = 1 : 10 
    i
    if i <= 9
        ENS  = [num2str(i)];
    else
        ENS  = [num2str(i)]; 
    end
    
    CC =[];
    C141 = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CanESM-HISTALL-19792014--r' ENS '-NAT.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    C141 = reshape(C14,[365 36]);

    A = [1:365];
    for j = 1 : 36
         PP = [];
         PP = C141(1:152,j);
    %      PP1 = C16NAT(A,i);
    %      PP2 = C16GHG(A,i);
    %       fre(i,1) = numel(PP(PP == 1))
          fre(i,j) = numel(PP(PP == WT2(i)));
    % %       fre(i,3) = numel(PP(PP == 3))
    % %             fre(i,4) = numel(PP(PP == 4))
    % %       fre(i,5) = numel(PP(PP == 5))
    % %             fre(i,6) = numel(PP(PP == 6))
    % % %       fre(i,7) = numel(PP(PP == 7))
    %             fre(i,8) = numel(PP(PP == 8))

    end
end

%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG
    CC =[];
    C141 = [];
     NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(11,i) = numel(PP(PP == 2))
    end
    
        CC =[];
    C141 = [];
        NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(12,i) = numel(PP(PP == 1))
    end

     CC =[];
    C141 = [];
        NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-CNRM-CM6-1-HISTNAT-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(13,i) = numel(PP(PP == 4))
    end
%%%%%%%%%%%%%%%% -CNRM-CM6-1 GHG

%%%%%%%%%%%%% MRI-ESM
CC =[];
    C141 = [];
        NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(14,i) = numel(PP(PP == 3))
    end
    

    CC =[];
    C141 = [];
        NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r3.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(15,i) = numel(PP(PP == 5))
    end
    
    
        CC =[];
    C141 = [];
        NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-MRI-ESM2-0-HISTNAT-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(16,i) = numel(PP(PP == 1))
    end
    
%%%%%%%%%%%%% MRI-ESM

%%%%%%%%%%%%%% C6-daily-new-IPSL-CM6A-LR-HISTGHG-19792014-r1.csv
        CC =[];
    C141 = [];
        NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r1.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(17,i) = numel(PP(PP == 6))
    end
    
            CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r2.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(18,i) = numel(PP(PP == 2))
    end
    
            CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r4.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(19,i) = numel(PP(PP == 5))
    end
    
            CC =[];
    C141 = [];
       NumDays = [];
    CC = importdata(['E:\code\python\Weatherregimes\C6-daily-new-IPSL-CM6A-LR-HISTNAT-19792014-r5.csv']);
    C14 = CC(:,2) + 1;  % from python to matlab
    for i = 1979 : 2014
        str = ['1-jan-' num2str(i)]
        str1 = ['31-dec-' num2str(i)]
        NumDays(i-1978) = daysact(str,str1) + 1;
       if i == 1979  
           C16ALL{i-1978} = C14(1:nansum(NumDays(1:1)),1);
       else
           C16ALL{i-1978} = C14(nansum(NumDays(1:end-1))+1:nansum(NumDays),1);   
       end
    end

    for i = 1 : 36
         PP = [];
         PP = C16ALL{i}(1:152);
         fre(20,i) = numel(PP(PP == 1))
    end 

% hold on
% plot(fre','color',[0.4 0.4 0.4],'linewidth',0.3)

% % e15 = nanmean(fre,1);
% % hold on
% % bb2(:,1) =  std(fre,[],1);
% % bb2(:,2) = std(fre,[],1);
% % % bb2(:,1) = e15 - min(fre,[],1);
% % % bb2(:,2) = max(fre,[],1) - e15;
% % boundedline((1:36)',e15,bb2,'b-','alpha');
% % 
% % % plot(87:181,eep15f,'k-','color',[0.6 1 1],'linewidth',1);
% % hold on;
% % xx(3) = plot(1:36,e15,'color',[0.2 0 1],'linewidth',1.5);
% % % % 
% % % % hold on
% % % %  plot(nanmean(fre,1),'b-','linewidth',1.5)
% %       [b,dev,stats] = glmfit((1:36)',nanmean(fre,1) ,'poisson','link','log'); % common glm 
% %        yfit = glmval(b,(1:36)','log');  
% %        ypred(:,1) = yfit;  
% %        SP1(6,1) =  stats.beta(2)
% %        SP1(6,2) =  stats.p(2)   
% %        hold on;
% %        h(3) = plot((1:36)',squeeze(ypred(:,1)),'--','Color','blue','linewidth',2);

  for i = 1 : size(fre)
      [b,dev,stats] = glmfit((2:36)',fre(i,2:end) ,'poisson','link','log'); % common glm 
       yfit = glmval(b,(1:36)','log');  
       ypred(:,1) = yfit;  
       TT1(i) =  stats.beta(2)
end      
           pd = fitdist(TT1','Normal'); % control run 1990 CONTROL  
           NAT = 1 -  normcdf(0.0104,pd.mu,pd.sigma)
%       normcdf(0.0104,pd.mu,pd.sigma)
GHG/NAT
%    text(345,2.52,'FAR = 0.81','color','magenta'); 
    x_values = -0.02:0.001:0.02;
    y = normpdf(x_values,pd.mu,pd.sigma);       
    y1 = y/sum(y)*100;
    hold on;
    h(3) = plot(x_values,y1,'b-','LineWidth',2);   
    
    
    
         COLOR(4,:) = [255,127,0]/255; 
       
        load  E:\code\matlab\Iowa2019\FREREANA.mat;
        FREREANA = transpose(FREREANA(1:40,:));
        reana(1:39) = nanmean(FREREANA(:,1:39),1);
        reana(40) = nanmean(FREREANA(1:2,40),1);
        
        hold on
        bb4(1:39,1) =  std(FREREANA(:,1:39),[],1);
        bb4(1:39,2) = std( FREREANA(:,1:39),[],1);
        
        bb4(40,1) =  std(FREREANA(1:2,40),[],1);
        bb4(40,2) = std( FREREANA(1:2,40),[],1);
% bb2(:,1) = e15 - min(fre,[],1);
% bb2(:,2) = max(fre,[],1) - e15;

% ,'cmap',[255 255  0]/255,'transparency', 1


% boundedline((2:41)',reana,bb4,'cmap',[255,127,0]/255,'alpha');
% 
% % plot(87:181,eep15f,'k-','color',[0.6 1 1],'linewidth',1);
% % hold on;
% xx(4) = plot(2:41,reana','color',[255,127,0]/255,'linewidth',1.5);
% 
% ypred = [];
      [b,dev,stats] = glmfit((2:36)',reana(1:35),'poisson','link','log'); % common glm 
       yfit = glmval(b,(2:41)','log');  
%        ypred(:,1) = yfit;  
       SP1(6,1) =  stats.beta(2)
       SP1(6,2) =  stats.p(2)   
       
       hold on
       
     h(4) =  plot([stats.beta(2) stats.beta(2)],[0 6.6],'Color',[255,127,0]/255,'LineWidth',4)
        xlim([-0.02 0.03])
        ylim([0 7])
%        hold on;
%        h(3) = plot((2:41)',squeeze(ypred(:,1)),'-','Color',[255,127,0]/255,'linewidth',2);
% %        
% %        COLOR(4,:) = [255,127,0]/255;
%        
%        
%       if TT == 1
%          legend(xx(1:4),'HIST-All','HIST-GHG','HIST-NAT','OBS')
%       end
%        ylabel('Frequency')
% 
% % title(SEASON)
        
%    set(gca, 'XTick', [2 12 22 32],'XMinorTick','on')
%    set(gca, 'XTickLabel', { '1980', '1990', '2000','2010'},'fontsize',8)
  legend(h(1:4),'HIST-All','HIST-GHG','HIST-NAT','OBS')
  set(gca, 'Box', 'on', 'TickDir', 'out')
  ylabel('Probability (unit: %)')
  xlabel('Trend')
  grid on;
  text(0.1,0.92,'d)','fontsize',10,'units','normalized')
end  

%%%%%%%%%%%%%%% 1:1:360
end

