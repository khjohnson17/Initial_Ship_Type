%Ship Metrics
%GA02
%KHJ
%2/7/23

%General metrics: length, draft, SOG, SL (SLLM_thirdoctave, 11th column for 50Hz band)
%Extra metrics: age, specific type
%order in spreadsheet: type, length, draft, SOG, SL, MMSI number, specific type, age


%%%Load data
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_GA_02_SPL_RNL_MSL.mat');
date_fmt = 'mm/dd/yyyy HH:MM:SS';
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/AIS_GA02.mat');

%Pairing SL01 with GA01
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/UniqueBoats/GA01Boats.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/UniqueBoats/SL01Boats.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/UniqueBoats/SL02Boats.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/UniqueBoats/GA02Boats.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/UniqueBoats/Vanessa.mat')
Allboats = unique([GA01Boats;SL02Boats;GA02Boats])
Newboats = setdiff(Allboats, SL01Boats)
Vboats = intersect(Allboats,V2)

%difference between SL02 and GA02
Same02 = intersect(GA02Boats, SL02Boats)

%single boat, multiple transects
uMMSI = unique(AIS_trimmedMMSI); 
rowSet = {};
iSave = 1;
myMMSI = [];
for iR = 1:length(uMMSI)
    mySet = find(AIS_trimmedMMSI == uMMSI(iR));
    if length(mySet)>1
        myMMSI(iSave,1) = uMMSI(iR);
        rowSet{iSave,1} = find(AIS_trimmedMMSI == uMMSI(iR));
        iSave = iSave+1;
    end
end
%histogram(min(AIS_trimmedMMSI):1:max(AIS_trimmedMMSI), Counts);
%AIS numbers 538009133 (4), 538009666 (4), 636019425 (4), 636021440 (4), 477464400 (4), 338188000 (5), 311001006 (5)
%AIS 538009133
OneIdx = find(cell2mat(AIS_GA02(:,6))==538009133);
OneSL = AIS_GA02(OneIdx,5); 
OneSLdouble = cell2mat(OneSL); 
mean(OneSLdouble,'omitnan') % 157.6404
% std(OneSLdouble,'omitnan') %
% figure
% histogram(OneSLdouble,'BinWidth',15,'FaceColor','k')
% xlabel('South-bound Traffic Length (m)')
% ylabel('Frequency')
% saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_length.png')

%Combining all for SOG vs SL
%concatonate
SLAll = cat(1, AIS_GA01(:,5),AIS_GA02(:,5), AIS_metrics(:,5),AIS_SL02(:,5));
SOGAll = cat(1, AIS_GA01(:,4),AIS_GA02(:,4), AIS_metrics(:,4),AIS_SL02(:,4));
SLAll1 = cell2mat(SLAll);
SOGAll1 = cell2mat(SOGAll);
figure
sz=10;
scatter(SOGAll1,SLAll1,sz, "filled")
xlabel("Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 25])
ylim([115 190])
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SL_vs_SOG.png')
hold on
lin_reg = fitlm(SOGAll1,SLAll1);
plot(lin_reg)
xlabel("Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 25])
ylim([115 190])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/LinReg_SL_vs_SOG.png')

%or

SLmeanAll = cat(1,GAmeanBroadbandMSL, SLmeanBroadbandMSL);
SOGAll = cat(1, AIS_GA01(:,4),AIS_GA02(:,4), AIS_metrics(:,4),AIS_SL02(:,4));
SOGAll1 = cell2mat(SOGAll);
figure
sz=10;
scatter(SOGAll1,SLmeanAll,sz, "filled")
xlabel("Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 25])
ylim([115 190])
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SL_vs_SOG.png')
hold on
lin_reg = fitlm(SOGAll1,SLmeanAll);
plot(lin_reg)
xlabel("Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 25])
ylim([115 190])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/MeanLinReg_SL_vs_SOG.png')



%Combining all for Length vs SL
%concatonate
SLAll = cat(1, AIS_GA01(:,5),AIS_GA02(:,5), AIS_metrics(:,5), AIS_SL02(:,5));
LengthAll = cat(1, AIS_GA01(:,2),AIS_GA02(:,2), AIS_metrics(:,2), AIS_SL02(:,2));
SLAll1 = cell2mat(SLAll);
LengthAll1 = cell2mat(LengthAll);
figure
sz=10;
scatter(LengthAll1,SLAll1,sz, "filled")
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 350])
ylim([115 190])
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SL_vs_Length.png')
hold on
lin_reg1 = fitlm(LengthAll1,SLAll1);
plot(lin_reg1)
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 350])
ylim([115 190])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/LinReg_SL_vs_Length.png')

%or

SLmeanAll = cat(1,GAmeanBroadbandMSL, SLmeanBroadbandMSL);
LengthAll = cat(1, AIS_GA01(:,2),AIS_GA02(:,2), AIS_metrics(:,2), AIS_SL02(:,2));
LengthAll1 = cell2mat(LengthAll);
figure
sz=10;
scatter(LengthAll1,SLmeanAll,sz, "filled")
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 350])
ylim([115 190])
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SL_vs_Length.png')
hold on
lin_reg1 = fitlm(LengthAll1,SLmeanAll);
plot(lin_reg1)
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 350])
ylim([115 190])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/MeanLinReg_SL_vs_Length.png')



%Combining all for Draft vs SL
%concatonate
SLAll = cat(1, AIS_GA01(:,5),AIS_GA02(:,5), AIS_metrics(:,5), AIS_SL02(:,5));
DraftAll = cat(1, AIS_GA01(:,3),AIS_GA02(:,3), AIS_metrics(:,3), AIS_SL02(:,3));
SLAll1 = cell2mat(SLAll);
DraftAll1 = cell2mat(DraftAll);
figure
sz=10;
scatter(DraftAll1,SLAll1,sz, "filled")
xlabel("Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 22])
ylim([115 190])
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SL_vs_Draft.png')
hold on
lin_reg2 = fitlm(DraftAll1,SLAll1);
plot(lin_reg2)
xlabel("Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 22])
ylim([115 190])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/LinReg_SL_vs_Draft.png')

%or

SLmeanAll = cat(1,GAmeanBroadbandMSL, SLmeanBroadbandMSL);
DraftAll = cat(1, AIS_GA01(:,3),AIS_GA02(:,3), AIS_metrics(:,3), AIS_SL02(:,3));
DraftAll1 = cell2mat(DraftAll);
figure
sz=10;
scatter(DraftAll1,SLmeanAll,sz, "filled")
xlabel("Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 22])
ylim([115 190])
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SL_vs_Draft.png')
hold on
lin_reg2 = fitlm(DraftAll1,SLmeanAll);
plot(lin_reg2)
xlabel("Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 22])
ylim([115 190])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/MeanLinReg_SL_vs_Draft.png')



%Combining all for Draft vs Length
%concatonate
LengthAll = cat(1, AIS_GA01(:,2),AIS_GA02(:,2), AIS_SL02(:,2), AIS_metrics(:,2));
DraftAll = cat(1, AIS_GA01(:,3),AIS_GA02(:,3), AIS_SL02(:,3), AIS_metrics(:,3));
LengthAll1 = cell2mat(LengthAll);
DraftAll1 = cell2mat(DraftAll);
figure
sz=10;
scatter(LengthAll1,DraftAll1,sz, "filled")
xlabel("Ship Length (m)")
ylabel("Ship Draft (m)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/Length_vs_Draft.png')
hold on
lin_reg3 = fitlm(LengthAll1,DraftAll1);
plot(lin_reg3)
xlabel("Ship Length (m)")
ylabel("Ship Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/LinReg_Length_vs_Draft.png')


%Combining all for SOG vs Length
%concatonate
LengthAll = cat(1, AIS_GA01(:,2),AIS_GA02(:,2), AIS_metrics(:,2),AIS_SL02(:,2));
SOGAll = cat(1, AIS_GA01(:,4),AIS_GA02(:,4), AIS_metrics(:,4),AIS_SL02(:,4));
LengthAll1 = cell2mat(LengthAll);
SOGAll1 = cell2mat(SOGAll);
figure
sz=10;
scatter(LengthAll1,SOGAll1,sz, "filled")
xlabel("Ship Length (m)")
ylabel("Speed Over Ground (knots)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/Length_vs_SOG.png')
hold on
lin_reg4 = fitlm(LengthAll1,SOGAll1);
plot(lin_reg4)
xlabel("Ship Length (m)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/LinReg_Length_vs_SOG.png')

%Combining all for Draft vs Length
%concatonate
SOGAll = cat(1, AIS_GA01(:,4),AIS_GA02(:,4), AIS_metrics(:,4),AIS_SL02(:,4));
DraftAll = cat(1, AIS_GA01(:,3),AIS_GA02(:,3), AIS_metrics(:,3),AIS_SL02(:,3));
SOGAll1 = cell2mat(SOGAll);
DraftAll1 = cell2mat(DraftAll);
figure
sz=10;
scatter(DraftAll1,SOGAll1,sz, "filled")
xlabel("Ship Draft (m)")
ylabel("Speed Over Ground (knots)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/SOG_vs_Draft.png')
hold on
lin_reg3 = fitlm(DraftAll1,SOGAll1);
plot(lin_reg3)
xlabel("Ship Draft (m)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Overall/LinReg_SOG_vs_Draft.png')


%%%Overall
%Length
figure
histogram(AIS_length,'BinWidth',25,'FaceColor','k')
xlabel('Ship Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Overall_Length.png')
mean(AIS_length,'omitnan') %201.0053 m 
std(AIS_length,'omitnan') %59.8156 m 
%Draft
figure
histogram(AIS_draft,'BinWidth',1,'FaceColor','k')
xlabel('Ship Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Overall_Draft.png')
mean(AIS_draft) %10.3373 m
std(AIS_draft) %2.3958 m
%SOG
figure
histogram(AIS_SOG,'BinWidth',1,'FaceColor','k')
xlabel('Ship Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Overall_SOG.png')
mean(AIS_SOG,'omitnan') %13.4942 knots
std(AIS_SOG,'omitnan') %2.5823 knots
%linear regression
GA02lin = fitlm(AIS_length,AIS_draft)


%N/S heading parameters
%south length
southIdx = strcmp(AIS_GA02(:,9),'South');
southlength = AIS_GA02(southIdx,2); 
southlengthdouble = cell2mat(southlength); 
mean(southlengthdouble,'omitnan') % 197.6182 m
std(southlengthdouble,'omitnan') % 64.7335 m
figure
histogram(southlengthdouble,'BinWidth',15,'FaceColor','k')
xlabel('South-bound Traffic Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_length.png')
%north length
northIdx = strcmp(AIS_GA02(:,9),'North');
northlength = AIS_GA02(northIdx,2);
northlengthdouble = cell2mat(northlength);
mean(northlengthdouble,'omitnan') % 203.2290 m
std(northlengthdouble,'omitnan') % 56.0772 m
figure
histogram(northlengthdouble,'BinWidth',15,'FaceColor','k')
xlabel('North-bound Traffic Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_length.png')
%N/S length
histogram(northlengthdouble,'BinWidth',15,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southlengthdouble,'BinWidth',15,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Length (m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_length.png')
%south draft
southIdx = strcmp(AIS_GA02(:,9),'South');
southdraft = AIS_GA02(southIdx,3);
southdraftdouble = cell2mat(southdraft); 
mean(southdraftdouble,'omitnan') % 10.3947 m
std(southdraftdouble,'omitnan') % 2.3559 m
figure
histogram(southdraftdouble,'BinWidth',1,'FaceColor','k')
xlabel('South-bound Traffic Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_draft.png')
%north draft
northIdx = strcmp(AIS_GA02(:,9),'North');
northdraft = AIS_GA02(northIdx,3);
northdraftdouble = cell2mat(northdraft);
mean(northdraftdouble,'omitnan') % 10.2954 m
std(northdraftdouble,'omitnan') % 2.4247 m
figure
histogram(northdraftdouble,'BinWidth',1,'FaceColor','k')
xlabel('North-bound Traffic Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_draft.png')
%N/S draft
histogram(northdraftdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southdraftdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Draft (m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_draft.png')
%south SOG
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSOG = AIS_GA02(southIdx,4); 
southSOGdouble = cell2mat(southSOG); 
mean(southSOGdouble,'omitnan') % 13.6686 knots
std(southSOGdouble,'omitnan') % 2.5820 knots
figure
histogram(southSOGdouble,'BinWidth',1,'FaceColor','k')
xlabel('South-bound Traffic SOG (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_SOG.png')
%north SOG
northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSOG = AIS_GA02(northIdx,4); 
northSOGdouble = cell2mat(northSOG);
mean(northSOGdouble,'omitnan') % 13.3796 knots
std(northSOGdouble,'omitnan') % 2.5775 knots
figure
histogram(northSOGdouble,'BinWidth',1,'FaceColor','k')
xlabel('North-bound Traffic SOG (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_SOG.png')
%N/S SOG
histogram(northSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic SOG (knots)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SOG.png')
%south SL
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSL = AIS_GA02(southIdx,5); 
southSLdouble = cell2mat(southSL); 
mean(southSLdouble,'omitnan') % 163.2256 dB re 1 µPa^2/Hz @ 1m
std(southSLdouble,'omitnan') % 6.0893 dB re 1 µPa^2/Hz @ 1m
figure
histogram(southSLdouble,'BinWidth',1,'FaceColor','k')
xlabel('South-bound Traffic SL (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_SL.png')
%north SL
northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSL = AIS_GA02(northIdx,5); 
northSLdouble = cell2mat(northSL);
mean(northSLdouble,'omitnan') % 163.0492 dB re 1 µPa^2/Hz @ 1m
std(northSLdouble,'omitnan') % 6.4825 dB re 1 µPa^2/Hz @ 1m
figure
histogram(northSLdouble,'BinWidth',1,'FaceColor','k')
xlabel('North-bound Traffic SL (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_SL.png')
%N/S SL
histogram(northSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SL.png')

%%T-test N/S
[h,p,ci,stats] = ttest2(southlengthdouble, northlengthdouble) % h = 0; p = 0.1213; tstat = -1.5506; df = 1127
[h,p,ci,stats] = ttest2(southdraftdouble, northdraftdouble) % h = 0; p = 0.4870; tstat = 0.6952; df = 1162
[h,p,ci,stats] = ttest2(southSOGdouble,northSOGdouble) % h = 0; p = 0.0615; tstat = 1.8718; df = 1156
[h,p,ci,stats] = ttest2(southSLdouble,northSLdouble) % h = 0; p = 0.6402; tstat = 0.4676; df = 1162

%South
%SL vs length
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSLlengths = AIS_GA02(southIdx,2); 
southSLlengthsdouble = cell2mat(southSLlengths); 
ss = southSLdouble;
sl = southSLlengthsdouble;
figure
scatter(sl, ss, "blue", "filled")
xlabel("South-bound Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line4 = fitlm(sl,ss);
figure
plot(lin_reg_line4)
xlabel("South-bound Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_SLvlength.png')
%SL vs Draft
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSLdraft = AIS_GA02(southIdx,3); 
southSLdraftdouble = cell2mat(southSLdraft); 
ss = southSLdouble;
sd = southSLdraftdouble;
figure
scatter(sd, ss, "blue", "filled")
xlabel("South-bound Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line5 = fitlm(sd,ss);
figure
plot(lin_reg_line5)
xlabel("South-bound Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_SLvdraft.png')
%SL vs SOG
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSLSOG = AIS_GA02(southIdx,4); 
southSLSOGdouble = cell2mat(southSLSOG); 
ss = southSLdouble;
sss = southSLSOGdouble;
figure
scatter(sss, ss, "blue", "filled")
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line6 = fitlm(sss,ss);
figure
plot(lin_reg_line6)
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_SLvSOG.png')
%SL vs age
%southIdx = strcmp(AIS_GA02(:,9),'South'); 
%southSLage = AIS_GA02(southIdx,8); 
%southSLagedouble = cell2mat(southSLage); 
%ss = southSLdouble;
%sa = southSLagedouble;
%figure
%scatter(sa, ss, "blue", "filled")
%xlabel("South-bound Ship Age (years)")
%ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%lin_reg_line6 = fitlm(sa,ss);
%figure
%plot(lin_reg_line6)
%xlabel("South-bound Ship Age (years)")
%ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/S_SLvage.png')

%north
%SL vs length
northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSLlength = AIS_GA02(northIdx,2); 
northSLlengthdouble = cell2mat(northSLlength); 
ns = northSLdouble;
nl = northSLlengthdouble;
figure
scatter(nl, ns, "blue", "filled")
xlabel("North-bound Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line7 = fitlm(nl,ns);
figure
plot(lin_reg_line7)
xlabel("North-bound Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_SLvlength.png')
%SL vs draft
northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSLdraft = AIS_GA02(northIdx,3); 
northSLdraftdouble = cell2mat(northSLdraft); 
ns = northSLdouble;
nd = northSLdraftdouble;
figure
scatter(nd, ns, "blue", "filled")
xlabel("North-bound Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line8 = fitlm(nd,ns);
figure
plot(lin_reg_line8)
xlabel("North-bound Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_SLvdraft.png')
%SL vs SOG
northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSLSOG = AIS_GA02(northIdx,4); 
northSLSOGdouble = cell2mat(northSLSOG); 
ns = northSLdouble;
nss = northSLSOGdouble;
figure
scatter(nss, ns, "blue", "filled")
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line9 = fitlm(nss,ns);
figure
plot(lin_reg_line9)
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_SLvSOG.png')
%SL vs age
%northIdx = strcmp(AIS_GA02(:,9),'North'); 
%northSLage = AIS_GA02(tankerIdx,8); 
%northSLageDouble = cell2mat(northSLage); 
%ns = northSLdouble;
%na = northSLageDouble;
%figure
%scatter(na, ns, "blue", "filled")
%xlabel("North-bound Ship Age (years)")
%ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%lin_reg_line6 = fitlm(na,ns);
%figure
%plot(lin_reg_line6)
%xlabel("North-bound Ship Age (years)")
%ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/N_SLvage.png')


%Scatterplots north vs south
%Sl vs Length
figure
sz=25;
scatter(nl, ns, sz, "blue", "filled");
hold on
scatter(sl, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SLvsLength.png')
%SL vs draft
figure
sz=25;
scatter(nd, ns, sz, "blue", "filled");
hold on
scatter(sd, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SLvsDraft.png')
%SL vs SOG
figure
sz=25;
scatter(nss, ns, sz, "blue", "filled");
hold on
scatter(sss, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SLvsSOG.png')
%SOG vs Length
figure
sz=25;
scatter(nl, nss, sz, "blue", "filled");
hold on
scatter(sl, sss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Length (m)")
ylabel("Ship Speed Over Ground (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SOGvsLength.png')
%SOG vs Draft
figure
sz=25;
scatter(nd, nss, sz, "blue", "filled");
hold on
scatter(sd, sss, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Draft (m)")
ylabel("Ship Speed Over Ground (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_SOGvsDraft.png')
%Length vs Draft
figure
sz=25;
scatter(nl, nd, sz, "blue", "filled");
hold on
scatter(sl, sd, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Length (m)")
ylabel("Ship Draft (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/NS_LengthvsDraft.png')


%%%Cargo parameters
%length
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); %<- This will make a vector of 0s and 1s, where 1s indicate rows where the string matches "Cargo"
cargoLengths = AIS_GA02(cargoIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
cargoLengthsDouble = cell2mat(cargoLengths); %cell -> double
mean(cargoLengthsDouble,'omitnan') % 208.8868 m
std(cargoLengthsDouble,'omitnan') % 53.1214 m
figure
histogram(cargoLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Cargo Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Cargo_Length.png')
%draft
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo');
cargoDrafts = AIS_GA02(cargoIdx,3);
cargoDraftsDouble = cell2mat(cargoDrafts);
mean(cargoDraftsDouble) %10.6587 m
std(cargoDraftsDouble) %2.4405 m
figure
histogram(cargoDraftsDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Cargo Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Cargo_Draft.png')
%SOG
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo');
cargoSOG = AIS_GA02(cargoIdx,4); 
cargoSOGDouble = cell2mat(cargoSOG); 
mean(cargoSOGDouble,'omitnan') %14.0363 knots
std(cargoSOGDouble,'omitnan') %2.8637 knots
figure
histogram(cargoSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Cargo Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Cargo_SOG.png')
%SL
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSLLM = AIS_GA02(cargoIdx,5); 
cargoSLLMDouble = cell2mat(cargoSLLM);
mean(cargoSLLMDouble) %163.9820 dB re 1 µPa^2/Hz @ 1m
std(cargoSLLMDouble) %5.9115 dB re 1 µPa^2/Hz @ 1m
figure
histogram(cargoSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Cargo Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Cargo_SL.png')



%age 
%cargoageIdx = strcmp(AIS_GA02(:,1),'Cargo');
%cargoage = AIS_GA02(cargoageIdx,8);
%cargoageDouble = cell2mat(cargoage);
%mean(cargoageDouble,'omitnan') % 12.3835 years
%std(cargoageDouble,'omitnan') % 6.3996 years
%figure
%histogram(cargoageDouble,'BinWidth',3,'FaceColor','k')
%xlabel('Cargo Age')
%ylabel('Frequency')
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Cargo_age.png')





%%%Tanker parameters
%length
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker');
tankerLengths = AIS_GA02(tankerIdx,2);
tankerLengthsDouble = cell2mat(tankerLengths);
mean(tankerLengthsDouble,'omitnan') % 202.3584 m
std(tankerLengthsDouble,'omitnan') %47.4233 m
figure
histogram(tankerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Tanker Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Tanker_Length.png')
%draft
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker');
tankerDraft = AIS_GA02(tankerIdx,3); 
tankerDraftDouble = cell2mat(tankerDraft);
mean(tankerDraftDouble) %10.3494 m
std(tankerDraftDouble) %2.3297 m
figure
histogram(tankerDraftDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Tanker_Draft.png')
%SOG
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker');
tankerSOG = AIS_GA02(tankerIdx,4);
tankerSOGDouble = cell2mat(tankerSOG);
mean(tankerSOGDouble) %13.1270 knots
std(tankerSOGDouble) %2.0769 knots
figure
histogram(tankerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Tanker_SOG.png')
%SL
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSLLM = AIS_GA02(tankerIdx,5); 
tankerSLLMDouble = cell2mat(tankerSLLM);
mean(tankerSLLMDouble) %163.1773 dB re 1 µPa^2/Hz @ 1m
std(tankerSLLMDouble) %6.0931 dB re 1 µPa^2/Hz @ 1m
figure
histogram(tankerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Tanker_SL.png')




%age
%tankerageIdx = strcmp(AIS_GA02(:,1),'Tanker');
%tankerage = AIS_GA02(tankerageIdx,8);
%tankerageDouble = cell2mat(tankerage);
%mean(tankerageDouble,'omitnan') % 12.9704 years
%std(tankerageDouble,'omitnan') % 5.3308 years
%figure
%histogram(tankerageDouble,'BinWidth',1,'FaceColor','k')
%xlabel('Tanker Age')
%ylabel('Frequency')
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/Tanker_age.png')



%%T-test
[h,p,ci,stats] = ttest2(cargoLengthsDouble, tankerLengthsDouble) % h = 1; p = 0.0364; tstat = 2.0952; df = 1056
[h,p,ci,stats] = ttest2(cargoDraftsDouble,tankerDraftDouble) % h = 1; p = 0.0353; tstat = 2.1071; df = 1083
[h,p,ci,stats] = ttest2(cargoSOGDouble,tankerSOGDouble) % h = 1; p = 1.9077e-09; tstat = 6.0573; df = 1082
[h,p,ci,stats] = ttest2(cargoSLLMDouble,tankerSLLMDouble) % h = 1; p = 0.0308; tstat = 2.1624; df = 1083
%%%[h,p,ci,stats] = ttest2(cargoageDouble, tankerageDouble) % h = 0; p = 0.3601; tstat = -0.9163; df = 399


%%%Scatterplots using 11th column of SLLM_thirdoctave - 50 Hz
%Overall 
%SL vs length
s = SLLM_thirdoctave(:,11);
l = AIS_length;
figure
scatter(s, l, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Ship Length (m)")
lin_reg_line = fitlm(s,l);
figure
plot(lin_reg_line)
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/SLvlength.png')
%SL vs draft
s = SLLM_thirdoctave(:,11);
d = AIS_draft;
figure
scatter(s, d, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Ship Draft (m)")
lin_reg_line1 = fitlm(s,d);
figure
plot(lin_reg_line1)
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/SLvdraft.png')
%SL vs SOG
s = SLLM_thirdoctave(:,11);
SOG = AIS_SOG;
figure
scatter(s, SOG, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Ship Speed Over Ground (knots)")
lin_reg_line2 = fitlm(s,SOG);
figure
plot(lin_reg_line2)
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/SLvSOG.png')

%Cargo 
%SL vs length
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSLLMLengths = AIS_GA02(cargoIdx,2); 
cargoSLLMLengthsDouble = cell2mat(cargoSLLMLengths); 
s = cargoSLLMDouble;
cl = cargoSLLMLengthsDouble;
figure
scatter(s, cl, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Cargo Length (m)")
lin_reg_line4 = fitlm(s,cl);
figure
plot(lin_reg_line4)
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/CargoSLvlength.png')
%SL vs Draft
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSLLMDraft = AIS_GA02(cargoIdx,3); 
cargoSLLMDraftDouble = cell2mat(cargoSLLMDraft); 
s = cargoSLLMDouble;
cd = cargoSLLMDraftDouble;
figure
scatter(s, cd, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Cargo Draft (m)")
lin_reg_line5 = fitlm(s,cd);
figure
plot(lin_reg_line5)
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Cargo Draft (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/CargoSLvdraft.png')
%SL vs SOG
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSLLMSOG = AIS_GA02(cargoIdx,4); 
cargoSLLMSOGDouble = cell2mat(cargoSLLMSOG); 
s = cargoSLLMDouble;
cs = cargoSLLMSOGDouble;
figure
scatter(s, cs, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Cargo SOG (knots)")
lin_reg_line6 = fitlm(s,cs);
figure
plot(lin_reg_line6)
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Cargo SOG (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/CargoSLvSOG.png')
%%%%%SL vs age
%cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
%cargoSLLMage = AIS_GA02(cargoIdx,8); 
%cargoSLLMageDouble = cell2mat(cargoSLLMage); 
%s = cargoSLLMDouble;
%cs = cargoSLLMageDouble;
%figure
%scatter(s, cs, "blue", "filled")
%xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%ylabel("Cargo Age (years)")
%lin_reg_line6 = fitlm(s,cs);
%figure
%plot(lin_reg_line6)
%xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%ylabel("Cargo Age (years)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/CargoSLvage.png')

%Tanker
%SL vs length
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSLLMlength = AIS_GA02(tankerIdx,2); 
tankerSLLMlengthDouble = cell2mat(tankerSLLMlength); 
t = tankerSLLMDouble;
tl = tankerSLLMlengthDouble;
figure
scatter(t, tl, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Tanker Length (m)")
lin_reg_line7 = fitlm(t,tl);
figure
plot(lin_reg_line7)
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Tanker Length (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerSLvlength.png')
%SL vs draft
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSLLMdraft = AIS_GA02(tankerIdx,3); 
tankerSLLMdraftDouble = cell2mat(tankerSLLMdraft); 
t = tankerSLLMDouble;
td = tankerSLLMdraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Tanker Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Tanker Draft (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerSLvdraft.png')
%SL vs SOG
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSLLMSOG = AIS_GA02(tankerIdx,4); 
tankerSLLMSOGDouble = cell2mat(tankerSLLMSOG); 
t = tankerSLLMDouble;
ts = tankerSLLMSOGDouble;
figure
scatter(t, ts, "blue", "filled")
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Tanker SOG (knots)")
lin_reg_line9 = fitlm(t,ts);
figure
plot(lin_reg_line9)
xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
ylabel("Tanker SOG (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerSLvSOG.png')
%%%%SL vs age
%tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
%tankerSLLMage = AIS_GA02(tankerIdx,8); 
%tankerSLLMageDouble = cell2mat(tankerSLLMage); 
%s = tankerSLLMDouble;
%ta = tankerSLLMageDouble;
%figure
%scatter(s, ta, "blue", "filled")
%xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%ylabel("Tanker Age (years)")
%lin_reg_line6 = fitlm(s,ta);
%figure
%plot(lin_reg_line6)
%xlabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
%ylabel("Tanker Age (years)")
%saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerSLvage.png')



%Scatterplots tanker vs cargo
%Sl vs Length
figure
sz=25;
scatter(cl, s, sz, "blue", "filled");
hold on
scatter(tl, t, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerCargoSLvsLength.png')
%SL vs draft
figure
sz=25;
scatter(cd, s, sz, "blue", "filled");
hold on
scatter(td, t, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Draft (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerCargoSLvsDraft.png')
%SL vs SOG
figure
sz=25;
scatter(cs, s, sz, "blue", "filled");
hold on
scatter(ts, t, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerCargoSLvsSOG.png')
%SOG vs Length
figure
sz=25;
scatter(cl, cs, sz, "blue", "filled");
hold on
scatter(tl, ts, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Length (m)")
ylabel("Ship Speed Over Ground (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerCargoSOGvsLength.png')
%SOG vs Draft
figure
sz=25;
scatter(cd, cs, sz, "blue", "filled");
hold on
scatter(td, ts, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Draft (m)")
ylabel("Ship Speed Over Ground (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerCargoSOGvsDraft.png')
%Length vs Draft
figure
sz=25;
scatter(cl, cd, sz, "blue", "filled");
hold on
scatter(tl, td, sz, "black", "filled");
legend('Cargo', 'Tanker')
xlabel("Ship Length (m)")
ylabel("Ship Draft (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/TankerCargoDraftvsLength.png')
%linear regression
tGA02lin = fitlm(tl,td)
cGA02lin = fitlm(cl,cd)
%Overall SOG vs date
figure;
sz = 25;
scatter(CPA_time_all,AIS_SOG, sz, "blue", "filled")
datetick('x','mm/yy')
xlabel("Date")
ylabel("Ship Speed Over Ground (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/OverallSOGvsDate.png')
%Overall length vs date
figure;
sz = 25;
scatter(CPA_time_all,AIS_length, sz, "blue", "filled")
datetick('x','mm/yy')
xlabel("Date")
ylabel("Ship Length (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/OverallLengthvsDate.png')
%Overall draft vs date
figure;
sz = 25;
scatter(CPA_time_all,AIS_draft, sz, "blue", "filled")
datetick('x','mm/yy')
xlabel("Date")
ylabel("Ship Draft (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/OverallDraftvsDate.png')
%Overall SL vs date
figure;
sz = 5;
scatter(CPA_time_all,SLLM_thirdoctave, sz, "blue")
datetick('x','mm/yy')
xlabel("Date")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/GA02/OverallSLvsDate.png')








%%%Specific ship type
%LPG tanker
%SL
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerSLLM = AIS_metrics(LPGtankerIdx,5);
LPGtankerSLLMDouble = cell2mat(LPGtankerSLLM);
mean(LPGtankerSLLMDouble,'omitnan') % 167.2648 dB re 1 µPa^2/Hz • 1m
std(LPGtankerSLLMDouble,'omitnan') % 5.7668 dB re 1 µPa^2/Hz • 1m
figure
histogram(LPGtankerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('LPG Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/LPGTanker_SL.png')
%length
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerLengths = AIS_metrics(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
mean(LPGtankerLengthsDouble,'omitnan') % 146.5000 m
std(LPGtankerLengthsDouble,'omitnan') % 36.5327 m
figure
histogram(LPGtankerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('LPG Tanker Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//SL01/LPGTanker_length.png')
%scatter Sl vs length
lpgts = LPGtankerSLLMDouble;
lpgtl = LPGtankerLengthsDouble;
figure
scatter(lpgts, lpgtl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Length (m)")
lin_reg_line8 = fitlm(lpgts,lpgtl);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Length (m)")
%draft
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerDraft = AIS_metrics(LPGtankerIdx,3);
LPGtankerDraftDouble = cell2mat(LPGtankerDraft);
mean(LPGtankerDraftDouble,'omitnan') % 8.9600 m
std(LPGtankerDraftDouble,'omitnan') % 1.8765 m
figure
histogram(LPGtankerDraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('LPG Tanker Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/LPGTanker_draft.png')
%Scatter SL vs draft
lpgts = LPGtankerSLLMDouble;
lpgtd = LPGtankerDraftDouble;
figure
scatter(lpgts, lpgtd, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Draft (m)")
lin_reg_line8 = fitlm(lpgts,lpgtd);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Draft (m)")
%SOG
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerSOG = AIS_metrics(LPGtankerIdx,4);
LPGtankerSOGDouble = cell2mat(LPGtankerSOG);
mean(LPGtankerSOGDouble,'omitnan') % 13.3970 knots
std(LPGtankerSOGDouble,'omitnan') % 1.5541 knots
figure
histogram(LPGtankerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('LPG Tanker Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/LPGTanker_SOG.png')
%Scatter plot SLLM vs SOG
lpgts = LPGtankerSLLMDouble;
lpgtsog = LPGtankerSOGDouble;
figure
scatter(lpgts, lpgtsog, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker SOG (knots)")
lin_reg_line8 = fitlm(lpgts,lpgtsog);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker SOG (knots)")
%age
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerage = AIS_metrics(LPGtankerIdx,8);
LPGtankerageDouble = cell2mat(LPGtankerage);
mean(LPGtankerageDouble,'omitnan') % 11.6667 years
std(LPGtankerageDouble,'omitnan') % 4.6394 years
figure
histogram(LPGtankerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('LPG Tanker Age (years)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/LPGTanker_age.png')
%Scatter SL vs age
lpgts = LPGtankerSLLMDouble;
lpgta = LPGtankerageDouble;
figure
scatter(lpgts, lpgta, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Age (years)")
lin_reg_line8 = fitlm(lpgts,lpgta);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Age (years)")
%Scatter length vs age
lpgtl = LPGtankerLengthsDouble;
lpgta = LPGtankerageDouble;
figure
scatter(lpgtl, td, "blue", "filled")
xlabel("LPG Tanker Length (m)")
ylabel("LPG Tanker Age (years)")
lin_reg_line8 = fitlm(lpgtl,lpgta);
figure
plot(lin_reg_line8)
xlabel("LPG Tanker Length (m)")
ylabel("LPG Tanker Age (years)")


%General Cargo Ship
%SL
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo Ship'); 
generalcargoSLLM = AIS_metrics(generalcargoIdx,5);
generalcargoSLLMDouble = cell2mat(generalcargoSLLM);
mean(generalcargoSLLMDouble,'omitnan') %164.7161 dB re 1 µPa^2/Hz • 1m
std(generalcargoSLLMDouble,'omitnan') %6.3726 dB re 1 µPa^2/Hz • 1m
figure
histogram(generalcargoSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('General Cargo Ship SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/GeneralCargo_SL.png')
%length
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo Ship'); 
generalcargoLengths = AIS_metrics(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 154.1471 m
std(generalcargoLengthsDouble,'omitnan') % 26.9130 m
figure
histogram(generalcargoLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('General Cargo Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/GeneralCargo_length.png')
%Scatter plot SL vs length
gcs = generalcargoSLLMDouble;
gcl = generalcargoLengthsDouble;
figure
scatter(gcs, gcl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Length (m)")
lin_reg_line8 = fitlm(gcs,gcl);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Length (m)")
%draft
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo Ship'); 
generalcargoDraft = AIS_metrics(generalcargoIdx,3);
generalcargoDraftDouble = cell2mat(generalcargoDraft);
mean(generalcargoDraftDouble,'omitnan') % 9.2475 m
std(generalcargoDraftDouble,'omitnan') % 1.5305 m
figure
histogram(generalcargoDraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('General Cargo Ship Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/GeneralCargo_draft.png')
%scatter SL vs draft
gcs = generalcargoSLLMDouble;
gcd = generalcargoDraftDouble;
figure
scatter(gcs, gcd, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Draft (m)")
lin_reg_line8 = fitlm(gcs,gcd);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Draft (m)")
%SOG
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo Ship'); 
generalcargoSOG = AIS_metrics(generalcargoIdx,4);
generalcargoSOGDouble = cell2mat(generalcargoSOG);
mean(generalcargoSOGDouble,'omitnan') % 12.2834 knots
std(generalcargoSOGDouble,'omitnan') % 1.8650 knots
figure
histogram(generalcargoSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('General Cargo Ship Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/GeneralCargo_SOG.png')
%scatter SL vs SOG
gcs = generalcargoSLLMDouble;
gcsog = generalcargoSOGDouble;
figure
scatter(gcs, gcsog, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship SOG (knots)")
lin_reg_line8 = fitlm(gcs,gcsog);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship SOG (knots)")
%age
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo Ship'); 
generalcargoage = AIS_metrics(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 13.8000 years
std(generalcargoageDouble,'omitnan') % 5.0950 years
figure
histogram(generalcargoageDouble,'BinWidth',1,'FaceColor','k')
xlabel('General Cargo Ship Age (years)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/GeneralCargo_age.png')
%scatter SLLM vs age
gcs = generalcargoSLLMDouble;
gca = generalcargoageDouble;
figure
scatter(gcs, gca, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Age (years)")
lin_reg_line8 = fitlm(gcs,gca);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Age (years)")
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
scatter(gcl, gca, "blue", "filled")
xlabel("General Cargo Ship Length (m)")
ylabel("General Cargo Ship Age (years)")
lin_reg_line8 = fitlm(gcl,gca);
figure
plot(lin_reg_line8)
xlabel("General Cargo Ship Length (m)")
ylabel("General Cargo Ship Age (years)")


%Chemical/Oil Products Tanker
%SLLM
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Chemical/Oil Products Tanker'); 
chemoitankerSLLM = AIS_metrics(chemoiltankerIdx,5);
chemoitankerSLLMDouble = cell2mat(chemoitankerSLLM);
mean(chemoitankerSLLMDouble,'omitnan') % 163.4294 dB re 1 µPa^2/Hz • 1m
std(chemoitankerSLLMDouble,'omitnan') % 6.8641 dB re 1 µPa^2/Hz • 1m
figure
histogram(chemoitankerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Chemical/Oil Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ChemicalOilTanker_SL.png')
%length
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Chemical/Oil Products Tanker'); 
chemoitankerLengths = AIS_metrics(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
mean(chemoitankerLengthsDouble,'omitnan') %173.9762 m
std(chemoitankerLengthsDouble,'omitnan') %25.1650 m
figure
histogram(chemoitankerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Chemical/Oil Product Tanker Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ChemicalOilTanker_length.png')
%Scatter plot SLLM vs length
cots = chemoitankerSLLMDouble;
cotl = chemoitankerLengthsDouble;
figure
scatter(cots, cotl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Length (m)")
lin_reg_line8 = fitlm(cots,cotl);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Length (m)")
%draft
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Chemical/Oil Products Tanker'); 
chemoitankerdraft = AIS_metrics(chemoiltankerIdx,3);
chemoitankerdraftDouble = cell2mat(chemoitankerdraft);
mean(chemoitankerdraftDouble,'omitnan') %10.6573 m
std(chemoitankerdraftDouble,'omitnan') %1.6600 m
figure
histogram(chemoitankerdraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Chemical/Oil Tanker Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ChemicalOilTanker_draft.png')
%Scatter plot SL vs draft
cots = chemoitankerSLLMDouble;
cotd = chemoitankerdraftDouble;
figure
scatter(cots, cotd, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Draft (m)")
lin_reg_line8 = fitlm(cots,cotd);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Draft (m)")
%SOG
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Chemical/Oil Products Tanker'); 
chemoitankerSOG = AIS_metrics(chemoiltankerIdx,4);
chemoitankerSOGDouble = cell2mat(chemoitankerSOG);
mean(chemoitankerSOGDouble,'omitnan') % 12.2322 knots
std(chemoitankerSOGDouble,'omitnan') % 1.7487 knots
figure
histogram(chemoitankerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Chemical/Oil Tanker Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ChemicalOilTanker_SOG.png')
%Scatter plot SL vs draft
cots = chemoitankerSLLMDouble;
cotsog = chemoitankerSOGDouble;
figure
scatter(cots, cotsog, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker SOG (knots)")
lin_reg_line8 = fitlm(cots,cotsog);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker SOG (knots)")
%age
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Chemical/Oil Products Tanker'); 
chemoitankerage = AIS_metrics(chemoiltankerIdx,8);
chemoitankerageDouble = cell2mat(chemoitankerage);
mean(chemoitankerageDouble,'omitnan') % 11.2727 years
std(chemoitankerageDouble,'omitnan') % 5.9846 years
figure
histogram(chemoitankerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Chemical/Oil Tanker Age (years)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ChemicalOilTanker_age.png')
%Scatter plot SL vs age
cots = chemoitankerSLLMDouble;
cota = chemoitankerageDouble;
figure
scatter(cots, cota, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Age (years)")
lin_reg_line8 = fitlm(cots,cota);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Age (years)")
%Scatter plot length vs age
cotl = chemoitankerLengthsDouble;
cota = chemoitankerageDouble;
figure
scatter(cotl, cota, "blue", "filled")
xlabel("Chemical/Oil Products Tanker Length (m)")
ylabel("Chemical/Oil Products Tanker Age (years)")
lin_reg_line8 = fitlm(cotl,cota);
figure
plot(lin_reg_line8)
xlabel("Chemical/Oil Products Tanker Length (m)")
ylabel("Chemical/Oil Products Tanker Age (years)")


%Bulk Carrier
%SL
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierSLLM = AIS_metrics(bulkcarrierIdx,5);
bulkcarrierSLLMDouble = cell2mat(bulkcarrierSLLM);
mean(bulkcarrierSLLMDouble,'omitnan') %162.9454 dB re 1 µPa^2/Hz • 1m
std(bulkcarrierSLLMDouble,'omitnan') %5.4669 dB re 1 µPa^2/Hz • 1m
figure
histogram(bulkcarrierSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bulk Carrier SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/BulkCarrier_SL.png')
%length
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierLengths = AIS_metrics(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
mean(bulkcarrierLengthsDouble,'omitnan') % 203.0481 m
std(bulkcarrierLengthsDouble,'omitnan') % 29.1926 m
figure
histogram(bulkcarrierLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Bulk Carrier Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/BulkCarrier_length.png')
%Scatter plot SL vs length
bcs = bulkcarrierSLLMDouble;
bcl = bulkcarrierLengthsDouble;
figure
scatter(bcs, bcl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Length (m)")
lin_reg_line8 = fitlm(bcs,bcl);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Length (m)")
%draft
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierdraft = AIS_metrics(bulkcarrierIdx,3);
bulkcarrierdraftDouble = cell2mat(bulkcarrierdraft);
mean(bulkcarrierdraftDouble,'omitnan') %11.4188 m
std(bulkcarrierdraftDouble,'omitnan') %2.0773 m
figure
histogram(bulkcarrierdraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Bulk Carrier Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/BulkCarrier_draft.png')
%Scatter plot SL vs draft
bcs = bulkcarrierSLLMDouble;
bcd = bulkcarrierdraftDouble;
figure
scatter(bcs, bcd, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Draft (m)")
lin_reg_line8 = fitlm(bcs,bcd);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Draft (m)")
%SOG
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierSOG = AIS_metrics(bulkcarrierIdx,4);
bulkcarrierSOG(cellfun(@ischar,bulkcarrierSOG)) = {nan};
bulkcarrierSOGDouble = cell2mat(bulkcarrierSOG);
mean(bulkcarrierSOGDouble,'omitnan') % 11.5703 knots
std(bulkcarrierSOGDouble,'omitnan') % 1.7580 knots
figure
histogram(bulkcarrierSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bulk Carrier Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/BulkCarrier_SOG.png')
%Scatter plot SL vs SOG
bcs = bulkcarrierSLLMDouble;
bcsog = bulkcarrierSOGDouble;
figure
scatter(bcs, bcsog, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier SOG (knots)")
lin_reg_line8 = fitlm(bcs,bcsog);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier SOG (knots)")
%age
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierage = AIS_metrics(bulkcarrierIdx,8);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
mean(bulkcarrierageDouble,'omitnan') % 10.0602 years
std(bulkcarrierageDouble,'omitnan') % 6.1260 years
figure
histogram(bulkcarrierageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bulk Carrier Age (years)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/BulkCarrier_age.png')
%Scatter plot SL vs age
bcs = bulkcarrierSLLMDouble;
bca = bulkcarrierageDouble;
figure
scatter(bcs, bca, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Age (years)")
lin_reg_line8 = fitlm(bcs,bca);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Age (years)")
%Scatter plot length vs age
bcl = bulkcarrierLengthsDouble;
bca = bulkcarrierageDouble;
figure
scatter(bcl, bca, "blue", "filled")
xlabel("Bulk Carrier Length (m)")
ylabel("Bulk Carrier Age (years)")
lin_reg_line8 = fitlm(bcl,bca);
figure
plot(lin_reg_line8)
xlabel("Bulk Carrier Length (m)")
ylabel("Bulk Carrier Age (years)")


%Container Ship
%SL
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerSLLM = AIS_metrics(containerIdx,5);
containerSLLMDouble = cell2mat(containerSLLM);
mean(containerSLLMDouble,'omitnan') % 164.3739 dB re 1 µPa^2/Hz • 1m
std(containerSLLMDouble,'omitnan') % 7.4010 dB re 1 µPa^2/Hz • 1m
figure
histogram(containerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Container Ship SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ContainerShip_SL.png')
%Length
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerLengths = AIS_metrics(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
mean(containerLengthsDouble,'omitnan') % 245.1364 m
std(containerLengthsDouble,'omitnan') % 79.0589 m
figure
histogram(containerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Container Ship Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ContainerShip_length.png')
%Scatter plot SL vs length
css = containerSLLMDouble;
csl = containerLengthsDouble;
figure
scatter(css, csl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Length (m)")
lin_reg_line8 = fitlm(css,csl);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Length (m)")
%draft
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerdraft = AIS_metrics(containerIdx,3);
containerdraftDouble = cell2mat(containerdraft);
mean(containerdraftDouble,'omitnan') % 12.2600 m
std(containerdraftDouble,'omitnan') % 1.7760 m
figure
histogram(containerdraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Container Ship Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ContainerShip_draft.png')
%Scatter plot SL vs draft
css = containerSLLMDouble;
csd = containerdraftDouble;
figure
scatter(css, csd, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Draft (m)")
lin_reg_line8 = fitlm(css,csd);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Draft (m)")
%SOG
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerSOG = AIS_metrics(containerIdx,4);
containerSOGDouble = cell2mat(containerSOG);
mean(containerSOGDouble,'omitnan') % 14.7846 knots
std(containerSOGDouble,'omitnan') % 4.3408 knots
figure
histogram(containerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Container Ship Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ContainerShip_SOG.png')
%Scatter plot SLLM vs SOG
css = containerSLLMDouble;
cssog = containerSOGDouble;
figure
scatter(css, cssog, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship SOG (knots)")
lin_reg_line8 = fitlm(css,cssog);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship SOG (knots)")
%age
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerage = AIS_metrics(containerIdx,8);
containerageDouble = cell2mat(containerage);
mean(containerageDouble,'omitnan') % 14.3600 years
std(containerageDouble,'omitnan') % 4.9907 years
figure
histogram(containerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Container Ship Age (years)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/ContainerShip_age.png')
%Scatter plot SLLM vs age
css = containerSLLMDouble;
csa = containerageDouble;
figure
scatter(css, csa, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Age (years)")
lin_reg_line8 = fitlm(css,csa);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Age (years)")
%Scatter plot length vs age
csl = containerLengthsDouble;
csa = containerageDouble;
figure
scatter(csl, csa, "blue", "filled")
xlabel("Container Ship Length (m)")
ylabel("Container Ship Age (years)")
lin_reg_line8 = fitlm(csl,csa);
figure
plot(lin_reg_line8)
xlabel("Container Ship Length (m)")
ylabel("Container Ship Age (years)")


%Crude Oil Tanker
%SL
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilSLLM = AIS_metrics(crudeoilIdx,5);
crudeoilSLLMDouble = cell2mat(crudeoilSLLM);
mean(crudeoilSLLMDouble,'omitnan') % 165.1671 dB re 1 µPa^2/Hz • 1m
std(crudeoilSLLMDouble,'omitnan') % 7.3595 dB re 1 µPa^2/Hz • 1m
figure
histogram(crudeoilSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Crude Oil Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/CrudeOilTanker_SL.png')
%Length
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilLengths = AIS_metrics(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths);
mean(crudeoilLengthsDouble,'omitnan') % 233.7083 m
std(crudeoilLengthsDouble,'omitnan') % 19.4366 m
figure
histogram(crudeoilLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Crude Oil Tanker Length (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/CrudeOilTanker_SL.png')
%Scatter plot SLLM vs length
cos = crudeoilSLLMDouble;
col = crudeoilLengthsDouble;
figure
scatter(cos, col, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Length (m)")
lin_reg_line8 = fitlm(cos,col);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Length (m)")
%draft
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoildraft = AIS_metrics(crudeoilIdx,3);
crudeoildraftDouble = cell2mat(crudeoildraft);
mean(crudeoildraftDouble,'omitnan') % 12.8452 m
std(crudeoildraftDouble,'omitnan') % 2.3319 m
figure
histogram(crudeoildraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Crude Oil Tanker Draft (m)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/CrudeOilTanker_draft.png')
%Scatter plot SL vs draft
cos = crudeoilSLLMDouble;
cod = crudeoildraftDouble;
figure
scatter(cos, cod, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Draft (m)")
lin_reg_line8 = fitlm(cos,cod);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Draft (m)")
%SOG
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilSOG = AIS_metrics(crudeoilIdx,4);
crudeoilSOGDouble = cell2mat(crudeoilSOG);
mean(crudeoilSOGDouble,'omitnan') % 11.4864 knots
std(crudeoilSOGDouble,'omitnan') % 1.2275 knots
figure
histogram(crudeoilSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Crude Oil Tanker Speed Over Ground (knots)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/CrudeOilTanker_SOG.png')
%Scatter plot SL vs SOG
cos = crudeoilSLLMDouble;
cosog = crudeoilSOGDouble;
figure
scatter(cos, cosog, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker SOG (knots)")
lin_reg_line8 = fitlm(cos,cosog);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker SOG (knots)")
%age
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilage = AIS_metrics(crudeoilIdx,8);
crudeoilageDouble = cell2mat(crudeoilage);
mean(crudeoilageDouble,'omitnan') % 12.6452 years
std(crudeoilageDouble,'omitnan') % 5.1287 years
figure
histogram(crudeoilageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Crude Oil Ship Age (years)')
ylabel('Frequency')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/SL01/CrudeOilTanker_age.png')
%Scatter plot SL vs age
cos = crudeoilSLLMDouble;
coa = crudeoilageDouble;
figure
scatter(cos, coa, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Age (years)")
lin_reg_line8 = fitlm(cos,coa);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Age (years)")
%Scatter plot length vs age
col = crudeoilLengthsDouble;
coa = crudeoilageDouble;
figure
scatter(col, coa, "blue", "filled")
xlabel("Crude Oil Tanker Length (m)")
ylabel("Crude Oil Tanker Age (years)")
lin_reg_line8 = fitlm(col,coa);
figure
plot(lin_reg_line8)
xlabel("Crude Oil Tanker Length (m)")
ylabel("Crude Oil Tanker Age (years)")