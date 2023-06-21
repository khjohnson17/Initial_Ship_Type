%Ship Noise
%Best of the best
%4/7/23
%KHJ

%% load
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_metrics.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_SL_01_SPL_RNL_MSL');

load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_GA_01_SPL_RNL_MSL');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_GA01.mat');

load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_SL_02_SPL_RNL_MSL.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_SL02.mat');

load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_GA_02_SPL_RNL_MSL.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_GA02.mat');


%% SL01 Overall SL vs Length vs Age
SL=AIS_metrics(:,5);
SLDouble = cell2mat(SL);
Age=AIS_metrics(:,8);
AgeDouble = cell2mat(Age);
Length=AIS_metrics(:,2);
LengthDouble = cell2mat(Length);

%SL vs length
figure
sz=25;
scatter(LengthDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
hold on
lin_reg_line8 = fitlm(LengthDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/SLvsLength.png')

%SL vs age
figure
sz=25;
scatter(AgeDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/SLvsAge.png')

%Length vs SL
figure
sz=25;
scatter(AgeDouble,LengthDouble, sz, "filled")
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,LengthDouble);
plot(lin_reg_line8)
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/AgevsLength.png')

% SL01 Length vs Age of Cargo vs Tanker
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_metrics.mat');

cargoageIdx = strcmp(AIS_metrics(:,1),'Cargo');
cargoage = AIS_metrics(cargoageIdx,8);
cargoageDouble = cell2mat(cargoage);
mean(cargoageDouble,'omitnan') % 2012
std(cargoageDouble,'omitnan') % 5.6874

tankerageIdx = strcmp(AIS_metrics(:,1),'Tanker');
tankerage = AIS_metrics(tankerageIdx,8);
tankerageDouble = cell2mat(tankerage);
mean(tankerageDouble,'omitnan') % 2011
std(tankerageDouble,'omitnan') % 5.4389

figure
histogram(cargoageDouble,'FaceAlpha', 0.2,'FaceColor','k')
hold on
histogram(tankerageDouble,'FaceAlpha', 0.2,'FaceColor','y')
xlabel('Year Built')
ylabel('Frequency')
legend ('Cargo', 'Tanker')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/LengthvsAge.png')
hold off

%SL
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSL = AIS_metrics(cargoIdx,5); 
cargoSLDouble = cell2mat(cargoSL);
%Length
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLengths = AIS_metrics(cargoIdx,2); 
cargoSLLengthsDouble = cell2mat(cargoSLLengths); 
%Age
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLAge = AIS_metrics(cargoIdx,8); 
cargoSLAgeDouble = cell2mat(cargoSLAge); 
%scatter SL vs length
cs = cargoSLDouble;
cl = cargoSLLengthsDouble;
figure
sz=25;
scatter(cl,cs, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
hold on
lin_reg_line4 = fitlm(cl,cs);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/CargoSLvlength.png')
%scatter SL vs age
cs = cargoSLDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cs, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cs);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/CargoSLvage.png')
%scatter age vs length
cl = cargoSLLengthsDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cl, sz,"filled")
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cl);
plot(lin_reg_line6)
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/Cargolengthvage.png')

%tanker
%SL
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSL = AIS_metrics(tankerIdx,5); 
tankerSLDouble = cell2mat(tankerSL);
%Length
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLengths = AIS_metrics(tankerIdx,2); 
tankerSLLengthsDouble = cell2mat(tankerSLLengths); 
%Age
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLAge = AIS_metrics(tankerIdx,8); 
tankerSLAgeDouble = cell2mat(tankerSLAge); 
%scatter SL vs length
ts = tankerSLDouble;
tl = tankerSLLengthsDouble;
figure
sz=25;
scatter(tl,ts, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
hold on
lin_reg_line4 = fitlm(tl,ts);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/TankerSLvlength.png')
%scatter SL vs age
ts = tankerSLDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,ts, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,ts);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/TankerSLvage.png')
%scatter age vs length
tl = tankerSLLengthsDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,tl, sz,"filled")
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,tl);
plot(lin_reg_line6)
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/Tankerlengthvage.png')

%SL01 Specific Ship Type Length, Age, and SL
[~,Flow] = find(F==15);
[~,Fhigh] = find(F==1000);
bandMean = mean(SL_TLLM(:,Flow:Fhigh),2);
%plot(SLLM_thirdoctave(:,11),bandMean,'.')
SL01meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));

%LPG tanker
%MMSI
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerMMSI = AIS_metrics(LPGtankerIdx,6);
LPGtankerMMSIDouble = cell2mat(LPGtankerMMSI);
%SL
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerSL = AIS_metrics(LPGtankerIdx,5);
LPGtankerSLDouble = cell2mat(LPGtankerSL);
mean(LPGtankerSLDouble,'omitnan') %149.3827
std(LPGtankerSLDouble,'omitnan')%3.9017
%length
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerLengths = AIS_metrics(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
mean(LPGtankerLengthsDouble,'omitnan') % 137.6385 m
std(LPGtankerLengthsDouble,'omitnan') % 34.1633 m
%age
LPGtankerIdx = strcmp(AIS_metrics(:,7),'LPG Tanker'); 
LPGtankerage = AIS_metrics(LPGtankerIdx,8);
LPGtankerageDouble = cell2mat(LPGtankerage);
mean(LPGtankerageDouble,'omitnan') % 2012
std(LPGtankerageDouble,'omitnan') % 3.2026
%scatter Sl vs length
lpgts = LPGtankerSLDouble;
lpgtl = LPGtankerLengthsDouble;
fig = figure('DeleteFcn', 'doc datacursormode');
h = plot(lpgtl,lpgts,'o', 'UserData', LPGtankerMMSIDouble)
dcm_obj = datacursormode(gcf);
global myMMSI % don't need this multiple times
set(dcm_obj, 'UpdateFcn',{@myupdatefcn,h})


figure
sz=25;
scatter(lpgtl,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(lpgtl,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//Best/SL01/LPGTanker_SLvlength.png')
%Scatter SL vs age
lpgts = LPGtankerSLDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//Best/SL01/LPGTanker_SLvage.png')
%Scatter length vs age
lpgtl = LPGtankerLengthsDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgtl, sz, "filled")
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgtl);
plot(lin_reg_line8)
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
title([' '])
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//Best/SL01/LPGTanker_agevlength.png')

%General Cargo
%SL
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo'); 
generalcargoSL = AIS_metrics(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %149.0646
std(generalcargoSLDouble,'omitnan') %4.4937
%length
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo'); 
generalcargoLengths = AIS_metrics(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 152.6333 m
std(generalcargoLengthsDouble,'omitnan') % 27.2484 m
%age
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo'); 
generalcargoage = AIS_metrics(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2009
std(generalcargoageDouble,'omitnan') % 4.8684
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('General Cargo Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//Best/SL01/GeneralCargo_SLvlength.png')
%scatter SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//Best/SL01/GeneralCargo_SLvage.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved//Best/SL01/GeneralCargo_lengthvage.png')

%Chemical/Oil Products Tanker
%SL
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Oil/Chemical Tanker'); 
chemoitankerSL = AIS_metrics(chemoiltankerIdx,5);
chemoitankerSLDouble = cell2mat(chemoitankerSL);
mean(chemoitankerSLDouble,'omitnan') % 147.5747 dB re 1 µPa^2/Hz @ 1m
std(chemoitankerSLDouble,'omitnan') % 4.1465 dB re 1 µPa^2/Hz @ 1m
%length
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Oil/Chemical Tanker'); 
chemoitankerLengths = AIS_metrics(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
mean(chemoitankerLengthsDouble,'omitnan') %174.0337 m
std(chemoitankerLengthsDouble,'omitnan') %19.4394 m
%age
chemoiltankerIdx = strcmp(AIS_metrics(:,7),'Oil/Chemical Tanker'); 
chemoitankerage = AIS_metrics(chemoiltankerIdx,8);
chemoitankerageDouble = cell2mat(chemoitankerage);
mean(chemoitankerageDouble,'omitnan') % 2012
std(chemoitankerageDouble,'omitnan') % 5.8865
%Scatter plot SL vs length
cots = chemoitankerSLDouble;
cotl = chemoitankerLengthsDouble;
figure
sz=25;
scatter(cotl, cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(cotl,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/ChemOilTanker_SLvslength.png')
%Scatter plot SL vs age
cots = chemoitankerSLDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
hold on
lin_reg_line8 = fitlm(cota,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/ChemOilTanker_SLvsage.png')
%Scatter plot length vs age
cotl = chemoitankerLengthsDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cotl, sz, "filled")
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(cota,cotl);
plot(lin_reg_line8)
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/ChemOilTanker_agevslength.png')

%Bulk Carrier
%SL
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierSL = AIS_metrics(bulkcarrierIdx,5);
bulkcarrierSLDouble = cell2mat(bulkcarrierSL);
mean(bulkcarrierSLDouble,'omitnan')% 149.9213
std(bulkcarrierSLDouble,'omitnan') %3.7603
%length
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierLengths = AIS_metrics(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
mean(bulkcarrierLengthsDouble,'omitnan') % 207.0214 m
std(bulkcarrierLengthsDouble,'omitnan') % 21.9176 m
%age
bulkcarrierIdx = strcmp(AIS_metrics(:,7),'Bulk Carrier'); 
bulkcarrierage = AIS_metrics(bulkcarrierIdx,8);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
mean(bulkcarrierageDouble,'omitnan') % 2013 years
std(bulkcarrierageDouble,'omitnan') % 5.4698 years
%Scatter plot SL vs length
bcs = bulkcarrierSLDouble;
bcl = bulkcarrierLengthsDouble;
figure
sz=25;
scatter(bcl, bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
hold on
lin_reg_line8 = fitlm(bcl,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/BulkCarrier_SLvslength.png')
%Scatter plot SL vs age
bcs = bulkcarrierSLDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/BulkCarrier_SLvsage.png')
%Scatter plot length vs age
bcl = bulkcarrierLengthsDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcl, sz, "filled")
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcl);
plot(lin_reg_line8)
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/BulkCarrier_lengthvsage.png')

%Container Ship
%SL
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerSL = AIS_metrics(containerIdx,5);
containerSLDouble = cell2mat(containerSL);
mean(containerSLDouble,'omitnan') % 147.5743 dB re 1 µPa^2/Hz @ 1m
std(containerSLDouble,'omitnan') % 5.1170 dB re 1 µPa^2/Hz @ 1m
%Length
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerLengths = AIS_metrics(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
mean(containerLengthsDouble,'omitnan') % 262.2571 m
std(containerLengthsDouble,'omitnan') % 56.4063 m
%age
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerage = AIS_metrics(containerIdx,8);
containerageDouble = cell2mat(containerage);
mean(containerageDouble,'omitnan') % 2007 years
std(containerageDouble,'omitnan') % 4.5235 years
%Scatter plot SL vs length
css = containerSLDouble;
csl = containerLengthsDouble;
figure
sz=25;
scatter(csl, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
hold on
lin_reg_line8 = fitlm(csl,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/ContainerShip_SLvslength.png')
%Scatter plot SL vs age
containerIdx = strcmp(AIS_metrics(:,7),'Container Ship'); 
containerage = AIS_metrics(containerIdx,8);
containerageDouble = cell2mat(containerage);
css = containerSLDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/ContainerShip_SLvsage.png')
%Scatter plot length vs age
csl = containerLengthsDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa,csl, sz, "filled")
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa, csl);
plot(lin_reg_line8)
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/ContainerShip_lengthvsage.png')

%Crude Oil Tanker
%SL
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilSL = AIS_metrics(crudeoilIdx,5);
crudeoilSLDouble = cell2mat(crudeoilSL);
mean(crudeoilSLDouble,'omitnan') %147.3614
std(crudeoilSLDouble,'omitnan') %5.0540
%Length
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilLengths = AIS_metrics(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths);
mean(crudeoilLengthsDouble,'omitnan') % 231.8593 m
std(crudeoilLengthsDouble,'omitnan') % 22.8802 m
%age
crudeoilIdx = strcmp(AIS_metrics(:,7),'Crude Oil Tanker'); 
crudeoilage = AIS_metrics(crudeoilIdx,8);
crudeoilageDouble = cell2mat(crudeoilage);
mean(crudeoilageDouble,'omitnan') % 2010 years
std(crudeoilageDouble,'omitnan') % 4.7035 years
%Scatter plot SL vs length
cos = crudeoilSLDouble;
col = crudeoilLengthsDouble;
figure
sz=25;
scatter(col,cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(col,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/CrudeOil_lengthvsSL.png')
%Scatter plot SL vs age
cos = crudeoilSLDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa, cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/CrudeOil_agevsSL.png')
%Scatter plot length vs age
col = crudeoilLengthsDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa,col, sz, "filled")
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,col);
plot(lin_reg_line8)
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/CrudeOil_agevslength.png')

%General Cargo Ship
%SL
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo'); 
generalcargoSL = AIS_metrics(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %149.0646
std(generalcargoSLDouble,'omitnan') %4.4937
%Length
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo'); 
generalcargoLengths = AIS_metrics(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 152.6333 m
std(generalcargoLengthsDouble,'omitnan') % 27.2484 m
%age
generalcargoIdx = strcmp(AIS_metrics(:,7),'General Cargo'); 
generalcargoage = AIS_metrics(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2009 years
std(generalcargoageDouble,'omitnan') % 4.8684 years
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/GeneralCargo_lengthvsSL.png')
%Scatter plot SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/GeneralCargo_agevsSL.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/GeneralCargo_agevslength.png')

%Asphalt/Bitumen Tanker
%SL
bitumenIdx = strcmp(AIS_metrics(:,7),'Asphalt/Bitumen Tanker'); 
bitumenSL = AIS_metrics(bitumenIdx,5);
bitumenSLDouble = cell2mat(bitumenSL);
mean(bitumenSLDouble,'omitnan') %144.4096
std(bitumenSLDouble,'omitnan') %5.5528
%Length
bitumenIdx = strcmp(AIS_metrics(:,7),'Asphalt/Bitumen Tanker'); 
bitumenLengths = AIS_metrics(bitumenIdx,2);
bitumenLengthsDouble = cell2mat(bitumenLengths);
mean(bitumenLengthsDouble,'omitnan') % 114.45 m
std(bitumenLengthsDouble,'omitnan') % 4.9843 m
%age
bitumenIdx = strcmp(AIS_metrics(:,7),'Asphalt/Bitumen Tanker'); 
bitumenage = AIS_metrics(bitumenIdx,8);
bitumenageDouble = cell2mat(bitumenage);
mean(bitumenageDouble,'omitnan') % 2014 years
std(bitumenageDouble,'omitnan') % 3.6697 years
%Scatter plot SL vs length
bs = bitumenSLDouble;
bl = bitumenLengthsDouble;
figure
sz=25;
scatter(bl,bs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(bl,bs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/Bitumen_lengthvsSL.png')
%Scatter plot SL vs age
bs = bitumenSLDouble;
ba = bitumenageDouble;
figure
sz=25;
scatter(ba, bs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(ba,bs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/Bitumen_agevsSL.png')
%Scatter plot length vs age
bl = bitumenLengthsDouble;
ba = bitumenageDouble;
figure
sz=25;
scatter(ba,bl, sz, "filled")
ylabel("Bitumen Tanker Length (m)")
xlabel("Bitumen Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(ba,bl);
plot(lin_reg_line8)
ylabel("Bitumen Tanker Length (m)")
xlabel("Bitumen Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01/Bitumen_agevslength.png')

%% SL02 Overall SL vs Length vs Age
SL=AIS_SL02(:,5);
SLDouble = cell2mat(SL);
Age=AIS_SL02(:,8);
AgeDouble = cell2mat(Age);
Length=AIS_SL02(:,2);
LengthDouble = cell2mat(Length);

%SL vs length
figure
sz=25;
scatter(LengthDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
hold on
lin_reg_line8 = fitlm(LengthDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/SLvsLength.png')

%SL vs age
figure
sz=25;
scatter(AgeDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/SLvsAge.png')

%Length vs SL
figure
sz=25;
scatter(AgeDouble,LengthDouble, sz, "filled")
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,LengthDouble);
plot(lin_reg_line8)
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/AgevsLength.png')


% SL02 Length vs Age of Cargo vs Tanker
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_SL02.mat');

cargoageIdx = strcmp(AIS_SL02(:,1),'Cargo');
cargoage = AIS_SL02(cargoageIdx,8);
cargoageDouble = cell2mat(cargoage);
mean(cargoageDouble,'omitnan') % 2013
std(cargoageDouble,'omitnan') % 5.0644

tankerageIdx = strcmp(AIS_SL02(:,1),'Tanker');
tankerage = AIS_SL02(tankerageIdx,8);
tankerageDouble = cell2mat(tankerage);
mean(tankerageDouble,'omitnan') % 2013
std(tankerageDouble,'omitnan') % 5.9174

figure
histogram(cargoageDouble,'FaceAlpha', 0.2,'FaceColor','k')
hold on
histogram(tankerageDouble,'FaceAlpha', 0.2,'FaceColor','y')
xlabel('Year Built')
ylabel('Frequency')
legend ('Cargo', 'Tanker')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/LengthvsAge.png')
hold off

%cargo
%SL
cargoIdx = strcmp(AIS_SL02(:,1),'Cargo'); 
cargoSL = AIS_SL02(cargoIdx,5); 
cargoSLDouble = cell2mat(cargoSL);
%Length
cargoIdx = strcmp(AIS_SL02(:,1),'Cargo'); 
cargoSLLengths = AIS_SL02(cargoIdx,2); 
cargoSLLengthsDouble = cell2mat(cargoSLLengths); 
%Age
cargoIdx = strcmp(AIS_SL02(:,1),'Cargo'); 
cargoSLAge = AIS_SL02(cargoIdx,8); 
cargoSLAgeDouble = cell2mat(cargoSLAge); 
%scatter SL vs length
cs = cargoSLDouble;
cl = cargoSLLengthsDouble;
figure
sz=25;
scatter(cl,cs, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
hold on
lin_reg_line4 = fitlm(cl,cs);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/CargoSLvlength.png')
%scatter SL vs age
cs = cargoSLDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cs, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cs);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/CargoSLvage.png')
%scatter age vs length
cl = cargoSLLengthsDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cl, sz,"filled")
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cl);
plot(lin_reg_line6)
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/Cargolengthvage.png')

%tanker
%SL
tankerIdx = strcmp(AIS_SL02(:,1),'Tanker'); 
tankerSL = AIS_SL02(tankerIdx,5); 
tankerSLDouble = cell2mat(tankerSL);
%Length
tankerIdx = strcmp(AIS_SL02(:,1),'Tanker'); 
tankerSLLengths = AIS_SL02(tankerIdx,2); 
tankerSLLengthsDouble = cell2mat(tankerSLLengths); 
%Age
tankerIdx = strcmp(AIS_SL02(:,1),'Tanker'); 
tankerSLAge = AIS_SL02(tankerIdx,8); 
tankerSLAgeDouble = cell2mat(tankerSLAge); 
%scatter SL vs length
ts = tankerSLDouble;
tl = tankerSLLengthsDouble;
figure
sz=25;
scatter(tl,ts, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
hold on
lin_reg_line4 = fitlm(tl,ts);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/TankerSLvlength.png')
%scatter SL vs age
ts = tankerSLDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,ts, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,ts);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/TankerSLvage.png')
%scatter age vs length
tl = tankerSLLengthsDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,tl, sz,"filled")
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,tl);
plot(lin_reg_line6)
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/Tankerlengthvage.png')


%Specific Ship Type Length, Age, and SL
[~,Flow] = find(F==15);
[~,Fhigh] = find(F==1000);
bandMean = mean(SL_TLLM(:,Flow:Fhigh),2);
%plot(SLLM_thirdoctave(:,11),bandMean,'.')
SL02meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));

%LPG tanker
%MMSI
LPGtankerIdx = strcmp(AIS_SL02(:,7),'LPG Tanker'); 
LPGtankerMMSI = AIS_SL02(LPGtankerIdx,6);
LPGtankerMMSIDouble = cell2mat(LPGtankerMMSI);
%SL
LPGtankerIdx = strcmp(AIS_SL02(:,7),'LPG Tanker'); 
LPGtankerSL = AIS_SL02(LPGtankerIdx,5);
LPGtankerSLDouble = cell2mat(LPGtankerSL);
mean(LPGtankerSLDouble,'omitnan') %146.1000
std(LPGtankerSLDouble,'omitnan')%4.5056
%length
LPGtankerIdx = strcmp(AIS_SL02(:,7),'LPG Tanker'); 
LPGtankerLengths = AIS_SL02(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
mean(LPGtankerLengthsDouble,'omitnan') % 133.9611 m
std(LPGtankerLengthsDouble,'omitnan') % 32.6982 m
%age
LPGtankerIdx = strcmp(AIS_SL02(:,7),'LPG Tanker'); 
LPGtankerage = AIS_SL02(LPGtankerIdx,8);
LPGtankerageDouble = cell2mat(LPGtankerage);
mean(LPGtankerageDouble,'omitnan') % 2012
std(LPGtankerageDouble,'omitnan') % 4.1144
%scatter Sl vs length
lpgts = LPGtankerSLDouble;
lpgtl = LPGtankerLengthsDouble;
fig = figure('DeleteFcn', 'doc datacursormode');
h = plot(lpgtl,lpgts,'o', 'UserData', LPGtankerMMSIDouble)
dcm_obj = datacursormode(gcf);
global myMMSI % don't need this multiple times
set(dcm_obj, 'UpdateFcn',{@myupdatefcn,h})

figure
sz=25;
scatter(lpgtl,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(lpgtl,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/LPGTanker_SLvlength.png')
%Scatter SL vs age
lpgts = LPGtankerSLDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/LPGTanker_SLvage.png')
%Scatter length vs age
lpgtl = LPGtankerLengthsDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgtl, sz, "filled")
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgtl);
plot(lin_reg_line8)
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
title([' '])
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/LPGTanker_agevlength.png')

%General Cargo
%SL
generalcargoIdx = strcmp(AIS_SL02(:,7),'General Cargo'); 
generalcargoSL = AIS_SL02(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %148.1971
std(generalcargoSLDouble,'omitnan') %3.7603
%length
generalcargoIdx = strcmp(AIS_SL02(:,7),'General Cargo'); 
generalcargoLengths = AIS_SL02(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 164.5512 m
std(generalcargoLengthsDouble,'omitnan') % 29.0018 m
%age
generalcargoIdx = strcmp(AIS_SL02(:,7),'General Cargo'); 
generalcargoage = AIS_SL02(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2008
std(generalcargoageDouble,'omitnan') % 5.535
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('General Cargo Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/GeneralCargo_SLvlength.png')
%scatter SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/GeneralCargo_SLvage.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/GeneralCargo_lengthvage.png')

%Chemical/Oil Products Tanker
%SL
chemoiltankerIdx = strcmp(AIS_SL02(:,7),'Oil/Chemical Tanker'); 
chemoitankerSL = AIS_SL02(chemoiltankerIdx,5);
chemoitankerSLDouble = cell2mat(chemoitankerSL);
mean(chemoitankerSLDouble,'omitnan') % 146.0347 dB re 1 µPa^2/Hz @ 1m
std(chemoitankerSLDouble,'omitnan') % 4.1484 dB re 1 µPa^2/Hz @ 1m
%length
chemoiltankerIdx = strcmp(AIS_SL02(:,7),'Oil/Chemical Tanker'); 
chemoitankerLengths = AIS_SL02(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
mean(chemoitankerLengthsDouble,'omitnan') %174.8051 m
std(chemoitankerLengthsDouble,'omitnan') %18.2794 m
%age
chemoiltankerIdx = strcmp(AIS_SL02(:,7),'Oil/Chemical Tanker'); 
chemoitankerage = AIS_SL02(chemoiltankerIdx,8);
chemoitankerageDouble = cell2mat(chemoitankerage);
mean(chemoitankerageDouble,'omitnan') % 2013
std(chemoitankerageDouble,'omitnan') % 6.0911
%Scatter plot SL vs length
cots = chemoitankerSLDouble;
cotl = chemoitankerLengthsDouble;
figure
sz=25;
scatter(cotl, cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(cotl,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/ChemOilTanker_SLvslength.png')
%Scatter plot SL vs age
cots = chemoitankerSLDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
hold on
lin_reg_line8 = fitlm(cota,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/ChemOilTanker_SLvsage.png')
%Scatter plot length vs age
cotl = chemoitankerLengthsDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cotl, sz, "filled")
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(cota,cotl);
plot(lin_reg_line8)
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/ChemOilTanker_agevslength.png')

%Bulk Carrier
%SL
bulkcarrierIdx = strcmp(AIS_SL02(:,7),'Bulk Carrier'); 
bulkcarrierSL = AIS_SL02(bulkcarrierIdx,5);
bulkcarrierSLDouble = cell2mat(bulkcarrierSL);
mean(bulkcarrierSLDouble,'omitnan')% 146.8440
std(bulkcarrierSLDouble,'omitnan') %4.1149
%length
bulkcarrierIdx = strcmp(AIS_SL02(:,7),'Bulk Carrier'); 
bulkcarrierLengths = AIS_SL02(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
mean(bulkcarrierLengthsDouble,'omitnan') % 201.1716 m
std(bulkcarrierLengthsDouble,'omitnan') % 21.3113 m
%age
bulkcarrierIdx = strcmp(AIS_SL02(:,7),'Bulk Carrier'); 
bulkcarrierage = AIS_SL02(bulkcarrierIdx,8);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
mean(bulkcarrierageDouble,'omitnan') % 2014 years
std(bulkcarrierageDouble,'omitnan') % 4.6408 years
%Scatter plot SL vs length
bcs = bulkcarrierSLDouble;
bcl = bulkcarrierLengthsDouble;
figure
sz=25;
scatter(bcl, bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
hold on
lin_reg_line8 = fitlm(bcl,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/BulkCarrier_SLvslength.png')
%Scatter plot SL vs age
bcs = bulkcarrierSLDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/Sl02/BulkCarrier_SLvsage.png')
%Scatter plot length vs age
bcl = bulkcarrierLengthsDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcl, sz, "filled")
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcl);
plot(lin_reg_line8)
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/BulkCarrier_lengthvsage.png')

%Container Ship
%SL
containerIdx = strcmp(AIS_SL02(:,7),'Container Ship'); 
containerSL = AIS_SL02(containerIdx,5);
containerSLDouble = cell2mat(containerSL);
mean(containerSLDouble,'omitnan') % 149.1469 dB re 1 µPa^2/Hz @ 1m
std(containerSLDouble,'omitnan') % 4.8382 dB re 1 µPa^2/Hz @ 1m
%Length
containerIdx = strcmp(AIS_SL02(:,7),'Container Ship'); 
containerLengths = AIS_SL02(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
mean(containerLengthsDouble,'omitnan') % 267.42801 m
std(containerLengthsDouble,'omitnan') % 42.2718 m
%age
containerIdx = strcmp(AIS_SL02(:,7),'Container Ship'); 
containerage = AIS_SL02(containerIdx,8);
containerageDouble = cell2mat(containerage);
mean(containerageDouble,'omitnan') % 2008 years
std(containerageDouble,'omitnan') % 3.1533 years
%Scatter plot SL vs length
css = containerSLDouble;
csl = containerLengthsDouble;
figure
sz=25;
scatter(csl, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
hold on
lin_reg_line8 = fitlm(csl,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/ContainerShip_SLvslength.png')
%Scatter plot SL vs age
css = containerSLDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/ContainerShip_SLvsage.png')
%Scatter plot length vs age
csl = containerLengthsDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa,csl, sz, "filled")
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa, csl);
plot(lin_reg_line8)
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/ContainerShip_lengthvsage.png')

%Crude Oil Tanker
%SL
crudeoilIdx = strcmp(AIS_SL02(:,7),'Crude Oil Tanker'); 
crudeoilSL = AIS_SL02(crudeoilIdx,5);
crudeoilSLDouble = cell2mat(crudeoilSL);
mean(crudeoilSLDouble,'omitnan') %146.2687
std(crudeoilSLDouble,'omitnan') %4.5148
%Length
crudeoilIdx = strcmp(AIS_SL02(:,7),'Crude Oil Tanker'); 
crudeoilLengths = AIS_SL02(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths);
mean(crudeoilLengthsDouble,'omitnan') % 242.3080 m
std(crudeoilLengthsDouble,'omitnan') % 15.5189 m
%age
crudeoilIdx = strcmp(AIS_SL02(:,7),'Crude Oil Tanker'); 
crudeoilage = AIS_SL02(crudeoilIdx,8);
crudeoilageDouble = cell2mat(crudeoilage);
mean(crudeoilageDouble,'omitnan') % 2011
std(crudeoilageDouble,'omitnan') % 5.6149 years
%Scatter plot SL vs length
cos = crudeoilSLDouble;
col = crudeoilLengthsDouble;
figure
sz=25;
scatter(col,cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(col,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/CrudeOil_lengthvsSL.png')
%Scatter plot SL vs age
cos = crudeoilSLDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa, cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/CrudeOil_agevsSL.png')
%Scatter plot length vs age
col = crudeoilLengthsDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa,col, sz, "filled")
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,col);
plot(lin_reg_line8)
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/CrudeOil_agevslength.png')

%General Cargo Ship
%SL
generalcargoIdx = strcmp(AIS_SL02(:,7),'General Cargo'); 
generalcargoSL = AIS_SL02(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %148.1971
std(generalcargoSLDouble,'omitnan') %3.7603
%Length
generalcargoIdx = strcmp(AIS_SL02(:,7),'General Cargo'); 
generalcargoLengths = AIS_SL02(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 164.5512 m
std(generalcargoLengthsDouble,'omitnan') % 29.0018 m
%age
generalcargoIdx = strcmp(AIS_SL02(:,7),'General Cargo'); 
generalcargoage = AIS_SL02(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2008 
std(generalcargoageDouble,'omitnan') % 5.5350 years
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/GeneralCargo_lengthvsSL.png')
%Scatter plot SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/GeneralCargo_agevsSL.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/GeneralCargo_agevslength.png')

%Asphalt/Bitumen Tanker
%SL
bitumenIdx = strcmp(AIS_SL02(:,7),'Asphalt/Bitumen Tanker'); 
bitumenSL = AIS_SL02(bitumenIdx,5);
bitumenSLDouble = cell2mat(bitumenSL);
mean(bitumenSLDouble,'omitnan') %144.7948
std(bitumenSLDouble,'omitnan') %2.6918
%Length
bitumenIdx = strcmp(AIS_SL02(:,7),'Asphalt/Bitumen Tanker'); 
bitumenLengths = AIS_SL02(bitumenIdx,2);
bitumenLengthsDouble = cell2mat(bitumenLengths);
mean(bitumenLengthsDouble,'omitnan') % 132.4750 m
std(bitumenLengthsDouble,'omitnan') % 21.9734 m
%age
bitumenIdx = strcmp(AIS_SL02(:,7),'Asphalt/Bitumen Tanker'); 
bitumenage = AIS_SL02(bitumenIdx,8);
bitumenageDouble = cell2mat(bitumenage);
mean(bitumenageDouble,'omitnan') % 2017 years
std(bitumenageDouble,'omitnan') % 1.5059 years
%Scatter plot SL vs length
bs = bitumenSLDouble;
bl = bitumenLengthsDouble;
figure
sz=25;
scatter(bl,bs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(bl,bs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/Bitumen_lengthvsSL.png')
%Scatter plot SL vs age
bs = bitumenSLDouble;
ba = bitumenageDouble;
figure
sz=25;
scatter(ba, bs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(ba,bs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bitumen Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/Bitumen_agevsSL.png')
%Scatter plot length vs age
bl = bitumenLengthsDouble;
ba = bitumenageDouble;
figure
sz=25;
scatter(ba,bl, sz, "filled")
ylabel("Bitumen Tanker Length (m)")
xlabel("Bitumen Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(ba,bl);
plot(lin_reg_line8)
ylabel("Bitumen Tanker Length (m)")
xlabel("Bitumen Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02/Bitumen_agevslength.png')

%% GA01 Overall SL vs Length vs Age
SL=AIS_GA01(:,5);
SLDouble = cell2mat(SL);
Age=AIS_GA01(:,8);
AgeDouble = cell2mat(Age);
Length=AIS_GA01(:,2);
LengthDouble = cell2mat(Length);

%SL vs length
figure
sz=25;
scatter(LengthDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
hold on
lin_reg_line8 = fitlm(LengthDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/SLvsLength.png')

%SL vs age
figure
sz=25;
scatter(AgeDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/SLvsAge.png')

%Length vs SL
figure
sz=25;
scatter(AgeDouble,LengthDouble, sz, "filled")
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,LengthDouble);
plot(lin_reg_line8)
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/AgevsLength.png')


% GA01 Length vs Age of Cargo vs Tanker
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_GA01.mat');

cargoageIdx = strcmp(AIS_GA01(:,1),'Cargo');
cargoage = AIS_GA01(cargoageIdx,8);
cargoageDouble = cell2mat(cargoage);
mean(cargoageDouble,'omitnan') % 2010
std(cargoageDouble,'omitnan') % 5.9016

tankerageIdx = strcmp(AIS_GA01(:,1),'Tanker');
tankerage = AIS_GA01(tankerageIdx,8);
tankerageDouble = cell2mat(tankerage);
mean(tankerageDouble,'omitnan') % 2012
std(tankerageDouble,'omitnan') % 5.6363

figure
histogram(cargoageDouble,'FaceAlpha', 0.2,'FaceColor','k')
hold on
histogram(tankerageDouble,'FaceAlpha', 0.2,'FaceColor','y')
xlabel('Year Built')
ylabel('Frequency')
legend ('Cargo', 'Tanker')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/LengthvsAge.png')
hold off

%cargo
%SL
cargoIdx = strcmp(AIS_GA01(:,1),'Cargo'); 
cargoSL = AIS_GA01(cargoIdx,5); 
cargoSLDouble = cell2mat(cargoSL);
%Length
cargoIdx = strcmp(AIS_GA01(:,1),'Cargo'); 
cargoSLLengths = AIS_GA01(cargoIdx,2); 
cargoSLLengthsDouble = cell2mat(cargoSLLengths); 
%Age
cargoIdx = strcmp(AIS_GA01(:,1),'Cargo'); 
cargoSLAge = AIS_GA01(cargoIdx,8); 
cargoSLAgeDouble = cell2mat(cargoSLAge); 
%scatter SL vs length
cs = cargoSLDouble;
cl = cargoSLLengthsDouble;
figure
sz=25;
scatter(cl,cs, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
hold on
lin_reg_line4 = fitlm(cl,cs);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/CargoSLvlength.png')
%scatter SL vs age
cs = cargoSLDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cs, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cs);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/CargoSLvage.png')
%scatter age vs length
cl = cargoSLLengthsDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cl, sz,"filled")
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cl);
plot(lin_reg_line6)
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/Cargolengthvage.png')

%tanker
%SL
tankerIdx = strcmp(AIS_GA01(:,1),'Tanker'); 
tankerSL = AIS_GA01(tankerIdx,5); 
tankerSLDouble = cell2mat(tankerSL);
%Length
tankerIdx = strcmp(AIS_GA01(:,1),'Tanker'); 
tankerSLLengths = AIS_GA01(tankerIdx,2); 
tankerSLLengthsDouble = cell2mat(tankerSLLengths); 
%Age
tankerIdx = strcmp(AIS_GA01(:,1),'Tanker'); 
tankerSLAge = AIS_GA01(tankerIdx,8); 
tankerSLAgeDouble = cell2mat(tankerSLAge); 
%scatter SL vs length
ts = tankerSLDouble;
tl = tankerSLLengthsDouble;
figure
sz=25;
scatter(tl,ts, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
hold on
lin_reg_line4 = fitlm(tl,ts);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/TankerSLvlength.png')
%scatter SL vs age
ts = tankerSLDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,ts, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,ts);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/TankerSLvage.png')
%scatter age vs length
tl = tankerSLLengthsDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,tl, sz,"filled")
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,tl);
plot(lin_reg_line6)
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/Tankerlengthvage.png')


%Specific Ship Type Length, Age, and SL
[~,Flow] = find(F==15);
[~,Fhigh] = find(F==1000);
bandMean = mean(SL_TLLM(:,Flow:Fhigh),2);
%plot(SLLM_thirdoctave(:,11),bandMean,'.')
GA01meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));

%LPG tanker
%MMSI
LPGtankerIdx = strcmp(AIS_GA01(:,7),'LPG Tanker'); 
LPGtankerMMSI = AIS_GA01(LPGtankerIdx,6);
LPGtankerMMSIDouble = cell2mat(LPGtankerMMSI);
%SL
LPGtankerIdx = strcmp(AIS_GA01(:,7),'LPG Tanker'); 
LPGtankerSL = AIS_GA01(LPGtankerIdx,5);
LPGtankerSLDouble = cell2mat(LPGtankerSL);
mean(LPGtankerSLDouble,'omitnan') %146.8461
std(LPGtankerSLDouble,'omitnan')%4.7554
%length
LPGtankerIdx = strcmp(AIS_GA01(:,7),'LPG Tanker'); 
LPGtankerLengths = AIS_GA01(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
mean(LPGtankerLengthsDouble,'omitnan') % 205.1098 m
std(LPGtankerLengthsDouble,'omitnan') % 37.5818 m
%age
LPGtankerIdx = strcmp(AIS_GA01(:,7),'LPG Tanker'); 
LPGtankerage = AIS_GA01(LPGtankerIdx,8);
LPGtankerageDouble = cell2mat(LPGtankerage);
mean(LPGtankerageDouble,'omitnan') % 2013
std(LPGtankerageDouble,'omitnan') % 4.9584
%scatter Sl vs length
lpgts = LPGtankerSLDouble;
lpgtl = LPGtankerLengthsDouble;
fig = figure('DeleteFcn', 'doc datacursormode');
h = plot(lpgtl,lpgts,'o', 'UserData', LPGtankerMMSIDouble)
dcm_obj = datacursormode(gcf);
global myMMSI % don't need this multiple times
set(dcm_obj, 'UpdateFcn',{@myupdatefcn,h})

figure
sz=25;
scatter(lpgtl,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(lpgtl,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/LPGTanker_SLvlength.png')
%Scatter SL vs age
lpgts = LPGtankerSLDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/LPGTanker_SLvage.png')
%Scatter length vs age
lpgtl = LPGtankerLengthsDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgtl, sz, "filled")
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgtl);
plot(lin_reg_line8)
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
title([' '])
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/LPGTanker_agevlength.png')

%General Cargo
%SL
generalcargoIdx = strcmp(AIS_GA01(:,7),'General Cargo'); 
generalcargoSL = AIS_GA01(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %147.6047
std(generalcargoSLDouble,'omitnan') %4.5375
%length
generalcargoIdx = strcmp(AIS_GA01(:,7),'General Cargo'); 
generalcargoLengths = AIS_GA01(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 160.0769 m
std(generalcargoLengthsDouble,'omitnan') % 30.8341 m
%age
generalcargoIdx = strcmp(AIS_GA01(:,7),'General Cargo'); 
generalcargoage = AIS_GA01(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2008
std(generalcargoageDouble,'omitnan') % 5.6638
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('General Cargo Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/GeneralCargo_SLvlength.png')
%scatter SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/GeneralCargo_SLvage.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/GeneralCargo_lengthvage.png')

%Chemical/Oil Products Tanker
%SL
chemoiltankerIdx = strcmp(AIS_GA01(:,7),'Oil/Chemical Tanker'); 
chemoitankerSL = AIS_GA01(chemoiltankerIdx,5);
chemoitankerSLDouble = cell2mat(chemoitankerSL);
mean(chemoitankerSLDouble,'omitnan') % 145.8367 dB re 1 µPa^2/Hz @ 1m
std(chemoitankerSLDouble,'omitnan') % 5.0481 dB re 1 µPa^2/Hz @ 1m
%length
chemoiltankerIdx = strcmp(AIS_GA01(:,7),'Oil/Chemical Tanker'); 
chemoitankerLengths = AIS_GA01(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
mean(chemoitankerLengthsDouble,'omitnan') %176.5895 m
std(chemoitankerLengthsDouble,'omitnan') %14.9119 m
%age
chemoiltankerIdx = strcmp(AIS_GA01(:,7),'Oil/Chemical Tanker'); 
chemoitankerage = AIS_GA01(chemoiltankerIdx,8);
chemoitankerageDouble = cell2mat(chemoitankerage);
mean(chemoitankerageDouble,'omitnan') % 2013
std(chemoitankerageDouble,'omitnan') % 5.0508
%Scatter plot SL vs length
cots = chemoitankerSLDouble;
cotl = chemoitankerLengthsDouble;
figure
sz=25;
scatter(cotl, cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(cotl,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/ChemOilTanker_SLvslength.png')
%Scatter plot SL vs age
cots = chemoitankerSLDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
hold on
lin_reg_line8 = fitlm(cota,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/ChemOilTanker_SLvsage.png')
%Scatter plot length vs age
cotl = chemoitankerLengthsDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cotl, sz, "filled")
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(cota,cotl);
plot(lin_reg_line8)
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/ChemOilTanker_agevslength.png')

%Bulk Carrier
%SL
bulkcarrierIdx = strcmp(AIS_GA01(:,7),'Bulk Carrier'); 
bulkcarrierSL = AIS_GA01(bulkcarrierIdx,5);
bulkcarrierSLDouble = cell2mat(bulkcarrierSL);
mean(bulkcarrierSLDouble,'omitnan')% 145.6954
std(bulkcarrierSLDouble,'omitnan') %4.3318
%length
bulkcarrierIdx = strcmp(AIS_GA01(:,7),'Bulk Carrier'); 
bulkcarrierLengths = AIS_GA01(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
mean(bulkcarrierLengthsDouble,'omitnan') % 192.1219 m
std(bulkcarrierLengthsDouble,'omitnan') % 13.6977 m
%age
bulkcarrierIdx = strcmp(AIS_GA01(:,7),'Bulk Carrier'); 
bulkcarrierage = AIS_GA01(bulkcarrierIdx,8);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
mean(bulkcarrierageDouble,'omitnan') % 2012 years
std(bulkcarrierageDouble,'omitnan') % 5.3967 years
%Scatter plot SL vs length
bcs = bulkcarrierSLDouble;
bcl = bulkcarrierLengthsDouble;
figure
sz=25;
scatter(bcl, bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
hold on
lin_reg_line8 = fitlm(bcl,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/BulkCarrier_SLvslength.png')
%Scatter plot SL vs age
bcs = bulkcarrierSLDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/BulkCarrier_SLvsage.png')
%Scatter plot length vs age
bcl = bulkcarrierLengthsDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcl, sz, "filled")
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcl);
plot(lin_reg_line8)
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/BulkCarrier_lengthvsage.png')

%Container Ship
%SL
containerIdx = strcmp(AIS_GA01(:,7),'Container Ship'); 
containerSL = AIS_GA01(containerIdx,5);
containerSLDouble = cell2mat(containerSL);
mean(containerSLDouble,'omitnan') % 146.5094 dB re 1 µPa^2/Hz @ 1m
std(containerSLDouble,'omitnan') % 5.6206 dB re 1 µPa^2/Hz @ 1m
%Length
containerIdx = strcmp(AIS_GA01(:,7),'Container Ship'); 
containerLengths = AIS_GA01(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
mean(containerLengthsDouble,'omitnan') % 279.112 m
std(containerLengthsDouble,'omitnan') % 46.7792 m
%age
containerIdx = strcmp(AIS_GA01(:,7),'Container Ship'); 
containerage = AIS_GA01(containerIdx,8);
containerageDouble = cell2mat(containerage);
mean(containerageDouble,'omitnan') % 2008 years
std(containerageDouble,'omitnan') % 4.5457 years
%Scatter plot SL vs length
css = containerSLDouble;
csl = containerLengthsDouble;
figure
sz=25;
scatter(csl, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
hold on
lin_reg_line8 = fitlm(csl,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/ContainerShip_SLvslength.png')
%Scatter plot SL vs age
css = containerSLDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/ContainerShip_SLvsage.png')
%Scatter plot length vs age
csl = containerLengthsDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa,csl, sz, "filled")
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa, csl);
plot(lin_reg_line8)
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/ContainerShip_lengthvsage.png')

%Crude Oil Tanker
%SL
crudeoilIdx = strcmp(AIS_GA01(:,7),'Crude Oil Tanker'); 
crudeoilSL = AIS_GA01(crudeoilIdx,5);
crudeoilSLDouble = cell2mat(crudeoilSL);
mean(crudeoilSLDouble,'omitnan') %145.3363
std(crudeoilSLDouble,'omitnan') %4.1290
%Length
crudeoilIdx = strcmp(AIS_GA01(:,7),'Crude Oil Tanker'); 
crudeoilLengths = AIS_GA01(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths);
mean(crudeoilLengthsDouble,'omitnan') % 243.2569 m
std(crudeoilLengthsDouble,'omitnan') % 18.0164 m
%age
crudeoilIdx = strcmp(AIS_GA01(:,7),'Crude Oil Tanker'); 
crudeoilage = AIS_GA01(crudeoilIdx,8);
crudeoilageDouble = cell2mat(crudeoilage);
mean(crudeoilageDouble,'omitnan') % 2011
std(crudeoilageDouble,'omitnan') % 5.0925 years
%Scatter plot SL vs length
cos = crudeoilSLDouble;
col = crudeoilLengthsDouble;
figure
sz=25;
scatter(col,cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(col,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/CrudeOil_lengthvsSL.png')
%Scatter plot SL vs age
cos = crudeoilSLDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa, cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/CrudeOil_agevsSL.png')
%Scatter plot length vs age
col = crudeoilLengthsDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa,col, sz, "filled")
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,col);
plot(lin_reg_line8)
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/CrudeOil_agevslength.png')

%General Cargo Ship
%SL
generalcargoIdx = strcmp(AIS_GA01(:,7),'General Cargo'); 
generalcargoSL = AIS_GA01(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %147.6047
std(generalcargoSLDouble,'omitnan') %4.5375
%Length
generalcargoIdx = strcmp(AIS_GA01(:,7),'General Cargo'); 
generalcargoLengths = AIS_GA01(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 160.0769 m
std(generalcargoLengthsDouble,'omitnan') % 30.8341 m
%age
generalcargoIdx = strcmp(AIS_GA01(:,7),'General Cargo'); 
generalcargoage = AIS_GA01(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2008 
std(generalcargoageDouble,'omitnan') % 5.6638 years
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/GeneralCargo_lengthvsSL.png')
%Scatter plot SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/GeneralCargo_agevsSL.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01/GeneralCargo_agevslength.png')

%% GA02 Overall SL vs Length vs Age
SL=AIS_GA02(:,5);
SLDouble = cell2mat(SL);
Age=AIS_GA02(:,8);
AgeDouble = cell2mat(Age);
Length=AIS_GA02(:,2);
LengthDouble = cell2mat(Length);

%SL vs length
figure
sz=25;
scatter(LengthDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
hold on
lin_reg_line8 = fitlm(LengthDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/SLvsLength.png')

%SL vs age
figure
sz=25;
scatter(AgeDouble,SLDouble, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,SLDouble);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/SLvsAge.png')

%Length vs SL
figure
sz=25;
scatter(AgeDouble,LengthDouble, sz, "filled")
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeDouble,LengthDouble);
plot(lin_reg_line8)
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/AgevsLength.png')


% GA02 Length vs Age of Cargo vs Tanker
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_GA02.mat');

cargoageIdx = strcmp(AIS_GA02(:,1),'Cargo');
cargoage = AIS_GA02(cargoageIdx,8);
cargoageDouble = cell2mat(cargoage);
mean(cargoageDouble,'omitnan') % 2011
std(cargoageDouble,'omitnan') % 5.8119

tankerageIdx = strcmp(AIS_GA02(:,1),'Tanker');
tankerage = AIS_GA02(tankerageIdx,8);
tankerageDouble = cell2mat(tankerage);
mean(tankerageDouble,'omitnan') % 2013
std(tankerageDouble,'omitnan') % 5.8947

figure
histogram(cargoageDouble,'FaceAlpha', 0.2,'FaceColor','k')
hold on
histogram(tankerageDouble,'FaceAlpha', 0.2,'FaceColor','y')
xlabel('Year Built')
ylabel('Frequency')
legend ('Cargo', 'Tanker')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/LengthvsAge.png')
hold off

%cargo
%SL
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSL = AIS_GA02(cargoIdx,5); 
cargoSLDouble = cell2mat(cargoSL);
%Length
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSLLengths = AIS_GA02(cargoIdx,2); 
cargoSLLengthsDouble = cell2mat(cargoSLLengths); 
%Age
cargoIdx = strcmp(AIS_GA02(:,1),'Cargo'); 
cargoSLAge = AIS_GA02(cargoIdx,8); 
cargoSLAgeDouble = cell2mat(cargoSLAge); 
%scatter SL vs length
cs = cargoSLDouble;
cl = cargoSLLengthsDouble;
figure
sz=25;
scatter(cl,cs, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
hold on
lin_reg_line4 = fitlm(cl,cs);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/CargoSLvlength.png')
%scatter SL vs age
cs = cargoSLDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cs, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cs);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/CargoSLvage.png')
%scatter age vs length
cl = cargoSLLengthsDouble;
ca = cargoSLAgeDouble;
figure
sz=25;
scatter(ca,cl, sz,"filled")
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cl);
plot(lin_reg_line6)
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/Cargolengthvage.png')

%tanker
%SL
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSL = AIS_GA02(tankerIdx,5); 
tankerSLDouble = cell2mat(tankerSL);
%Length
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSLLengths = AIS_GA02(tankerIdx,2); 
tankerSLLengthsDouble = cell2mat(tankerSLLengths); 
%Age
tankerIdx = strcmp(AIS_GA02(:,1),'Tanker'); 
tankerSLAge = AIS_GA02(tankerIdx,8); 
tankerSLAgeDouble = cell2mat(tankerSLAge); 
%scatter SL vs length
ts = tankerSLDouble;
tl = tankerSLLengthsDouble;
figure
sz=25;
scatter(tl,ts, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
hold on
lin_reg_line4 = fitlm(tl,ts);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/TankerSLvlength.png')
%scatter SL vs age
ts = tankerSLDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,ts, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,ts);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/TankerSLvage.png')
%scatter age vs length
tl = tankerSLLengthsDouble;
ta = tankerSLAgeDouble;
figure
sz=25;
scatter(ta,tl, sz,"filled")
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,tl);
plot(lin_reg_line6)
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/Tankerlengthvage.png')


%Specific Ship Type Length, Age, and SL
[~,Flow] = find(F==15);
[~,Fhigh] = find(F==1000);
bandMean = mean(SL_TLLM(:,Flow:Fhigh),2);
%plot(SLLM_thirdoctave(:,11),bandMean,'.')
GA02meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));

%LPG tanker
%MMSI
LPGtankerIdx = strcmp(AIS_GA02(:,7),'LPG Tanker'); 
LPGtankerMMSI = AIS_GA02(LPGtankerIdx,6);
LPGtankerMMSIDouble = cell2mat(LPGtankerMMSI);
%SL
LPGtankerIdx = strcmp(AIS_GA02(:,7),'LPG Tanker'); 
LPGtankerSL = AIS_GA02(LPGtankerIdx,5);
LPGtankerSLDouble = cell2mat(LPGtankerSL);
mean(LPGtankerSLDouble,'omitnan') %146.8954
std(LPGtankerSLDouble,'omitnan')%3.3258
%length
LPGtankerIdx = strcmp(AIS_GA02(:,7),'LPG Tanker'); 
LPGtankerLengths = AIS_GA02(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
mean(LPGtankerLengthsDouble,'omitnan') % 195.9615 m
std(LPGtankerLengthsDouble,'omitnan') % 42.1612 m
%age
LPGtankerIdx = strcmp(AIS_GA02(:,7),'LPG Tanker'); 
LPGtankerage = AIS_GA02(LPGtankerIdx,8);
LPGtankerageDouble = cell2mat(LPGtankerage);
mean(LPGtankerageDouble,'omitnan') % 2014
std(LPGtankerageDouble,'omitnan') % 5.2494
%scatter Sl vs length
lpgts = LPGtankerSLDouble;
lpgtl = LPGtankerLengthsDouble;
fig = figure('DeleteFcn', 'doc datacursormode');
h = plot(lpgtl,lpgts,'o', 'UserData', LPGtankerMMSIDouble)
dcm_obj = datacursormode(gcf);
global myMMSI % don't need this multiple times
set(dcm_obj, 'UpdateFcn',{@myupdatefcn,h})

figure
sz=25;
scatter(lpgtl,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(lpgtl,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/LPGTanker_SLvlength.png')
%Scatter SL vs age
lpgts = LPGtankerSLDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/LPGTanker_SLvage.png')
%Scatter length vs age
lpgtl = LPGtankerLengthsDouble;
lpgta = LPGtankerageDouble;
figure
sz=25;
scatter(lpgta,lpgtl, sz, "filled")
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgtl);
plot(lin_reg_line8)
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
title([' '])
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/LPGTanker_agevlength.png')

%General Cargo
%SL
generalcargoIdx = strcmp(AIS_GA02(:,7),'General Cargo'); 
generalcargoSL = AIS_GA02(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %148.3610
std(generalcargoSLDouble,'omitnan') %3.0952
%length
generalcargoIdx = strcmp(AIS_GA02(:,7),'General Cargo'); 
generalcargoLengths = AIS_GA02(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 162.6539 m
std(generalcargoLengthsDouble,'omitnan') % 29.8045 m
%age
generalcargoIdx = strcmp(AIS_GA02(:,7),'General Cargo'); 
generalcargoage = AIS_GA02(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2009
std(generalcargoageDouble,'omitnan') % 5.7323
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('General Cargo Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/GeneralCargo_SLvlength.png')
%scatter SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/GeneralCargo_SLvage.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/GeneralCargo_lengthvage.png')

%Chemical/Oil Products Tanker
%SL
chemoiltankerIdx = strcmp(AIS_GA02(:,7),'Oil/Chemical Tanker'); 
chemoitankerSL = AIS_GA02(chemoiltankerIdx,5);
chemoitankerSLDouble = cell2mat(chemoitankerSL);
mean(chemoitankerSLDouble,'omitnan') % 145.3509 dB re 1 µPa^2/Hz @ 1m
std(chemoitankerSLDouble,'omitnan') % 3.5021 dB re 1 µPa^2/Hz @ 1m
%length
chemoiltankerIdx = strcmp(AIS_GA02(:,7),'Oil/Chemical Tanker'); 
chemoitankerLengths = AIS_GA02(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
mean(chemoitankerLengthsDouble,'omitnan') %176.6625 m
std(chemoitankerLengthsDouble,'omitnan') %16.9623 m
%age
chemoiltankerIdx = strcmp(AIS_GA02(:,7),'Oil/Chemical Tanker'); 
chemoitankerage = AIS_GA02(chemoiltankerIdx,8);
chemoitankerageDouble = cell2mat(chemoitankerage);
mean(chemoitankerageDouble,'omitnan') % 2013
std(chemoitankerageDouble,'omitnan') % 5.4183
%Scatter plot SL vs length
cots = chemoitankerSLDouble;
cotl = chemoitankerLengthsDouble;
figure
sz=25;
scatter(cotl, cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(cotl,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/ChemOilTanker_SLvslength.png')
%Scatter plot SL vs age
cots = chemoitankerSLDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
hold on
lin_reg_line8 = fitlm(cota,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/ChemOilTanker_SLvsage.png')
%Scatter plot length vs age
cotl = chemoitankerLengthsDouble;
cota = chemoitankerageDouble;
figure
sz=25;
scatter(cota,cotl, sz, "filled")
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(cota,cotl);
plot(lin_reg_line8)
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/ChemOilTanker_agevslength.png')

%Bulk Carrier
%SL
bulkcarrierIdx = strcmp(AIS_GA02(:,7),'Bulk Carrier'); 
bulkcarrierSL = AIS_GA02(bulkcarrierIdx,5);
bulkcarrierSLDouble = cell2mat(bulkcarrierSL);
mean(bulkcarrierSLDouble,'omitnan')% 145.8859
std(bulkcarrierSLDouble,'omitnan') %3.6572
%length
bulkcarrierIdx = strcmp(AIS_GA02(:,7),'Bulk Carrier'); 
bulkcarrierLengths = AIS_GA02(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
mean(bulkcarrierLengthsDouble,'omitnan') % 188.4924 m
std(bulkcarrierLengthsDouble,'omitnan') % 12.9361 m
%age
bulkcarrierIdx = strcmp(AIS_GA02(:,7),'Bulk Carrier'); 
bulkcarrierage = AIS_GA02(bulkcarrierIdx,8);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
mean(bulkcarrierageDouble,'omitnan') % 2013 years
std(bulkcarrierageDouble,'omitnan') % 5.0566 years
%Scatter plot SL vs length
bcs = bulkcarrierSLDouble;
bcl = bulkcarrierLengthsDouble;
figure
sz=25;
scatter(bcl, bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
hold on
lin_reg_line8 = fitlm(bcl,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/BulkCarrier_SLvslength.png')
%Scatter plot SL vs age
bcs = bulkcarrierSLDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/BulkCarrier_SLvsage.png')
%Scatter plot length vs age
bcl = bulkcarrierLengthsDouble;
bca = bulkcarrierageDouble;
figure
sz=25;
scatter(bca,bcl, sz, "filled")
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcl);
plot(lin_reg_line8)
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/BulkCarrier_lengthvsage.png')

%Container Ship
%SL
containerIdx = strcmp(AIS_GA02(:,7),'Container Ship'); 
containerSL = AIS_GA02(containerIdx,5);
containerSLDouble = cell2mat(containerSL);
mean(containerSLDouble,'omitnan') % 149.1852 dB re 1 µPa^2/Hz @ 1m
std(containerSLDouble,'omitnan') % 4.1830 dB re 1 µPa^2/Hz @ 1m
%Length
containerIdx = strcmp(AIS_GA02(:,7),'Container Ship'); 
containerLengths = AIS_GA02(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
mean(containerLengthsDouble,'omitnan') % 272.6813 m
std(containerLengthsDouble,'omitnan') % 50.789 m
%age
containerIdx = strcmp(AIS_GA02(:,7),'Container Ship'); 
containerage = AIS_GA02(containerIdx,8);
containerageDouble = cell2mat(containerage);
mean(containerageDouble,'omitnan') % 2007 years
std(containerageDouble,'omitnan') % 4.4037 years
%Scatter plot SL vs length
css = containerSLDouble;
csl = containerLengthsDouble;
figure
sz=25;
scatter(csl, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
hold on
lin_reg_line8 = fitlm(csl,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/ContainerShip_SLvslength.png')
%Scatter plot SL vs age
css = containerSLDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/ContainerShip_SLvsage.png')
%Scatter plot length vs age
csl = containerLengthsDouble;
csa = containerageDouble;
figure
sz=25;
scatter(csa,csl, sz, "filled")
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa, csl);
plot(lin_reg_line8)
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/ContainerShip_lengthvsage.png')

%Crude Oil Tanker
%SL
crudeoilIdx = strcmp(AIS_GA02(:,7),'Crude Oil Tanker'); 
crudeoilSL = AIS_GA02(crudeoilIdx,5);
crudeoilSLDouble = cell2mat(crudeoilSL);
mean(crudeoilSLDouble,'omitnan') %146.5718
std(crudeoilSLDouble,'omitnan') %3.4762
%Length
crudeoilIdx = strcmp(AIS_GA02(:,7),'Crude Oil Tanker'); 
crudeoilLengths = AIS_GA02(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths);
mean(crudeoilLengthsDouble,'omitnan') % 2439.1328 m
std(crudeoilLengthsDouble,'omitnan') % 29.8767 m
%age
crudeoilIdx = strcmp(AIS_GA02(:,7),'Crude Oil Tanker'); 
crudeoilage = AIS_GA02(crudeoilIdx,8);
crudeoilageDouble = cell2mat(crudeoilage);
mean(crudeoilageDouble,'omitnan') % 2010
std(crudeoilageDouble,'omitnan') % 5.5946 years
%Scatter plot SL vs length
cos = crudeoilSLDouble;
col = crudeoilLengthsDouble;
figure
sz=25;
scatter(col,cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(col,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/CrudeOil_lengthvsSL.png')
%Scatter plot SL vs age
cos = crudeoilSLDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa, cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/CrudeOil_agevsSL.png')
%Scatter plot length vs age
col = crudeoilLengthsDouble;
coa = crudeoilageDouble;
figure
sz=25;
scatter(coa,col, sz, "filled")
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,col);
plot(lin_reg_line8)
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/CrudeOil_agevslength.png')

%General Cargo Ship
%SL
generalcargoIdx = strcmp(AIS_GA02(:,7),'General Cargo'); 
generalcargoSL = AIS_GA02(generalcargoIdx,5);
generalcargoSLDouble = cell2mat(generalcargoSL);
mean(generalcargoSLDouble,'omitnan') %148.3610
std(generalcargoSLDouble,'omitnan') %3.0952
%Length
generalcargoIdx = strcmp(AIS_GA02(:,7),'General Cargo'); 
generalcargoLengths = AIS_GA02(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
mean(generalcargoLengthsDouble,'omitnan') % 162.6539 m
std(generalcargoLengthsDouble,'omitnan') % 29.8045 m
%age
generalcargoIdx = strcmp(AIS_GA02(:,7),'General Cargo'); 
generalcargoage = AIS_GA02(generalcargoIdx,8);
generalcargoageDouble = cell2mat(generalcargoage);
mean(generalcargoageDouble,'omitnan') % 2009
std(generalcargoageDouble,'omitnan') % 5.7323 years
%Scatter plot SL vs length
gcs = generalcargoSLDouble;
gcl = generalcargoLengthsDouble;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/GeneralCargo_lengthvsSL.png')
%Scatter plot SL vs age
gcs = generalcargoSLDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/GeneralCargo_agevsSL.png')
%Scatter plot length vs age
gcl = generalcargoLengthsDouble;
gca = generalcargoageDouble;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Length (m)")
xlabel("General Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02/GeneralCargo_agevslength.png')


%% Combining ALL to look at SL Age and Length
SLAllBoats = cat(1, AIS_metrics(:,5),AIS_SL02(:,5), AIS_GA01(:,5),AIS_GA02(:,5));
SOGAllBoat = cat(1, AIS_metrics(:,4),AIS_SL02(:,4), AIS_GA01(:,4),AIS_GA02(:,4));
TypeAllBoat = cat(1, AIS_metrics(:,1),AIS_SL02(:,1), AIS_GA01(:,1),AIS_GA02(:,1));
DetailedAllBoat = cat(1, AIS_metrics(:,7),AIS_SL02(:,7), AIS_GA01(:,7),AIS_GA02(:,7));
LengthAllBoats = cat(1, AIS_metrics(:,2),AIS_SL02(:,2), AIS_GA01(:,2),AIS_GA02(:,2));
AgeAllBoats = cat(1, AIS_metrics(:,8),AIS_SL02(:,8), AIS_GA01(:,8),AIS_GA02(:,8));
WidthAllBoats = cat(1, AIS_metrics(:,14),AIS_SL02(:,14), AIS_GA01(:,14),AIS_GA02(:,14));
GTAllBoats = cat(1, AIS_metrics(:,15),AIS_SL02(:,15), AIS_GA01(:,15),AIS_GA02(:,15));
DWAllBoats = cat(1, AIS_metrics(:,16),AIS_SL02(:,16), AIS_GA01(:,16),AIS_GA02(:,16));
TEUAllBoats = cat(1, AIS_metrics(:,17),AIS_SL02(:,17), AIS_GA01(:,17),AIS_GA02(:,17));
SLAll1 = cell2mat(SLAllBoats);
SOGAll1 = cell2mat(SOGAllBoat);
LengthAll1 = cell2mat(LengthAllBoats);
AgeAll1 = cell2mat(AgeAllBoats);
WidthAll1 = cell2mat(WidthAllBoats);
GTAll1 = cell2mat(GTAllBoats);
DWAll1 = cell2mat(DWAllBoats);
TEUAll1 = cell2mat(TEUAllBoats);

%SL vs length
figure
sz=25;
scatter(LengthAll1,SLAll1, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
hold on
lin_reg_line8 = fitlm(LengthAll1,SLAll1);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SLvsLength.png')

%SL vs age
figure
sz=25;
scatter(AgeAll1,SLAll1, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeAll1,SLAll1);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SLvsAge.png')

%Length vs age
figure
sz=25;
scatter(AgeAll1,LengthAll1, sz, "filled")
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
hold on
lin_reg_line8 = fitlm(AgeAll1,LengthAll1);
plot(lin_reg_line8)
ylabel('Ship Length (m)')
xlabel("Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/AgevsLength.png')

% Width vs Length
figure
sz=25;
scatter(LengthAll1,WidthAll1, sz, "filled")
ylabel('Ship Width (m)')
xlabel("Ship Length (m)")
hold on
lin_reg_line8 = fitlm(LengthAll1,WidthAll1);
plot(lin_reg_line8)
ylabel('Ship Width (m)')
xlabel("Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LengthvsWidth.png')

%Width vs Age
figure
sz=25;
scatter(AgeAll1,WidthAll1, sz, "filled")
ylabel('Ship Width (m)')
xlabel("Ship Year Built")
hold on
lin_reg_line8 = fitlm(AgeAll1,WidthAll1);
plot(lin_reg_line8)
ylabel('Ship Width (m)')
xlabel("Ship Year Built")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/AgevsWidth.png')

%Width vs SL
figure
sz=25;
scatter(WidthAll1,SLAll1, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Width (m)")
hold on
lin_reg_line8 = fitlm(WidthAll1,SLAll1);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Width (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SLvsWidth.png')

%DW vs SL
figure
sz=25;
scatter(DWAll1,SLAll1, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Deadweight (t)")
hold on
lin_reg_line8 = fitlm(DWAll1,SLAll1);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Deadweight (t)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SLvsDW.png')

%DW vs Age
figure
sz=25;
scatter(AgeAll1,DWAll1, sz, "filled")
xlabel('Age')
ylabel("Deadweight (t)")
hold on
lin_reg_line8 = fitlm(AgeAll1,DWAll1);
plot(lin_reg_line8)
xlabel('Age')
ylabel("Deadweight (t)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/AgevsDW.png')

%DW vs Length
figure
sz=25;
scatter(LengthAll1,DWAll1, sz, "filled")
xlabel('Ship Length (m)')
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LengthevsDW.png')

%DW vs Width
figure
sz=25;
scatter(WidthAll1,DWAll1, sz, "filled")
xlabel('Ship Width (m)')
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/WidthvsDW.png')

%GT vs SL
figure
sz=25;
scatter(GTAll1,SLAll1, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Gross Tonnage (t)")
hold on
lin_reg_line8 = fitlm(GTAll1,SLAll1);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Gross Tonnage (t)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SLvsGT.png')

%GT vs Age
figure
sz=25;
scatter(AgeAll1,GTAll1, sz, "filled")
xlabel('Age')
ylabel("Gross Tonnage (t)")
hold on
lin_reg_line8 = fitlm(AgeAll1,GTAll1);
plot(lin_reg_line8)
xlabel('Age')
ylabel("Gross Tonnage (t)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/AgevsGT.png')

%GT vs Length
figure
sz=25;
scatter(LengthAll1,GTAll1, sz, "filled")
xlabel('Ship Length (m)')
ylabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LengthvsGT.png')

%GT vs Width
figure
sz=25;
scatter(WidthAll1,GTAll1, sz, "filled")
xlabel('Ship Width (m)')
ylabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/WidthvsGT.png')

%GT vs DW
figure
sz=25;
scatter(GTAll1,DWAll1, sz, "filled")
xlabel('Gross Tonnage (t)')
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/DWvsGT.png')

%TEU vs length
figure
sz=25;
scatter(LengthAll1,TEUAll1, sz, "filled")
xlabel('Ship Length (m)')
ylabel("TEU")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LengthvsTEU.png')

%TEU vs width
figure
sz=25;
scatter(WidthAll1,TEUAll1, sz, "filled")
xlabel('Ship Width (m)')
ylabel("TEU")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/WidthvsTEU.png')

%TEU vs SL
figure
sz=25;
scatter(TEUAll1,SLAll1, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("TEU")
hold on
lin_reg_line8 = fitlm(TEUAll1,SLAll1);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("TEU")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SLvsTEU.png')

%TEU vs Age
figure
sz=25;
scatter(AgeAll1,TEUAll1, sz, "filled")
xlabel('Age')
ylabel("TEU")
hold on
lin_reg_line8 = fitlm(AgeAll1,TEUAll1);
plot(lin_reg_line8)
xlabel('Age')
ylabel("TEU")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/AgevsTEU.png')

%TEU vs DW
figure
sz=25;
scatter(TEUAll1,DWAll1, sz, "filled")
xlabel('TEU')
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/DWvsTEU.png')

%TEU vs GT
figure
sz=25;
scatter(TEUAll1,GTAll1, sz, "filled")
xlabel('TEU')
ylabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TEUvsGT.png')

%TEU vs SOG
figure
sz=25;
scatter(TEUAll1,SOGAll1, sz, "filled")
xlabel('TEU')
ylabel("GSpeed over Ground (knots)")
hold on
lin_reg_line8 = fitlm(TEUAll1,SOGAll1);
plot(lin_reg_line8)
xlabel('TEU')
ylabel("Speed over Ground (knots)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SOGvsTEU.png')

%DW vs SOG
figure
sz=25;
scatter(DWAll1,SOGAll1, sz, "filled")
xlabel('Deadweight (t)')
ylabel("Speed over Ground (knots)")
hold on
lin_reg_line8 = fitlm(DWAll1,SOGAll1);
plot(lin_reg_line8)
xlabel('Deadweight (t)')
ylabel("Speed over Ground (knots)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SOGvsDW.png')

%GT vs SOG
figure
sz=25;
scatter(GTAll1,SOGAll1, sz, "filled")
xlabel('Gross Tonnage (t)')
ylabel("Speed over Ground (knots)")
hold on
lin_reg_line8 = fitlm(GTAll1,SOGAll1);
plot(lin_reg_line8)
xlabel('Gross Tonnage (t)')
ylabel("Speed over Ground (knots)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SOGvsGT.png')


%Length vs Age of Cargo vs Tanker
cargoageIdx = strcmp(TypeAllBoat(:,1),'Cargo');
cargoage = AgeAll1(cargoageIdx,1);
mean(cargoage,'omitnan') % 2011
std(cargoage,'omitnan') % 5.7018
cargolength = LengthAll1(cargoageIdx,1);
mean(cargolength,'omitnan') % 204.9216
std(cargolength,'omitnan') % 44.2547
cargoSL = SLAll1(cargoageIdx,1);
mean(cargoSL,'omitnan') % 147.0126
std(cargoSL,'omitnan') % 4.2371
cargoWidth = WidthAll1(cargoageIdx,1);
mean(cargoWidth,'omitnan') % 31.3639
std(cargoWidth,'omitnan') % 5.2383
cargoDW = DWAll1(cargoageIdx,1);
mean(cargoDW,'omitnan') % 53670 t
std(cargoDW,'omitnan') % 24579 t
cargoGT = GTAll1(cargoageIdx,1);
mean(cargoGT,'omitnan') % 35649 t
std(cargoGT,'omitnan') % 18690 t
cargoTEU = TEUAll1(cargoageIdx,1);
mean(cargoTEU,'omitnan') % 3600 TEU
std(cargoTEU,'omitnan') % 2876 TEU

tankerageIdx = strcmp(TypeAllBoat(:,1),'Tanker');
tankerage = AgeAll1(tankerageIdx,1);
mean(tankerage,'omitnan') % 2012
std(tankerage,'omitnan') % 5.777
tankerlength = LengthAll1(tankerageIdx,1);
mean(tankerlength,'omitnan') % 197.3489
std(tankerlength,'omitnan') % 45.1448
tankerSL = SLAll1(tankerageIdx,1);
mean(tankerSL,'omitnan') % 146.3010
std(tankerSL,'omitnan') % 4.3496
tankerWidth = WidthAll1(tankerageIdx,1);
mean(tankerWidth,'omitnan') % 32.9209
std(tankerWidth,'omitnan') % 7.2826
tankerDW = DWAll1(tankerageIdx,1);
mean(tankerDW,'omitnan') % 53492 t
std(tankerDW,'omitnan') % 29693 t
tankerGT = GTAll1(tankerageIdx,1);
mean(tankerGT,'omitnan') % 39422 t
std(tankerGT,'omitnan') % 29450 t
tankerTEU = TEUAll1(tankerageIdx,1);
mean(tankerTEU,'omitnan') % 5386 TEU
std(tankerTEU,'omitnan') % 3175 TEU

figure
histogram(cargoage,'FaceAlpha', 0.2,'FaceColor','k')
hold on
histogram(tankerage,'FaceAlpha', 0.2,'FaceColor','y')
xlabel('Year Built')
ylabel('Frequency')
legend ('Cargo', 'Tanker')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LengthvsAge.png')
hold off

%cargo
%SL
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoSL = SLAll1(cargoIdx,1); 
%Length
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoSLLengths = LengthAll1(cargoIdx,1); 
%Age
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoSLAge = AgeAll1(cargoIdx,1); 
%Width
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoWidth = WidthAll1(cargoIdx,1);
%DW
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoDW = DWAll1(cargoIdx,1);
%GT
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoGT = GTAll1(cargoIdx,1);
%SOG
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoSOG = SOGAll1(cargoIdx,1);
%TEU
cargoIdx = strcmp(TypeAllBoat(:,1),'Cargo'); 
cargoTEU = TEUAll1(cargoIdx,1);

%scatter SL vs length
cs = cargoSL;
cl = cargoSLLengths;
figure
sz=25;
scatter(cl,cs, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
hold on
lin_reg_line4 = fitlm(cl,cs);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/CargoSLvlength.png')
%scatter SL vs age
cs = cargoSL;
ca = cargoSLAge;
figure
sz=25;
scatter(ca,cs, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cs);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/CargoSLvage.png')
%scatter age vs length
cl = cargoSLLengths;
ca = cargoSLAge;
figure
sz=25;
scatter(ca,cl, sz,"filled")
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
hold on
lin_reg_line6 = fitlm(ca,cl);
plot(lin_reg_line6)
ylabel("Cargo Length (m)")
xlabel("Cargo Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/Cargolengthvage.png')

%tanker
%SL
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerSL = SLAll1(tankerIdx,1); 
%Length
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerSLLengths = LengthAll1(tankerIdx,1); 
%Age
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerSLAge = AgeAll1(tankerIdx,1);
%Age
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerWidth = WidthAll1(tankerIdx,1);
%DW
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerDW = DWAll1(tankerIdx,1);
%GT
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerGT = GTAll1(tankerIdx,1);
%SOG
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerSOG = SOGAll1(tankerIdx,1);
%TEU
tankerIdx = strcmp(TypeAllBoat(:,1),'Tanker'); 
tankerTEU = TEUAll1(tankerIdx,1);

%scatter SL vs length
ts = tankerSL;
tl = tankerSLLengths;
figure
sz=25;
scatter(tl,ts, sz, "filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
hold on
lin_reg_line4 = fitlm(tl,ts);
plot(lin_reg_line4)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TankerSLvlength.png')

%scatter SL vs age
ts = tankerSL;
ta = tankerSLAge;
figure
sz=25;
scatter(ta,ts, sz,"filled")
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,ts);
plot(lin_reg_line6)
ylabel("Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TankerSLvage.png')
%scatter age vs length
tl = tankerSLLengths;
ta = tankerSLAge;
figure
sz=25;
scatter(ta,tl, sz,"filled")
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
hold on
lin_reg_line6 = fitlm(ta,tl);
plot(lin_reg_line6)
ylabel("Tanker Length (m)")
xlabel("Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/Tankerlengthvage.png')

%Cargo and Tanker same plot
%SL vs length
figure
sz=25;
scatter(tl,ts, sz, "blue", "filled");
hold on
scatter(cl, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SLvsLength.png')
%length vs sl other
figure
sz=25;
scatter(tl,ts, sz, "blue", "filled");
hold on
lin_reg_line8 = fitlm(tl,ts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
hold on
scatter(cl, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Length (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line9 = fitlm(cl, cs);
plot(lin_reg_line9)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Ship Length (m)")
title(' ')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LinearSLvsLength.png')
%SL vs age
figure
sz=25;
scatter(ta,ts, sz, "blue", "filled");
hold on
scatter(ca, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Built Year")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SLvsAge.png')
%Age vs length
figure
sz=25;
scatter(ta,tl, sz, "blue", "filled");
hold on
scatter(ca, cl, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Built Year")
ylabel("Ship Length (m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LengthvsAge.png')
%age vs length other
figure
sz=25;
scatter(ta,tl, sz, "blue", "filled");
hold on
lin_reg_line8 = fitlm(ta,tl);
plot(lin_reg_line8)
ylabel('Ship Length (m)')
xlabel("Ship Age")
title(' ')
hold on
scatter(ca, cl, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Age")
ylabel("Ship Length (m)")
hold on
lin_reg_line9 = fitlm(ca, cl);
plot(lin_reg_line9)
ylabel('Ship Length (m)')
xlabel("Ship Age")
title(' ')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LinearAgevsLength.png')
%length vs sog
figure
sz=25;
scatter(tl, tankerSOG, sz, "blue", "filled");
hold on
scatter(cl, cargoSOG, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Length (m)")
ylabel("Speed over Ground (knots)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LengthvsSOG.png')
%GT vs SOG
figure
sz=25;
scatter(tankerGT,tankerSOG, sz, "blue", "filled");
hold on
scatter(cargoGT,cargoSOG, sz, "black", "filled");
legend('Tanker', 'Cargo')
ylabel("Speed Over Ground (knots)")
xlabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SOGvsGT.png')
%DW vs SOG
figure
sz=25;
scatter(tankerDW,tankerSOG, sz, "blue", "filled");
hold on
scatter(cargoDW,cargoSOG, sz, "black", "filled");
legend('Tanker', 'Cargo')
ylabel("Speed Over Ground (knots)")
xlabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SOGvsDW.png')
%GT vs length
figure
sz=25;
scatter(tl,tankerGT, sz, "blue", "filled");
hold on
scatter(cl, cargoGT, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Length (m)")
ylabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LengthvsGT.png')
%GT vs width
figure
sz=25;
scatter(tankerWidth,tankerGT, sz, "blue", "filled");
hold on
scatter(cargoWidth, cargoGT, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Width (m)")
ylabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_WidthvsGT.png')
%GT vs age
figure
sz=25;
scatter(ta,tankerGT, sz, "blue", "filled");
hold on
scatter(ca, cargoGT, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Age")
ylabel("Gross Tonnage (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_AgevsGT.png')
%GT vs SL
figure
sz=25;
scatter(tankerGT,ts, sz, "blue", "filled");
hold on
scatter(cargoGT, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Gross Tonnage (t)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SLvsGT.png')
%DW vs SL
figure
sz=25;
scatter(tankerDW,ts, sz, "blue", "filled");
hold on
scatter(cargoDW, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Deadweight (t)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SLvsDW.png')
%DW vs age
figure
sz=25;
scatter(ta,tankerDW, sz, "blue", "filled");
hold on
scatter(ca, cargoDW, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Age")
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_AgevsDW.png')
%DW vs length
figure
sz=25;
scatter(tl,tankerDW, sz, "blue", "filled");
hold on
scatter(cl, cargoDW, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Length (m)")
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_LengthvsDW.png')
%DW vs width
figure
sz=25;
scatter(tankerWidth,tankerDW, sz, "blue", "filled");
hold on
scatter(cargoWidth, cargoDW, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Width (m)")
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_WidthvsDW.png')
%SL vs SOG
figure
sz=25;
scatter(tankerSOG,ts, sz, "blue", "filled");
hold on
scatter(cargoSOG, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Speed over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_SLvsSOG.png')
%DW vs GT
figure
sz=25;
scatter(tankerGT,tankerDW, sz, "blue", "filled");
hold on
scatter(cargoGT, cargoDW, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Gross Tonnage (t)")
ylabel("Deadweight (t)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_GTvsDW.png')
%TEU vs length
figure
sz=25;
scatter(tl,tankerTEU, sz, "blue", "filled");
hold on
scatter(cl, cargoTEU, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Length (m)")
ylabel("TEU")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_TEUvsLength.png')
%TEU vs width
figure
sz=25;
scatter(tankerWidth,tankerTEU, sz, "blue", "filled");
hold on
scatter(cargoWidth, cargoTEU, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Width (m)")
ylabel("TEU")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_TEUvsWidth.png')
%TEU vs age
figure
sz=25;
scatter(tankerage,tankerTEU, sz, "blue", "filled");
hold on
scatter(cargoage, cargoTEU, sz, "black", "filled");
legend('Tanker', 'Cargo')
xlabel("Ship Age")
ylabel("TEU")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_TEUvsage.png')
%TEU vs SL
figure
sz=25;
scatter(tankerTEU,ts, sz, "blue", "filled");
hold on
scatter(cargoTEU, cs, sz, "black", "filled");
legend('Tanker', 'Cargo')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlabel("TEU")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/TC_TEUvsSL.png')

% SLAllBoats = cat(1, AIS_metrics(:,5),AIS_SL02(:,5), AIS_GA01(:,5),AIS_GA02(:,5));
% SOGAllBoat = cat(1, AIS_metrics(:,4),AIS_SL02(:,4), AIS_GA01(:,4),AIS_GA02(:,4));
% TypeAllBoat = cat(1, AIS_metrics(:,1),AIS_SL02(:,1), AIS_GA01(:,1),AIS_GA02(:,1));
% DetailedAllBoat = cat(1, AIS_metrics(:,7),AIS_SL02(:,7), AIS_GA01(:,7),AIS_GA02(:,7));
% LengthAllBoats = cat(1, AIS_metrics(:,2),AIS_SL02(:,2), AIS_GA01(:,2),AIS_GA02(:,2));
% AgeAllBoats = cat(1, AIS_metrics(:,8),AIS_SL02(:,8), AIS_GA01(:,8),AIS_GA02(:,8));
% SLAll1 = cell2mat(SLAllBoats);
% SOGAll1 = cell2mat(SOGAllBoat);
% LengthAll1 = cell2mat(LengthAllBoats);
% AgeAll1 = cell2mat(AgeAllBoats);

%Specific type 
%LPG tanker
%SL
LPGtankerIdx = strcmp(DetailedAllBoat(:,1),'LPG Tanker'); 
LPGtankerSL = SLAll1(LPGtankerIdx,1);
mean(LPGtankerSL,'omitnan') %146.9562
std(LPGtankerSL,'omitnan')%4.0379
%length
LPGtankerIdx = strcmp(DetailedAllBoat(:,1),'LPG Tanker'); 
LPGtankerLengths = LengthAll1(LPGtankerIdx,1);
mean(LPGtankerLengths,'omitnan') % 191.0743 m
std(LPGtankerLengths,'omitnan') % 45.1860 m
%age
LPGtankerIdx = strcmp(DetailedAllBoat(:,1),'LPG Tanker'); 
LPGtankerage = AgeAll1(LPGtankerIdx,1);
mean(LPGtankerage,'omitnan') % 2014
std(LPGtankerage,'omitnan') % 5.0043
%width
LPGtankerIdx = strcmp(DetailedAllBoat(:,1),'LPG Tanker'); 
LPGtankerWidth = WidthAll1(LPGtankerIdx,1);
mean(LPGtankerWidth,'omitnan') % 30.3361
std(LPGtankerWidth,'omitnan') % 6.9807
%scatter Sl vs length
lpgts = LPGtankerSL;
lpgtl = LPGtankerLengths;
figure
sz=25;
scatter(lpgtl,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(lpgtl,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LPGTanker_SLvlength.png')
%Scatter SL vs age
lpgts = LPGtankerSL;
lpgta = LPGtankerage;
figure
sz=25;
scatter(lpgta,lpgts, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgts);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("LPG Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LPGTanker_SLvage.png')
%Scatter length vs age
lpgtl = LPGtankerLengths;
lpgta = LPGtankerage;
figure
sz=25;
scatter(lpgta,lpgtl, sz, "filled")
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(lpgta,lpgtl);
plot(lin_reg_line8)
ylabel("LPG Tanker Length (m)")
xlabel("LPG Tanker Age (years)")
title([' '])
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/LPGTanker_agevlength.png')

%General Cargo
%SL
generalcargoIdx = strcmp(DetailedAllBoat(:,1),'General Cargo'); 
generalcargoSL = SLAll1(generalcargoIdx,1);
mean(generalcargoSL,'omitnan') %148.2206
std(generalcargoSL,'omitnan') %3.9336
%length
generalcargoIdx = strcmp(DetailedAllBoat(:,1),'General Cargo'); 
generalcargoLengths = LengthAll1(generalcargoIdx,1);
mean(generalcargoLengths,'omitnan') % 160.6236 m
std(generalcargoLengths,'omitnan') % 29.6154 m
%age
generalcargoIdx = strcmp(DetailedAllBoat(:,1),'General Cargo'); 
generalcargoage = AgeAll1(generalcargoIdx,1);
mean(generalcargoage,'omitnan') % 2009
std(generalcargoage,'omitnan') % 5.5219
%width
generalcargoIdx = strcmp(DetailedAllBoat(:,1),'General Cargo'); 
generalcargoWidth = WidthAll1(generalcargoIdx,1);
mean(generalcargoWidth,'omitnan') % 25.0918
std(generalcargoWidth,'omitnan') % 5.19111
%Scatter plot SL vs length
gcs = generalcargoSL;
gcl = generalcargoLengths;
figure
sz=25;
scatter(gcl,gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
hold on
lin_reg_line8 = fitlm(gcl,gcs);
plot(lin_reg_line8)
ylabel('General Cargo Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GeneralCargo_SLvlength.png')
%scatter SL vs age
gcs = generalcargoSL;
gca = generalcargoage;
figure
sz=25;
scatter(gca, gcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("General Cargo Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GeneralCargo_SLvage.png')
%Scatter plot length vs age
gcl = generalcargoLengths;
gca = generalcargoage;
figure
sz=25;
scatter(gca,gcl, sz, "filled")
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold on
lin_reg_line8 = fitlm(gca,gcl);
plot(lin_reg_line8)
ylabel("General Cargo Ship Length (m)")
xlabel("General Cargo Ship Age (years)")
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GeneralCargo_lengthvage.png')

%Chemical/Oil Products Tanker
%SL
chemoiltankerIdx = strcmp(DetailedAllBoat(:,1),'Oil/Chemical Tanker'); 
chemoitankerSL = SLAll1(chemoiltankerIdx,1);
mean(chemoitankerSL,'omitnan') % 145.9129 dB re 1 µPa^2/Hz @ 1m
std(chemoitankerSL,'omitnan') % 4.3092 dB re 1 µPa^2/Hz @ 1m
%length
chemoiltankerIdx = strcmp(DetailedAllBoat(:,1),'Oil/Chemical Tanker'); 
chemoitankerLengths = LengthAll1(chemoiltankerIdx,1);
mean(chemoitankerLengths,'omitnan') %175.9504 m
std(chemoitankerLengths,'omitnan') %16.9214 m
%age
chemoiltankerIdx = strcmp(DetailedAllBoat(:,1),'Oil/Chemical Tanker'); 
chemoitankerage = AgeAll1(chemoiltankerIdx,1);
mean(chemoitankerage,'omitnan') % 2013
std(chemoitankerage,'omitnan') % 5.5167
%width
chemoiltankerIdx = strcmp(DetailedAllBoat(:,1),'Oil/Chemical Tanker'); 
chemoitankerWidth = WidthAll1(chemoiltankerIdx,1);
mean(chemoitankerWidth,'omitnan') % 30.0552
std(chemoitankerWidth,'omitnan') % 3.7395
%Scatter plot SL vs length
cots = chemoitankerSL;
cotl = chemoitankerLengths;
figure
sz=25;
scatter(cotl, cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(cotl,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/ChemOilTanker_SLvslength.png')
%Scatter plot SL vs age
cots = chemoitankerSL;
cota = chemoitankerage;
figure
sz=25;
scatter(cota,cots, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Year Built")
hold on
lin_reg_line8 = fitlm(cota,cots);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Chemical/Oil Products Tanker Year Built")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/ChemOilTanker_SLvsage.png')
%Scatter plot length vs age
cotl = chemoitankerLengths;
cota = chemoitankerage;
figure
sz=25;
scatter(cota,cotl, sz, "filled")
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(cota,cotl);
plot(lin_reg_line8)
ylabel("Chemical/Oil Products Tanker Length (m)")
xlabel("Chemical/Oil Products Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/ChemOilTanker_agevslength.png')

%Bulk Carrier
%SL
bulkcarrierIdx = strcmp(DetailedAllBoat(:,1),'Bulk Carrier'); 
bulkcarrierSL = SLAll1(bulkcarrierIdx,1);
mean(bulkcarrierSL,'omitnan')% 146.5559
std(bulkcarrierSL,'omitnan') %3.9848
%length
bulkcarrierIdx = strcmp(DetailedAllBoat(:,1),'Bulk Carrier'); 
bulkcarrierLengths = LengthAll1(bulkcarrierIdx,1);
mean(bulkcarrierLengths,'omitnan') % 199.3481 m
std(bulkcarrierLengths,'omitnan') % 20.5445 m
%age
bulkcarrierIdx = strcmp(DetailedAllBoat(:,1),'Bulk Carrier'); 
bulkcarrierage = AgeAll1(bulkcarrierIdx,1);
mean(bulkcarrierage,'omitnan') % 2013 years
std(bulkcarrierage,'omitnan') % 5.0552 years
%width
bulkcarrierIdx = strcmp(DetailedAllBoat(:,1),'Bulk Carrier'); 
bulkcarrierWidth = WidthAll1(bulkcarrierIdx,1);
mean(bulkcarrierWidth,'omitnan') % 31.4908
std(bulkcarrierWidth,'omitnan') % 2.2993
%Scatter plot SL vs length
bcs = bulkcarrierSL;
bcl = bulkcarrierLengths;
figure
sz=25;
scatter(bcl, bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
hold on
lin_reg_line8 = fitlm(bcl,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/BulkCarrier_SLvslength.png')
%Scatter plot SL vs age
bcs = bulkcarrierSL;
bca = bulkcarrierage;
figure
sz=25;
scatter(bca,bcs, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcs);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/BulkCarrier_SLvsage.png')
%Scatter plot length vs age
bcl = bulkcarrierLengths;
bca = bulkcarrierage;
figure
sz=25;
scatter(bca,bcl, sz, "filled")
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
hold on
lin_reg_line8 = fitlm(bca,bcl);
plot(lin_reg_line8)
ylabel("Bulk Carrier Length (m)")
xlabel("Bulk Carrier Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/BulkCarrier_lengthvsage.png')

%Container Ship
%SL
containerIdx = strcmp(DetailedAllBoat(:,1),'Container Ship'); 
containerSL = SLAll1(containerIdx,1);
mean(containerSL,'omitnan') % 148.0574 dB re 1 µPa^2/Hz @ 1m
std(containerSL,'omitnan') % 5.0327 dB re 1 µPa^2/Hz @ 1m
%Length
containerIdx = strcmp(DetailedAllBoat(:,1),'Container Ship'); 
containerLengths = LengthAll1(containerIdx,1);
mean(containerLengths,'omitnan') % 273.5988 m
std(containerLengths,'omitnan') % 49.0138 m
%age
containerIdx = strcmp(DetailedAllBoat(:,1),'Container Ship'); 
containerage = AgeAll1(containerIdx,1);
mean(containerage,'omitnan') % 2008 years
std(containerage,'omitnan') % 4.3344 years
%width
containerIdx = strcmp(DetailedAllBoat(:,1),'Container Ship'); 
containerWidth = WidthAll1(containerIdx,1);
mean(containerWidth,'omitnan') % 37.0785
std(containerWidth,'omitnan') % 6.6945
%Scatter plot SL vs length
css = containerSL;
csl = containerLengths;
figure
sz=25;
scatter(csl, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
hold on
lin_reg_line8 = fitlm(csl,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Length (m)")
title('')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/ContainerShip_SLvslength.png')
%Scatter plot SL vs age
css = containerSL;
csa = containerage;
figure
sz=25;
scatter(csa, css, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa,css);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/ContainerShip_SLvsage.png')
%Scatter plot length vs age
csl = containerLengths;
csa = containerage;
figure
sz=25;
scatter(csa,csl, sz, "filled")
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
hold on
lin_reg_line8 = fitlm(csa, csl);
plot(lin_reg_line8)
ylabel("Container Ship Length (m)")
xlabel("Container Ship Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/ContainerShip_lengthvsage.png')

%Crude Oil Tanker
%SL
crudeoilIdx = strcmp(DetailedAllBoat(:,1),'Crude Oil Tanker'); 
crudeoilSL = SLAll1(crudeoilIdx,1);
mean(crudeoilSL,'omitnan') %146.2389
std(crudeoilSL,'omitnan') %4.1467
%Length
crudeoilIdx = strcmp(DetailedAllBoat(:,1),'Crude Oil Tanker'); 
crudeoilLengths = LengthAll1(crudeoilIdx,1);
mean(crudeoilLengths,'omitnan') % 239.8351 m
std(crudeoilLengths,'omitnan') % 23.6434 m
%age
crudeoilIdx = strcmp(DetailedAllBoat(:,1),'Crude Oil Tanker'); 
crudeoilage = AgeAll1(crudeoilIdx,1);
mean(crudeoilage,'omitnan') % 2010
std(crudeoilage,'omitnan') % 5.2775 years
%width
crudeoilIdx = strcmp(DetailedAllBoat(:,1),'Crude Oil Tanker'); 
crudeoilWidth = WidthAll1(crudeoilIdx,1);
mean(crudeoilWidth,'omitnan') % 40.6282
std(crudeoilWidth,'omitnan') % 5.7660
%Scatter plot SL vs length
cos = crudeoilSL;
col = crudeoilLengths;
figure
sz=25;
scatter(col,cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
hold on
lin_reg_line8 = fitlm(col,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Length (m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/CrudeOil_lengthvsSL.png')
%Scatter plot SL vs age
cos = crudeoilSL;
coa = crudeoilage;
figure
sz=25;
scatter(coa, cos, sz, "filled")
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,cos);
plot(lin_reg_line8)
ylabel('Mean Broadband MSL (dB re 1 µPa^2/Hz @ 1m)')
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/CrudeOil_agevsSL.png')
%Scatter plot length vs age
col = crudeoilLengths;
coa = crudeoilage;
figure
sz=25;
scatter(coa,col, sz, "filled")
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
hold on
lin_reg_line8 = fitlm(coa,col);
plot(lin_reg_line8)
ylabel("Crude Oil Tanker Length (m)")
xlabel("Crude Oil Tanker Age (years)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/CrudeOil_agevslength.png')


%% North/South Metrics
%SL01
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/AIS_metrics.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_SL_01_SPL_RNL_MSL');

%SOG
southIdx = strcmp(AIS_metrics(:,9),'South'); 
southSOG = AIS_metrics(southIdx,4); 
southSOGdouble = cell2mat(southSOG); 
mean(southSOGdouble,'omitnan') % 12.3473 knots
std(southSOGdouble,'omitnan') % 2.0774 knots

northIdx = strcmp(AIS_metrics(:,9),'North'); 
northSOG = AIS_metrics(northIdx,4); 
northSOGdouble = cell2mat(northSOG);
mean(northSOGdouble,'omitnan') % 11.6804 knots
std(northSOGdouble,'omitnan') % 2.1573 knots

figure
histogram(northSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic SOG (knots)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01NS_SOG.png')

%SL
southIdx = strcmp(AIS_metrics(:,9),'South'); 
southSL = AIS_metrics(southIdx,5); 
southSLdouble = cell2mat(southSL); 
mean(southSLdouble,'omitnan') % 148.6440 dB re 1 µPa^2/Hz @ 1m
std(southSLdouble,'omitnan') % 3.5649 dB re 1 µPa^2/Hz @ 1m

northIdx = strcmp(AIS_metrics(:,9),'North'); 
northSL = AIS_metrics(northIdx,5); 
northSLdouble = cell2mat(northSL);
mean(northSLdouble,'omitnan') % 146.3561 dB re 1 µPa^2/Hz @ 1m
std(northSLdouble,'omitnan') % 4.4799 dB re 1 µPa^2/Hz @ 1m

figure
histogram(northSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01NS_SL.png')

%SL vs SOG
southIdx = strcmp(AIS_metrics(:,9),'South'); 
southSLSOG = AIS_metrics(southIdx,4); 
southSLSOGDouble = cell2mat(southSLSOG); 
ss = southSLdouble;
sss = southSLSOGDouble;
figure
scatter(sss, ss, "blue", "filled")
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
lin_reg_line6 = fitlm(sss,ss);
hold on
plot(lin_reg_line6)
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01_S_SLvSOG.png')

northIdx = strcmp(AIS_metrics(:,9),'North'); 
northSLSOG = AIS_metrics(northIdx,4); 
northSLSOGDouble = cell2mat(northSLSOG); 
ns = northSLdouble;
nss = northSLSOGDouble;
figure
scatter(nss, ns, "blue", "filled")
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line9 = fitlm(nss,ns);
plot(lin_reg_line9)
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01_N_SLvSOG.png')

figure
sz=25;
scatter(nss, ns, sz, "blue", "filled");
hold on
scatter(sss, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL01_NS_SLvsSOG.png')

%GA01
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_GA_01_SPL_RNL_MSL');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_GA01.mat');

%SOG
southIdx = strcmp(AIS_GA01(:,9),'South'); 
southSOG = AIS_GA01(southIdx,4); 
southSOGdouble = cell2mat(southSOG); 
mean(southSOGdouble,'omitnan') % 13.3480 knots
std(southSOGdouble,'omitnan') % 2.4919 knots

northIdx = strcmp(AIS_GA01(:,9),'North'); 
northSOG = AIS_GA01(northIdx,4); 
northSOGdouble = cell2mat(northSOG);
mean(northSOGdouble,'omitnan') % 12.9193 knots
std(northSOGdouble,'omitnan') % 2.3887 knots

figure
histogram(northSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic SOG (knots)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01NS_SOG.png')

%SL
southIdx = strcmp(AIS_GA01(:,9),'South'); 
southSL = AIS_GA01(southIdx,5); 
southSLdouble = cell2mat(southSL); 
mean(southSLdouble,'omitnan') % 147.8456 dB re 1 µPa^2/Hz @ 1m
std(southSLdouble,'omitnan') % 4.5546 dB re 1 µPa^2/Hz @ 1m

northIdx = strcmp(AIS_GA01(:,9),'North'); 
northSL = AIS_GA01(northIdx,5); 
northSLdouble = cell2mat(northSL);
mean(northSLdouble,'omitnan') % 145.2360 dB re 1 µPa^2/Hz @ 1m
std(northSLdouble,'omitnan') % 5.0182 dB re 1 µPa^2/Hz @ 1m

figure
histogram(northSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01NS_SL.png')

%SL vs SOG
southIdx = strcmp(AIS_GA01(:,9),'South'); 
southSLSOG = AIS_GA01(southIdx,4); 
southSLSOGdouble = cell2mat(southSLSOG); 
ss = southSLdouble;
sss = southSLSOGdouble;
figure
scatter(sss, ss, "blue", "filled")
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line6 = fitlm(sss,ss);
plot(lin_reg_line6)
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01_S_SLvSOG.png')

northIdx = strcmp(AIS_GA01(:,9),'North'); 
northSLSOG = AIS_GA01(northIdx,4); 
northSLSOGdouble = cell2mat(northSLSOG); 
ns = northSLdouble;
nss = northSLSOGdouble;
figure
scatter(nss, ns, "blue", "filled")
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line9 = fitlm(nss,ns);
plot(lin_reg_line9)
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01_N_SLvSOG.png')

figure
sz=25;
scatter(nss, ns, sz, "blue", "filled");
hold on
scatter(sss, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA01_NS_SLvsSOG.png')

%SL02
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_SL_02_SPL_RNL_MSL.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_SL02.mat');

%SOG
southIdx = strcmp(AIS_SL02(:,9),'South'); 
southSOG = AIS_SL02(southIdx,4); 
southSOGdouble = cell2mat(southSOG); 
mean(southSOGdouble,'omitnan') % 12.5173 knots
std(southSOGdouble,'omitnan') % 2.0444 knots

northIdx = strcmp(AIS_SL02(:,9),'North'); 
northSOG = AIS_SL02(northIdx,4); 
northSOGdouble = cell2mat(northSOG);
mean(northSOGdouble,'omitnan') % 11.7066 knots
std(northSOGdouble,'omitnan') % 2.2294 knots

figure
histogram(northSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic SOG (knots)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02NS_SOG.png')

%SL
southIdx = strcmp(AIS_SL02(:,9),'South'); 
southSL = AIS_SL02(southIdx,5); 
southSLdouble = cell2mat(southSL); 
mean(southSLdouble,'omitnan') % 148.4394 dB re 1 µPa^2/Hz @ 1m
std(southSLdouble,'omitnan') % 3.3004 dB re 1 µPa^2/Hz @ 1m

northIdx = strcmp(AIS_SL02(:,9),'North'); 
northSL = AIS_SL02(northIdx,5); 
northSLdouble = cell2mat(northSL);
mean(northSLdouble,'omitnan') % 144.9415 dB re 1 µPa^2/Hz @ 1m
std(northSLdouble,'omitnan') % 4.4500 dB re 1 µPa^2/Hz @ 1m

figure
histogram(northSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02NS_SL.png')

%SL vs SOG
southIdx = strcmp(AIS_SL02(:,9),'South'); 
southSLSOG = AIS_SL02(southIdx,4); 
southSLSOGdouble = cell2mat(southSLSOG); 
ss = southSLdouble;
sss = southSLSOGdouble;
figure
scatter(sss, ss, "blue", "filled")
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line6 = fitlm(sss,ss);
plot(lin_reg_line6)
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02_S_SLvSOG.png')

northIdx = strcmp(AIS_SL02(:,9),'North'); 
northSLSOG = AIS_SL02(northIdx,4); 
northSLSOGdouble = cell2mat(northSLSOG); 
ns = northSLdouble;
nss = northSLSOGdouble;
figure
scatter(nss, ns, "blue", "filled")
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line9 = fitlm(nss,ns);
plot(lin_reg_line9)
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02_N_SLvSOG.png')

figure
sz=25;
scatter(nss, ns, sz, "blue", "filled");
hold on
scatter(sss, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/SL02_NS_SLvsSOG.png')

%GA02
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_GA_02_SPL_RNL_MSL.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MarineTraffic/AIS_GA02.mat');

%SOG
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSOG = AIS_GA02(southIdx,4); 
southSOGdouble = cell2mat(southSOG); 
mean(southSOGdouble,'omitnan') % 13.6686 knots
std(southSOGdouble,'omitnan') % 2.5820 knots

northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSOG = AIS_GA02(northIdx,4); 
northSOGdouble = cell2mat(northSOG);
mean(northSOGdouble,'omitnan') % 13.3796 knots
std(northSOGdouble,'omitnan') % 2.5775 knots

histogram(northSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSOGdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic SOG (knots)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02NS_SOG.png')

%SL
southIdx = strcmp(AIS_GA02(:,9),'South'); 
southSL = AIS_GA02(southIdx,5); 
southSLdouble = cell2mat(southSL); 
mean(southSLdouble,'omitnan') % 146.8332 dB re 1 µPa^2/Hz @ 1m
std(southSLdouble,'omitnan') % 4.2553 dB re 1 µPa^2/Hz @ 1m

northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSL = AIS_GA02(northIdx,5); 
northSLdouble = cell2mat(northSL);
mean(northSLdouble,'omitnan') % 146.1467 dB re 1 µPa^2/Hz @ 1m
std(northSLdouble,'omitnan') % 4.1256 dB re 1 µPa^2/Hz @ 1m

histogram(northSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','k')
hold on
histogram(southSLdouble,'BinWidth',1,'FaceAlpha', 0.2, 'FaceColor','y')
xlabel('Ship Traffic Source Level (dB re 1 µPa^2/Hz @ 1m)')
ylabel('Frequency')
legend ('North', 'South')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02NS_SL.png')

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
hold on
lin_reg_line6 = fitlm(sss,ss);
plot(lin_reg_line6)
xlabel("South-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02_S_SLvSOG.png')

northIdx = strcmp(AIS_GA02(:,9),'North'); 
northSLSOG = AIS_GA02(northIdx,4); 
northSLSOGdouble = cell2mat(northSLSOG); 
ns = northSLdouble;
nss = northSLSOGdouble;
figure
scatter(nss, ns, "blue", "filled")
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line9 = fitlm(nss,ns);
plot(lin_reg_line9)
xlabel("North-bound Ship SOG (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title(' ')
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02_N_SLvSOG.png')

figure
sz=25;
scatter(nss, ns, sz, "blue", "filled");
hold on
scatter(sss, ss, sz, "black", "filled");
legend('North-bound', 'South-bound')
xlabel("Ship Speed Over Ground (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold off
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Best/GA02NS_SLvsSOG.png')

