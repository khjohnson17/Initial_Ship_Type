%Weather
%2/21/23
%KHJ

%Import 2020, 2021, and 2022 data
% load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/SLEnviron2020.mat');
% load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/SLEnviron2021.mat');
% load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/SLEnviron2022.mat');
% 
% SLEnviron2020_v2 = table2array(SLEnviron2020);
% mydate=datenum([SLEnviron2020_v2(:,1:5),zeros(size(SLEnviron2020_v2,1),1)]);
% 
% figure;
% plot(mydate(1:120:end),SLEnviron2020_v2(1:120:end,7))
% datetick('x','mm/yy')

%Loop aka SL site 2020
LOOP2020 = readtable('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/lopl1h2020.txt')
LOOP2020_v2 = table2array(LOOP2020);
mydate1=datenum([LOOP2020_v2(:,1:5),zeros(size(LOOP2020_v2,1),1)]);

figure;
plot(mydate1,LOOP2020_v2(:,7))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Speed (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_Loop_Wind_Speed.png')

figure;
plot(mydate1,LOOP2020_v2(:,8))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Gust (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_Loop_Wind_Gust.png')

figure;
goodRows = LOOP2020_v2(:,9)~=99;
plot(mydate1(goodRows),LOOP2020_v2(goodRows,9))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wave Height (m)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_Loop_Wave_Height.png')

figure;
goodRows2 = LOOP2020_v2(:,6)~=999;
plot(mydate1(goodRows2),LOOP2020_v2(goodRows2,6),'.')
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Direction (degrees)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_Loop_Wind_Direction.png')

figure;
plot(mydate1,LOOP2020_v2(:,14))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_Loop_Temperature.png')

figure;
plot(mydate1,LOOP2020_v2(:,13))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Atmospheric Pressure (hPa)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_Loop_Atmospheric_Pressure.png')

%Loop 2021
LOOP2021 = readtable('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/lopl1h2021.txt')
LOOP2021_v2 = table2array(LOOP2021);
mydate2=datenum([LOOP2021_v2(:,1:5),zeros(size(LOOP2021_v2,1),1)]);

figure;
goodRows = LOOP2021_v2(:,7)~=99;
plot(mydate2(goodRows),LOOP2021_v2(goodRows,7))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Speed (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_Loop_Wind_Speed.png')

figure;
goodRows2 = LOOP2021_v2(:,8)~=99;
plot(mydate2(goodRows2),LOOP2021_v2(goodRows2,8))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Gust (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_Loop_Wind_Gust.png')

figure;
goodRows3 = LOOP2021_v2(:,9)~=99;
plot(mydate2(goodRows3),LOOP2021_v2(goodRows3,9))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wave Height (m)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_Loop_Wave_Height.png')

figure;
goodRows4 = LOOP2021_v2(:,6)~=999;
plot(mydate2(goodRows4),LOOP2021_v2(goodRows4,6),'.')
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Direction (degrees)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_Loop_Wind_Direction.png')

figure;
goodRows5 = LOOP2021_v2(:,14)~=999;
plot(mydate2(goodRows5),LOOP2021_v2(goodRows5,14))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_Loop_Temperature.png')

figure;
goodRows6 = LOOP2021_v2(:,13)~=9999;
plot(mydate2(goodRows6),LOOP2021_v2(goodRows6,13))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Atmospheric Pressure (hPa)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_Loop_Atmospheric_Pressure.png')

%Loop 2022
LOOP2022 = readtable('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/lopl1h2022.txt')
LOOP2022_v2 = table2array(LOOP2022);
mydate3=datenum([LOOP2022_v2(:,1:5),zeros(size(LOOP2022_v2,1),1)]);

figure;
goodRows = LOOP2022_v2(:,7)~=99;
plot(mydate3(goodRows),LOOP2022_v2(goodRows,7))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Speed (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_Loop_Wind_Speed.png')

figure;
goodRows2 = LOOP2022_v2(:,8)~=99;
plot(mydate3(goodRows2),LOOP2022_v2(goodRows2,8))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Gust (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_Loop_Wind_Gust.png')

figure;
goodRows3 = LOOP2022_v2(:,9)~=99;
plot(mydate3(goodRows3),LOOP2022_v2(goodRows3,9))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wave Height (m)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_Loop_Wave_Height.png')

%NO WIND DIRECTION
% figure;
% goodRows4 = LOOP2022_v2(:,6)~=999;
% plot(mydate3(goodRows4),LOOP2022_v2(goodRows4,6),'.')
% datetick('x','mm/yy')
% xlabel('Date')
% ylabel('Wind Direction (degrees)')
% saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_Loop_Wind_Direction.png')

%NO ATMOSPHERIC PRESSURE
% figure;
% goodRows5 = LOOP2022_v2(:,14)~=999;
% plot(mydate3(goodRows5),LOOP2022_v2(goodRows5,14))
% datetick('x','mm/yy')
% xlabel('Date')
% ylabel('Temperature (C)')
% saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_Loop_Atmospheric_Pressure.png')


%concatonating SL site dates
SLSLDate = cat(1,CPA_time_all,CPA_time_all_); %rename one CPA_time_all to CPA_time_all_
SLWeather = cat(1,LOOP2020, LOOP2021, LOOP2022);
SLWeatherDates = cat(1, mydate1, mydate2, mydate3);
matches = zeros(size(length(SLSLDate)));
for idx = 1:length(SLSLDate)
    [~,bestMatchIndex] = min(abs(SLSLDate(idx)-SLWeatherDates));
    matches(idx,1) = (bestMatchIndex);
end
SLWind_SL = SLWeather(matches,6:16);

%concatonate SL SL's
SLSL = cat(1, AIS_metrics(:,5),AIS_SL02(:,5));
SLSL1 = cell2mat(SLSL);
SLHeading = cat(1, AIS_metrics(:,9),AIS_SL02(:,9));

%plotting
%wind direction
SLDir = SLWind_SL(:,1);
SLDirection = table2array(SLDir);
goodDirection = SLDirection(:,1)~=999;
% northBound = find(strcmp(SLHeading,'North'));
% southBound = find(strcmp(SLHeading,'South'));
% goodNorth = intersect(goodDirection,northBound);
% goodSouth = intersect(southBound,goodDirection);
figure
sz=25;
scatter(SLDirection(goodDirection), SLSL1(goodDirection), sz, "filled");
%scatter(SLDirection(goodNorth), SLSL1(goodNorth), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 400])
ylim([130 180])
hold on
% scatter(SLDirection(goodSouth), SLSL1(goodSouth), sz, "filled");
% xlabel("Wind Direction (Degrees)")
% ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
% xlim([0 400])
% ylim([130 180])
% hold on
lin_reg_line = fitlm(SLDirection(goodDirection), SLSL1(goodDirection));
plot(lin_reg_line)
xlabel("Wind Direction (Degrees)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 400])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_WindDirection.png')
%or
SLDir = SLWind_SL(:,1);
SLDirection = table2array(SLDir);
goodDirection = SLDirection(:,1)~=999;
% northBound = find(strcmp(SLHeading,'North'));
% southBound = find(strcmp(SLHeading,'South'));
% goodNorth = intersect(northBound,goodDirection);
% goodSouth = intersect(southBound,goodDirection);
figure
sz=25;
scatter(SLDirection(goodDirection), SLmeanBroadbandMSL(goodDirection), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 400])
ylim([130 180])
hold on
lin_reg_line = fitlm(SLDirection(goodDirection), SLmeanBroadbandMSL(goodDirection));
plot(lin_reg_line)
xlabel("Wind Direction (Degrees)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 400])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_WindDirection.png')


%Wind speed
SLWind = SLWind_SL(:,2);
SLWindy = table2array(SLWind);
goodWind = SLWindy(:,1)~=99;
figure
sz=25;
scatter(SLWindy(goodWind), SLSL1(goodWind), sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 20])
ylim([130 180])
hold on
lin_reg_line1 = fitlm(SLWindy(goodWind), SLSL1(goodWind));
plot(lin_reg_line1)
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
xlim([0 20])
ylim([130 180])
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Wind.png')
%or
SLWind = SLWind_SL(:,2);
SLWindy = table2array(SLWind);
goodWind = SLWindy(:,1)~=99;
figure
sz=25;
scatter(SLWindy(goodWind), SLmeanBroadbandMSL(goodWind), sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 20])
ylim([130 180])
hold on
lin_reg_line1 = fitlm(SLWindy(goodWind), SLmeanBroadbandMSL(goodWind));
plot(lin_reg_line1)
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 20])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_Wind.png')


%Wind gust
SLGust = SLWind_SL(:,3);
SLGusty = table2array(SLGust);
goodGust = SLGusty(:,1)~=99;
figure
sz=25;
scatter(SLGusty(goodGust), SLSL1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 30])
ylim([130 180])
hold on
lin_reg_line2 = fitlm(SLGusty(goodGust), SLSL1(goodGust));
plot(lin_reg_line2)
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 30])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_WindGust.png')
%or
SLGust = SLWind_SL(:,3);
SLGusty = table2array(SLGust);
goodGust = SLGusty(:,1)~=99;
figure
sz=25;
scatter(SLGusty(goodGust), SLmeanBroadbandMSL(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 30])
ylim([130 180])
hold on
lin_reg_line2 = fitlm(SLGusty(goodGust), SLmeanBroadbandMSL(goodGust));
plot(lin_reg_line2)
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 30])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_WindGust.png')


%Wave Height
SLWave = SLWind_SL(:,4);
SLWavey = table2array(SLWave);
goodWaves = SLWavey(:,1)~=99;
figure
sz=25;
scatter(SLWavey(goodWaves), SLSL1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 4])
ylim([130 180])
hold on
lin_reg_line3 = fitlm(SLWavey(goodWaves), SLSL1(goodWaves));
plot(lin_reg_line3)
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 4])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_WaveHeight.png')
%or
SLWave = SLWind_SL(:,4);
SLWavey = table2array(SLWave);
goodWaves = SLWavey(:,1)~=99;
figure
sz=25;
scatter(SLWavey(goodWaves), SLmeanBroadbandMSL(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 4])
ylim([130 180])
hold on
lin_reg_line3 = fitlm(SLWavey(goodWaves), SLmeanBroadbandMSL(goodWaves));
plot(lin_reg_line3)
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 4])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_WaveHeight.png')


%Atmospheric Pressure
SLPress = SLWind_SL(:,8);
SLPressure = table2array(SLPress);
goodPressure = SLPressure(:,1)~=9999;
figure
sz=25;
scatter(SLPressure(goodPressure), SLSL1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([1005 1035])
ylim([130 180])
hold on
lin_reg_line4 = fitlm(SLPressure(goodPressure), SLSL1(goodPressure));
plot(lin_reg_line4)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([1005 1035])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_AtmosphericPressure.png')
%or
SLPress = SLWind_SL(:,8);
SLPressure = table2array(SLPress);
goodPressure = SLPressure(:,1)~=9999;
figure
sz=25;
scatter(SLPressure(goodPressure), SLmeanBroadbandMSL(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
xlim([1005 1035])
ylim([130 180])
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line4 = fitlm(SLPressure(goodPressure), SLmeanBroadbandMSL(goodPressure));
plot(lin_reg_line4)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([1005 1035])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_AtmosphericPressure.png')


%Atmospheric Temperature
SLTemp = SLWind_SL(:,9);
SLTemperature = table2array(SLTemp);
goodTemp = SLTemperature(:,1)~=999;
figure
sz=25;
scatter(SLTemperature(goodTemp), SLSL1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 35])
ylim([130 180])
hold on
lin_reg_line5 = fitlm(SLTemperature(goodTemp), SLSL1(goodTemp));
plot(lin_reg_line5)
xlabel("Atmospheric Temperature (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 35])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_AtmosphericTemperature.png')
%or
SLTemp = SLWind_SL(:,9);
SLTemperature = table2array(SLTemp);
goodTemp = SLTemperature(:,1)~=999;
figure
sz=25;
scatter(SLTemperature(goodTemp), SLmeanBroadbandMSL(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 35])
ylim([130 180])
hold on
lin_reg_line5 = fitlm(SLTemperature(goodTemp), SLmeanBroadbandMSL(goodTemp));
plot(lin_reg_line5)
xlabel("Atmospheric Temperature (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([0 35])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_AtmosphericTemperature.png')

%Dew Point
SLDP = SLWind_SL(:,11);
SLDewPoint = table2array(SLDP);
goodWTemp = SLDewPoint(:,1)~=999;
figure
sz=25;
scatter(SLDewPoint(goodWTemp), SLSL1(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([-5 30])
ylim([130 180])
hold on
lin_reg_line6 = fitlm(SLDewPoint(goodWTemp), SLSL1(goodWTemp));
plot(lin_reg_line6)
xlabel("Dew Point (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([-5 30])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_DewPoint.png')
%or
SLDP = SLWind_SL(:,11);
SLDewPoint = table2array(SLDP);
goodWTemp = SLDewPoint(:,1)~=999;
figure
sz=25;
scatter(SLDewPoint(goodWTemp), SLmeanBroadbandMSL(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([-5 30])
ylim([130 180])
hold on
lin_reg_line6 = fitlm(SLDewPoint(goodWTemp), SLmeanBroadbandMSL(goodWTemp));
plot(lin_reg_line6)
xlabel("Dew Point (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
xlim([-5 30])
ylim([130 180])
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/MeanSL_DewPoint.png')


%concatonate SL SOG's
SLSOG = cat(1, AIS_metrics(:,4),AIS_SL02(:,4));
SLHeading = cat(1, AIS_metrics(:,9),AIS_SL02(:,9));
SLSOG1 = cell2mat(SLSOG);

%%%%%%%%North south
%plotting
%wind direction
SLDir = SLWind_SL(:,1);
SLDirection = table2array(SLDir);
goodDirection = find(SLDirection(:,1)~=999);
northBound = find(strcmp(SLHeading,'North'));
southBound = find(strcmp(SLHeading,'South'));
goodNorth = intersect(northBound,goodDirection);
goodSouth = intersect(southBound,goodDirection);
figure
sz=25;
scatter(SLDirection(goodNorth), SLSOG1(goodNorth), sz, "filled");
hold on
scatter(SLDirection(goodSouth), SLSOG1(goodSouth), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line7 = fitlm(SLDirection(goodDirection), SLSOG1(goodDirection));
plot(lin_reg_line7)
xlabel("Wind Direction (Degrees)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_WindDirection.png')

%Wind speed
SLWind = SLWind_SL(:,2);
SLWindy = table2array(SLWind);
goodWind = SLWindy(:,1)~=99;
figure
sz=25;
scatter(SLWindy(goodWind), SLSOG1(goodWind), sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line8 = fitlm(SLWindy(goodWind), SLSOG1(goodWind));
plot(lin_reg_line8)
xlabel("Wind Speed (knots)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_Wind.png')

%Wind gust
SLGust = SLWind_SL(:,3);
SLGusty = table2array(SLGust);
goodGust = SLGusty(:,1)~=99;
figure
sz=25;
scatter(SLGusty(goodGust), SLSOG1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line9 = fitlm(SLGusty(goodGust), SLSOG1(goodGust));
plot(lin_reg_line9)
xlabel("Wind Gust (knots)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_WindGust.png')

%Wave Height
SLWave = SLWind_SL(:,4);
SLWavey = table2array(SLWave);
goodWaves = SLWavey(:,1)~=99;
figure
sz=25;
scatter(SLWavey(goodWaves), SLSOG1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line10 = fitlm(SLWavey(goodWaves), SLSOG1(goodWaves));
plot(lin_reg_line10)
xlabel("Wave Height (m)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_WaveHeight.png')

%Atmospheric Pressure
SLPress = SLWind_SL(:,8);
SLPressure = table2array(SLPress);
goodPressure = SLPressure(:,1)~=9999;
figure
sz=25;
scatter(SLPressure(goodPressure), SLSOG1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line11 = fitlm(SLPressure(goodPressure), SLSOG1(goodPressure));
plot(lin_reg_line11)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_AtmosphericPressure.png')

%Atmospheric Temperature
SLTemp = SLWind_SL(:,9);
SLTemperature = table2array(SLTemp);
goodTemp = SLTemperature(:,1)~=999;
figure
sz=25;
scatter(SLTemperature(goodTemp), SLSOG1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line12 = fitlm(SLTemperature(goodTemp), SLSOG1(goodTemp));
plot(lin_reg_line12)
xlabel("Atmospheric Temperature (C)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_AtmosphericTemperature.png')

%Dew Point
SLDP = SLWind_SL(:,11);
SLDewPoint = table2array(SLDP);
goodWTemp = SLDewPoint(:,1)~=999;
figure
sz=25;
scatter(SLDewPoint(goodWTemp), SLSOG1(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line13 = fitlm(SLDewPoint(goodWTemp), SLSOG1(goodWTemp));
plot(lin_reg_line13)
xlabel("Dew Point(C)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_SOG_DewPoint.png')


%concatonate SL Drafts's
SLDraft = cat(1, AIS_metrics(:,3),AIS_SL02(:,3));
SLDraft1 = cell2mat(SLDraft);

%plotting
%wind direction
SLDir = SLWind_SL(:,1);
SLDirection = table2array(SLDir);
goodDirection = SLDirection(:,1)~=999;
figure
sz=25;
scatter(SLDirection(goodDirection), SLDraft1(goodDirection), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Draft (m)")
hold on
lin_reg_line14 = fitlm(SLDirection(goodDirection), SLDraft1(goodDirection));
plot(lin_reg_line14)
xlabel("Wind Direction (Degrees)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_WindDirection.png')

%Wind speed
SLWind = SLWind_SL(:,2);
SLWindy = table2array(SLWind);
goodWind = SLWindy(:,1)~=99;
figure
sz=25;
scatter(SLWindy(goodWind), SLDraft1(goodWind), sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Draft (m)")
hold on
lin_reg_line15 = fitlm(SLWindy(goodWind), SLDraft1(goodWind));
plot(lin_reg_line15)
xlabel("Wind Speed (knots)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_Wind.png')

%Wind gust
SLGust = SLWind_SL(:,3);
SLGusty = table2array(SLGust);
goodGust = SLGusty(:,1)~=99;
figure
sz=25;
scatter(SLGusty(goodGust), SLDraft1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Draft (m)")
hold on
lin_reg_line16 = fitlm(SLGusty(goodGust), SLDraft1(goodGust));
plot(lin_reg_line16)
xlabel("Wind Gust (knots)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_WindGust.png')

%Wave Height
SLWave = SLWind_SL(:,4);
SLWavey = table2array(SLWave);
goodWaves = SLWavey(:,1)~=99;
figure
sz=25;
scatter(SLWavey(goodWaves), SLDraft1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Draft (m)")
hold on
lin_reg_line17 = fitlm(SLWavey(goodWaves), SLDraft1(goodWaves));
plot(lin_reg_line17)
xlabel("Wave Height (m)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_WaveHeight.png')

%Atmospheric Pressure
SLPress = SLWind_SL(:,8);
SLPressure = table2array(SLPress);
goodPressure = SLPressure(:,1)~=9999;
figure
sz=25;
scatter(SLPressure(goodPressure), SLDraft1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Draft (m)")
hold on
lin_reg_line18 = fitlm(SLPressure(goodPressure), SLDraft1(goodPressure));
plot(lin_reg_line18)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_AtmosphericPressure.png')

%Atmospheric Temperature
SLTemp = SLWind_SL(:,9);
SLTemperature = table2array(SLTemp);
goodTemp = SLTemperature(:,1)~=999;
figure
sz=25;
scatter(SLTemperature(goodTemp), SLDraft1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Draft (m)")
hold on
lin_reg_line19 = fitlm(SLTemperature(goodTemp), SLDraft1(goodTemp));
plot(lin_reg_line19)
xlabel("Atmospheric Temperature (C)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_AtmosphericTemperature.png')

%Dew Point
SLDP = SLWind_SL(:,11);
SLDewPoint = table2array(SLDP);
goodWTemp = SLDewPoint(:,1)~=999;
figure
sz=25;
scatter(SLDewPoint(goodWTemp), SLDraft1(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Draft (m)")
hold on
lin_reg_line20 = fitlm(SLDewPoint(goodWTemp), SLDraft1(goodWTemp));
plot(lin_reg_line20)
xlabel("Dew Point (C)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_DewPoint.png')

% R = corrplot(SLWind_SL, AIS_SL02)

%plotting north/south and other metrics plus environmental

% SLSLDate = cat(1,CPA_time_all,CPA_time_all_); %rename one CPA_time_all to CPA_time_all_
% SLWeather = cat(1,LOOP2020, LOOP2021, LOOP2022);
% SLWeatherDates = cat(1, mydate1, mydate2, mydate3);
% matches = zeros(size(length(SLSLDate)));
% for idx = 1:length(SLSLDate)
%     [~,bestMatchIndex] = min(abs(SLSLDate(idx)-SLWeatherDates));
%     matches(idx,1) = (bestMatchIndex);
% end
% SLWind_SL = SLWeather(matches,6:16);
% 
% %draft and wind direction
% SLAll = cat(1,AIS_SL02, AIS_metrics)
% 
% SLDirSIdx = strcmp(SLAll(:,9),'South')
% SLDirS = SLAll(SLDirSIdx,3)
% 
% SLDirNIdx = strcmp(SLAll(:,9),'North')
% SLDirN = SLAll(SLDirSIdx,3)
% 
% % directionmatches = zeros(size(length(SLDirN)));
% % for idx = 1:length(SLDirN)
%     [~,bestMatchIndex] = min(abs(SLSLDate(idx)-SLWind_SL));
%     matches(idx,1) = (bestMatchIndex);
% end
% SLWind_SL = SLWeather(matches,6:16);

% 
% SLDir = SLWind_SL(:,1);
% SLDirection = table2array(SLDir);
% goodDirection = SLDirection(:,1)~=999;
% 
% figure
% sz=25;
% scatter(SLDirection(goodDirection), SLDraft1(goodDirection), sz, "filled");
% xlabel("Wind Direction (Degrees)")
% ylabel("Draft (m)")
% saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/SL_Draft_WindDirection.png')
% 
% 
% 

%GA equivalent site 2020

GAEqui2020 = readtable('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/42019h2020.txt')
GAEqui2020_v2 = table2array(GAEqui2020);
mydate4=datenum([GAEqui2020_v2(:,1:5),zeros(size(GAEqui2020_v2,1),1)]);

figure;
goodRows = GAEqui2020_v2(:,7)~=99;
plot(mydate4(goodRows),GAEqui2020_v2(goodRows,7))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Speed (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Wind_Speed.png')

figure;
goodRows2 = GAEqui2020_v2(:,8)~=99;
plot(mydate4(goodRows2),GAEqui2020_v2(goodRows2,8))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Gust (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Wind_Gust.png')

figure;
goodRows3 = GAEqui2020_v2(:,9)~=99;
plot(mydate4(goodRows3),GAEqui2020_v2(goodRows3,9))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wave Height (m)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Wave_Height.png')

figure;
goodRows4 = GAEqui2020_v2(:,6)~=999;
plot(mydate4(goodRows4),GAEqui2020_v2(goodRows4,6),'.')
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Direction (degrees)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Wind_Direction.png')

figure;
goodRows5 = GAEqui2020_v2(:,13)~=9999;
plot(mydate4(goodRows5),GAEqui2020_v2(goodRows5,13))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Atmospheric Pressure (hPa)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Atmospheric_Pressure.png')

figure;
goodRows6 = GAEqui2020_v2(:,14)~=999;
plot(mydate4(goodRows6),GAEqui2020_v2(goodRows6,14))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Temperature.png')

figure;
goodRows7 = GAEqui2020_v2(:,15)~=999;
plot(mydate4(goodRows7),GAEqui2020_v2(goodRows7,15))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Water Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Water_Temperature.png')

figure;
goodRows8 = GAEqui2020_v2(:,16)~=999;
plot(mydate4(goodRows8),GAEqui2020_v2(goodRows8,16))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Dew Point (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2020_42019_Dew_Point.png')

%GA equivalent site 2021
GAEqui2021 = readtable('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/42019h2021.txt')
%GAEqui2021_v2 = table2array(GAEqui2021);
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GAEqui2021_v2.mat');
mydate5=datenum([GAEqui2021_v2(:,1:5),zeros(size(GAEqui2021_v2,1),1)]);


figure;
goodRows = GAEqui2021_v2(:,7)~=99;
plot(mydate5(goodRows),GAEqui2021_v2(goodRows,7))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Speed (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Wind_Speed.png')

figure;
goodRows2 = GAEqui2021_v2(:,8)~=99;
plot(mydate5(goodRows2),GAEqui2021_v2(goodRows2,8))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Gust (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Wind_Gust.png')

figure;
goodRows3 = GAEqui2021_v2(:,9)~=99;
plot(mydate5(goodRows3),GAEqui2021_v2(goodRows3,9))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wave Height (m)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Wave_Height.png')

figure;
goodRows4 = GAEqui2021_v2(:,6)~=999;
plot(mydate5(goodRows4),GAEqui2021_v2(goodRows4,6),'.')
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Direction (degrees)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Wind_Direction.png')

figure;
goodRows5 = GAEqui2021_v2(:,13)~=9999;
plot(mydate5(goodRows5),GAEqui2021_v2(goodRows5,13))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Atmospheric Pressure (hPa)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Atmospheric_Pressure.png')

figure;
goodRows6 = GAEqui2021_v2(:,14)~=999;
plot(mydate5(goodRows6),GAEqui2021_v2(goodRows6,14))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Temperature.png')

figure;
goodRows7 = GAEqui2021_v2(:,15)~=999;
plot(mydate5(goodRows7),GAEqui2021_v2(goodRows7,15))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Water Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Water_Temperature.png')

figure;
goodRows8 = GAEqui2021_v2(:,16)~=999;
plot(mydate5(goodRows8),GAEqui2021_v2(goodRows8,16))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Dew Point (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2021_42019_Dew_Point.png')

%Weather vs SL
% WindSL1 = intersect(mydate5,CPA_time_all)
% GAll = CPA_time_all(:,1);
% GDate = datetime(GAll, 'ConvertFrom', 'datenum', 'Format', 'dd-MM-yy')
% GSort = sort(GDate)
% WAll = mydate5(:,1);
% WDate = datetime(WAll, 'ConvertFrom', 'datenum', 'Format', 'dd-MM-yy')
% WSort = sort(WDate)
% WindSL = intersect(WSort,GSort)

%Wind speed
GA02Wind = Wind_SL(:,2);
GA02Windy = table2array(GA02Wind);
GA02SL = AIS_GA02(:,5);
GA02SL1 = cell2mat(GA02SL);
figure
sz=25;
scatter(GA02Windy, GA02SL1, sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")

%Wind gust
GA02Gust = Wind_SL(:,3);
GA02Gusty = table2array(GA02Gust);
goodGust = GA02Gusty(:,1)~=99
GA02SL = AIS_GA02(:,5);
GA02SL1 = cell2mat(GA02SL);
figure
sz=25;
scatter(GA02Gusty(goodGust), GA02SL1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")

%Wave Height
GA02Wave = Wind_SL(:,4);
GA02Wavey = table2array(GA02Wave);
goodWaves = GA02Wavey(:,1)~=99
GA02SL = AIS_GA02(:,5);
GA02SL1 = cell2mat(GA02SL);
figure
sz=25;
scatter(GA02Wavey(goodWaves), GA02SL1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")

%Atmospheric Pressure
GA02Press = Wind_SL(:,8);
GA02Pressure = table2array(GA02Press);
goodPressure = GA02Pressure(:,1)~=99
GA02SL = AIS_GA02(:,5);
GA02SL1 = cell2mat(GA02SL);
figure
sz=25;
scatter(GA02Pressure(goodPressure), GA02SL1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")

%Atmospheric Temperature
GA02Temp = Wind_SL(:,9);
GA02Temperature = table2array(GA02Temp);
goodTemp = GA02Temperature(:,1)~=999
GA02SL = AIS_GA02(:,5);
GA02SL1 = cell2mat(GA02SL);
figure
sz=25;
scatter(GA02Temperature(goodTemp), GA02SL1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")

%Water Temperature
GA02WTemp = Wind_SL(:,10);
GA02WTemperature = table2array(GA02WTemp);
goodWTemp = GA02WTemperature(:,1)~=999
GA02SL = AIS_GA02(:,5);
GA02SL1 = cell2mat(GA02SL);
figure
sz=25;
scatter(GA02WTemperature(goodWTemp), GA02SL1(goodWTemp), sz, "filled");
xlabel('Water Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")


%or Wind_SL = GAEqui2021.GST(matches);
%or Wind_SL = GAEqui2021.WSPD(matches);

% 
% GAEquiAll = [GAEqui2021;GAEqui2022;GAEqui2023];

% WDate = datetime(matches1, 'ConvertFrom', 'datenum', 'Format', 'dd-MM-yy')

%GA equivalent site 2022
GAEqui2022 = readtable('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/42019h2022.txt')
GAEqui2022_v2 = table2array(GAEqui2022);
mydate6=datenum([GAEqui2022_v2(:,1:5),zeros(size(GAEqui2022_v2,1),1)]);

figure;
goodRows = GAEqui2022_v2(:,7)~=99;
plot(mydate6(goodRows),GAEqui2022_v2(goodRows,7))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Speed (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Wind_Speed.png')

figure;
goodRows2 = GAEqui2022_v2(:,8)~=99;
plot(mydate6(goodRows2),GAEqui2022_v2(goodRows2,8))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wind Gust (knots)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Wind_Gust.png')

figure;
goodRows3 = GAEqui2022_v2(:,9)~=99;
plot(mydate6(goodRows3),GAEqui2022_v2(goodRows3,9))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Wave Height (m)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Wave_Height.png')

%NO WIND DIRECTION
% figure;
% goodRows4 = GAEqui2022_v2(:,6)~=999;
% plot(mydate6(goodRows4),GAEqui2022_v2(goodRows4,6),'.')
% datetick('x','mm/yy')
% xlabel('Date')
% ylabel('Wind Direction (degrees)')
% saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Wind_Direction.png')

figure;
goodRows5 = GAEqui2022_v2(:,13)~=9999;
plot(mydate6(goodRows5),GAEqui2022_v2(goodRows5,13))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Atmospheric Pressure (hPa)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Atmospheric_Pressure.png')

figure;
goodRows6 = GAEqui2022_v2(:,14)~=999;
plot(mydate6(goodRows6),GAEqui2022_v2(goodRows6,14))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Temperature (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Temperature.png')

%NO WATER TEMP
% figure;
% goodRows7 = GAEqui2022_v2(:,15)~=999;
% plot(mydate6(goodRows7),GAEqui2022_v2(goodRows7,15))
% datetick('x','mm/yy')
% xlabel('Date')
% ylabel('Water Temperature (C)')
% saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Water_Temperature.png')

figure;
goodRows8 = GAEqui2022_v2(:,16)~=999;
plot(mydate6(goodRows8),GAEqui2022_v2(goodRows8,16))
datetick('x','mm/yy')
xlabel('Date')
ylabel('Dew Point (C)')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather/2022_42019_Dew_Point.png')



%%%SCATTERPLOTS
%concatonating GA site dates
GASLDate = cat(1,CPA_time_all,CPA_time_all_); %rename one CPA_time_all to CPA_time_all_
GAWeather = cat(1,GAEqui2020, GAEqui2021, GAEqui2022);
GAWeatherDates = cat(1, mydate4, mydate5, mydate6);
matches = zeros(size(length(GASLDate)));
for idx = 1:length(GASLDate)
    [~,bestMatchIndex] = min(abs(GASLDate(idx)-GAWeatherDates));
    matches(idx,1) = (bestMatchIndex);
end
GAWind_SL = GAWeather(matches,6:16);

%concatonate GA SL's
GASL = cat(1, AIS_GA01(:,5),AIS_GA02(:,5));
GASL1 = cell2mat(GASL);

%plotting
%wind direction
GADir = GAWind_SL(:,1);
GADirection = table2array(GADir);
goodDirection = GADirection(:,1)~=999;
figure
sz=25;
scatter(GADirection(goodDirection), GASL1(goodDirection), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line21 = fitlm(GADirection(goodDirection), GASL1(goodDirection));
plot(lin_reg_line21)
xlabel("Wind Direction (Degrees)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_WindDirection.png')

%Wind speed
GAWind = GAWind_SL(:,2);
GAWindy = table2array(GAWind);
figure
sz=25;
scatter(GAWindy, GASL1, sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line22 = fitlm(GAWindy, GASL1);
plot(lin_reg_line22)
xlabel("Wind Speed (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Wind.png')

%Wind gust
GAGust = GAWind_SL(:,3);
GAGusty = table2array(GAGust);
goodGust = GAGusty(:,1)~=99;
figure
sz=25;
scatter(GAGusty(goodGust), GASL1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line23 = fitlm(GAGusty(goodGust), GASL1(goodGust));
plot(lin_reg_line23)
xlabel("Wind Gust (knots)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_WindGust.png')

%Wave Height
GAWave = GAWind_SL(:,4);
GAWavey = table2array(GAWave);
goodWaves = GAWavey(:,1)~=99;
figure
sz=25;
scatter(GAWavey(goodWaves), GASL1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line24 = fitlm(GAWavey(goodWaves), GASL1(goodWaves));
plot(lin_reg_line24)
xlabel("Wave Height (m)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_WaveHeight.png')

%Atmospheric Pressure
GAPress = GAWind_SL(:,8);
GAPressure = table2array(GAPress);
goodPressure = GAPressure(:,1)~=99;
figure
sz=25;
scatter(GAPressure(goodPressure), GASL1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line25 = fitlm(GAPressure(goodPressure), GASL1(goodPressure));
plot(lin_reg_line25)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_AtmosphericPressure.png')

%Atmospheric Temperature
GATemp = GAWind_SL(:,9);
GATemperature = table2array(GATemp);
goodTemp = GATemperature(:,1)~=999;
figure
sz=25;
scatter(GATemperature(goodTemp), GASL1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line26 = fitlm(GATemperature(goodTemp), GASL1(goodTemp));
plot(lin_reg_line26)
xlabel("Atmospheric Temperature (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_AtmosphericTemperature.png')

%Water Temperature
GAWTemp = GAWind_SL(:,10);
GAWTemperature = table2array(GAWTemp);
goodWTemp = GAWTemperature(:,1)~=999;
figure
sz=25;
scatter(GAWTemperature(goodWTemp), GASL1(goodWTemp), sz, "filled");
xlabel('Water Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line27 = fitlm(GAWTemperature(goodWTemp), GASL1(goodWTemp));
plot(lin_reg_line27)
xlabel("Water Temperature (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_WaterTemperature.png')

%Dew Point
GADP = GAWind_SL(:,11);
GADewPoint = table2array(GADP);
goodWTemp = GADewPoint(:,1)~=999;
figure
sz=25;
scatter(GADewPoint(goodWTemp), GASL1(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line33 = fitlm(GADewPoint(goodWTemp), GASL1(goodWTemp));
plot(lin_reg_line33)
xlabel("Dew Point (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_DewPoint.png')


%concatonate GA SOG's
GASOG = cat(1, AIS_GA02(:,4),AIS_GA01(:,4));
GASOG1 = cell2mat(GASOG);

%plotting
%wind direction
GADir = GAWind_SL(:,1);
GADirection = table2array(SLDir);
goodDirection = GADirection(:,1)~=999;
figure
sz=25;
scatter(GADirection(goodDirection), GASOG1(goodDirection), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line28 = fitlm(GADirection(goodDirection), GASOG1(goodDirection));
plot(lin_reg_line28)
xlabel("Wind Direction (Degrees)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_WindDirection.png')

%Wind speed
GAWind = GAWind_SL(:,2);
GAWindy = table2array(GAWind);
goodWind = GAWindy(:,1)~=99;
figure
sz=25;
scatter(GAWindy(goodWind), GASOG1(goodWind), sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line29 = fitlm(GAWindy(goodWind), GASOG1(goodWind));
plot(lin_reg_line29)
xlabel("Wind Speed (knots)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_Wind.png')

%Wind gust
GAGust = GAWind_SL(:,3);
GAGusty = table2array(GAGust);
goodGust = GAGusty(:,1)~=99;
figure
sz=25;
scatter(GAGusty(goodGust), GASOG1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line30 = fitlm(GAGusty(goodGust), GASOG1(goodGust));
plot(lin_reg_line30)
xlabel("Wind Gust (knots)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_WindGust.png')

%Wave Height
GAWave = GAWind_SL(:,4);
GAWavey = table2array(GAWave);
goodWaves = GAWavey(:,1)~=99;
figure
sz=25;
scatter(GAWavey(goodWaves), GASOG1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line30 = fitlm(GAWavey(goodWaves), GASOG1(goodWaves));
plot(lin_reg_line30)
xlabel("Wave Height (m)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_WaveHeight.png')

%Atmospheric Pressure
GAPress = GAWind_SL(:,8);
GAPressure = table2array(GAPress);
goodPressure = GAPressure(:,1)~=9999;
figure
sz=25;
scatter(GAPressure(goodPressure), GASOG1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line31 = fitlm(GAPressure(goodPressure), GASOG1(goodPressure));
plot(lin_reg_line31)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_AtmosphericPressure.png')

%Atmospheric Temperature
GATemp = GAWind_SL(:,9);
GATemperature = table2array(GATemp);
goodTemp = GATemperature(:,1)~=999;
figure
sz=25;
scatter(GATemperature(goodTemp), GASOG1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line32 = fitlm(GATemperature(goodTemp), GASOG1(goodTemp));
plot(lin_reg_line32)
xlabel("Atmospheric Temperature (C)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_AtmosphericTemperature.png')

%Water Temperature
GAWTemp = GAWind_SL(:,10);
GAWTemperature = table2array(GAWTemp);
goodWTemp = GAWTemperature(:,1)~=999;
figure
sz=25;
scatter(GAWTemperature(goodWTemp), GASOG1(goodWTemp), sz, "filled");
xlabel('Water Temperature (C)')
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
hold on
lin_reg_line27 = fitlm(GAWTemperature(goodWTemp), GASOG1(goodWTemp));
plot(lin_reg_line27)
xlabel("Water Temperature (C)")
ylabel("Source Level (dB re 1 µPa^2/Hz @ 1m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_WaterTemperature.png')

%Dew Point
GADP = GAWind_SL(:,11);
GADewPoint = table2array(GADP);
goodWTemp = GADewPoint(:,1)~=999;
figure
sz=25;
scatter(GADewPoint(goodWTemp), GASOG1(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Speed Over Ground (knots)")
hold on
lin_reg_line33 = fitlm(GADewPoint(goodWTemp), GASOG1(goodWTemp));
plot(lin_reg_line33)
xlabel("Dew Point (C)")
ylabel("Speed Over Ground (knots)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_SOG_DewPoint.png')



%concatonate GA DRAFTS's
GADrafts = cat(1, AIS_GA02(:,3),AIS_GA01(:,3));
GADrafts1 = cell2mat(GADrafts);

%plotting
%wind direction
GADir = GAWind_SL(:,1);
GADirection = table2array(GADir);
goodDirection = GADirection(:,1)~=999;
figure
sz=25;
scatter(GADirection(goodDirection), GADrafts1(goodDirection), sz, "filled");
xlabel("Wind Direction (Degrees)")
ylabel("Draft (m)")
hold on
lin_reg_line34 = fitlm(GADirection(goodDirection), GADrafts1(goodDirection));
plot(lin_reg_line34)
xlabel("Wind Direction (Degrees)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_WindDirection.png')

Wind speed
GAWind = GAWind_SL(:,2);
GAWindy = table2array(GAWind);
goodWind = GAWindy(:,1)~=99;
figure
sz=25;
scatter(GAWindy(goodWind), GADrafts1(goodWind), sz, "filled");
xlabel("Wind Speed (knots)")
ylabel("Draft (m)")
hold on
lin_reg_line35 = fitlm(GAWindy(goodWind), GADrafts1(goodWind));
plot(lin_reg_line35)
xlabel("Wind Speed (knots)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_Wind.png')

%Wind gust
GAGust = GAWind_SL(:,3);
GAGusty = table2array(GAGust);
goodGust = GAGusty(:,1)~=99;
figure
sz=25;
scatter(GAGusty(goodGust), GADrafts1(goodGust), sz, "filled");
xlabel("Wind Gust (knots)")
ylabel("Draft (m)")
hold on
lin_reg_line36 = fitlm(GAGusty(goodGust), GADrafts1(goodGust));
plot(lin_reg_line36)
xlabel("Wind Gust (knots)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_WindGust.png')

%Wave Height
GAWave = GAWind_SL(:,4);
GAWavey = table2array(GAWave);
goodWaves = GAWavey(:,1)~=99;
figure
sz=25;
scatter(GAWavey(goodWaves), GADrafts1(goodWaves), sz, "filled");
xlabel("Wave Height (m)")
ylabel("Draft (m)")
hold on
lin_reg_line37 = fitlm(GAWavey(goodWaves), GADrafts1(goodWaves));
plot(lin_reg_line37)
xlabel("Wave Height (m)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_WaveHeight.png')

%Atmospheric Pressure
GAPress = GAWind_SL(:,8);
GAPressure = table2array(GAPress);
goodPressure = GAPressure(:,1)~=9999;
figure
sz=25;
scatter(GAPressure(goodPressure), GADrafts1(goodPressure), sz, "filled");
xlabel('Atmospheric Pressure (hPa)')
ylabel("Draft (m)")
hold on
lin_reg_line38 = fitlm(GAPressure(goodPressure), GADrafts1(goodPressure));
plot(lin_reg_line38)
xlabel("Atmospheric Pressure (hPa)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_AtmosphericPressure.png')

%Atmospheric Temperature
GATemp = GAWind_SL(:,9);
GATemperature = table2array(GATemp);
goodTemp = GATemperature(:,1)~=999;
figure
sz=25;
scatter(GATemperature(goodTemp), GADrafts1(goodTemp), sz, "filled");
xlabel('Atmospheric Temperature (C)')
ylabel("Draft (m)")
hold on
lin_reg_line39 = fitlm(GATemperature(goodTemp), GADrafts1(goodTemp));
plot(lin_reg_line39)
xlabel("Atmospheric Temperature (C)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_AtmosphericTemperature.png')

%Water Temperature
GAWTemp = GAWind_SL(:,10);
GAWTemperature = table2array(GAWTemp);
goodWTemp = GAWTemperature(:,1)~=999;
figure
sz=25;
scatter(GAWTemperature(goodWTemp), GADrafts1(goodWTemp), sz, "filled");
xlabel('Water Temperature (C)')
ylabel("Draft (m)")
hold on
lin_reg_line40 = fitlm(GAWTemperature(goodWTemp), GADrafts1(goodWTemp));
plot(lin_reg_line40)
xlabel("Water Temperature (C)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_WaterTemperature.png')

%Dew Point
GADP = GAWind_SL(:,11);
GADewPoint = table2array(GADP);
goodWTemp = GADewPoint(:,1)~=999;
figure
sz=25;
scatter(GADewPoint(goodWTemp), GADrafts1(goodWTemp), sz, "filled");
xlabel('Dew Point (C)')
ylabel("Draft (m)")
hold on
lin_reg_line41 = fitlm(GADewPoint(goodWTemp), GADrafts1(goodWTemp));
plot(lin_reg_line41)
xlabel("Dew Point (C)")
ylabel("Draft (m)")
title('')
saveas(gcf,'/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/MATLAB_Saved/Weather_vs_SL/GA_Draft_DewPoint.png')





