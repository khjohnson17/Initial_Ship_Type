%Katrina Johnson
%November 3, 2022
%Initial tests based on ship type
%Ship type (cargo, tanker, etc.) vs other metrics (length, draft, SOG)


%%Initializing Data
clearvars;
addpath('/Users/katrina/Documents/MATLAB/Triton-master');
triton;

%%Load Data
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/GOM_SL_SPL_RNL_MSL.mat');
date_fmt = 'mm/dd/yyyy HH:MM:SS';
%Load excel
% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 11);
% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:K599";
% Specify column names and types
opts.VariableNames = ["General", "Lengthm", "Draftm", "SOGknots", "SLLM_thirsoctave", "Name", "AIS", "Type", "YearBuilt", "YearsOld", "FlagCountry"];
opts.VariableTypes = ["char", "char", "char", "char", "char", "char", "char", "char", "char", "char", "char"];
% Specify variable properties
opts = setvaropts(opts, ["General", "Lengthm", "Draftm", "SOGknots", "SLLM_thirsoctave", "Name", "AIS", "Type", "YearBuilt", "YearsOld", "FlagCountry"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["General", "Lengthm", "Draftm", "SOGknots", "SLLM_thirsoctave", "Name", "AIS", "Type", "YearBuilt", "YearsOld", "FlagCountry"], "EmptyFieldRule", "auto");
% Import the data
AISMetrics1 = readtable("/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/AIS_Metrics.xlsx", opts, "UseExcel", false);
% Convert to output type
AISMetrics1 = table2cell(AISMetrics1);
numIdx = cellfun(@(x) ~isnan(str2double(x)), AISMetrics1);
AISMetrics1(numIdx) = cellfun(@(x) {str2double(x)}, AISMetrics1(numIdx));
% Clear temporary variables
clear opts

%Overall
%Length
figure
histogram(AIS_length,'BinWidth',25,'FaceColor','k')
xlabel('Ship Length (m)')
ylabel('Frequency')
mean(AIS_length,'omitnan') %183.4013 m 
std(AIS_length,'omitnan') %55.3182 m
%Draft
figure
histogram(AIS_draft,'BinWidth',1,'FaceColor','k')
xlabel('Ship Draft (m)')
ylabel('Frequency')
mean(AIS_draft) %10.7978 m
std(AIS_draft) %2.5361 m
%SOG
figure
histogram(AIS_SOG,'BinWidth',1,'FaceColor','k')
xlabel('Ship Speed Over Ground (knots)')
ylabel('Frequency')
mean(AIS_SOG,'omitnan') %11.9357 knots
std(AIS_SOG,'omitnan') %2.1631 knots

%random cargoLengths(cellfun(@ischar,cargoLengths)) = {nan};
%%Cargo metrics
%length
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); %<- This will make a vector of 0s and 1s, where 1s indicate rows where the string matches "Cargo"
cargoLengths = AIS_metrics(cargoIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
CargoLengthsDouble = cell2mat(cargoLengths); %cell -> double
mean(CargoLengthsDouble,'omitnan') % 198.1006 m
std(CargoLengthsDouble,'omitnan') % 42.5811 m
%plot length
figure
histogram(CargoLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Cargo Length (m)')
ylabel('Frequency')

%draft
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); %<- This will make a vector of 0s and 1s, where 1s indicate rows where the string matches "Cargo"
cargoDrafts = AIS_metrics(cargoIdx,3); % <- this selects all of the rows that matched cargo and gives you the draft.
CargoDraftsDouble = cell2mat(cargoDrafts); %cell -> double
mean(CargoDraftsDouble) % 11.3900 m
std(CargoDraftsDouble) %2.4600 m
%plot length
figure
histogram(CargoDraftsDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Cargo Draft (m)')
ylabel('Frequency')

%SOG
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); %<- This will make a vector of 0s and 1s, where 1s indicate rows where the string matches "Cargo"
cargoSOG = AIS_metrics(cargoIdx,4); % <- this selects all of the rows (in column 4) that matched cargo and gives you the SOG.
CargoSOGDouble = cell2mat(cargoSOG); %cell -> double
mean(CargoSOGDouble) % 12.1455 knots
std(CargoSOGDouble) %2.1068 knots
%plot length
figure
histogram(CargoSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Cargo Speed Over Ground (knots)')
ylabel('Frequency')

%SLLM
cargoIdx = strcmp(AISMetrics1(:,1),'Cargo'); 
cargoSLLM = AISMetrics1(cargoIdx,5); 
cargoSLLMDouble = cell2mat(cargoSLLM);
mean(cargoSLLMDouble) % 163.2638
std(cargoSLLMDouble) %6.0372
%plot length
figure
histogram(cargoSLLMDouble,'BinEdges', [140, 180], 'BinWidth',1,'FaceColor','k')
histogram(cargoSLLMDouble,'BinEdges', [140, 180], 'FaceColor','k')
xlabel('Cargo SLLM')
ylabel('Frequency')


%%Tanker metrics
%length
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
tankerLengths = AIS_metrics(tankerIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
tankerLengthsDouble = cell2mat(tankerLengths); %cell -> double
mean(tankerLengthsDouble,'omitnan') % 184.6500 m
std(tankerLengthsDouble,'omitnan') % 37.6519 m
%plot length
figure
histogram(tankerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Tanker Length (m)')
ylabel('Frequency')

%draft
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
tankerDraft = AIS_metrics(tankerIdx,3); % <- this selects all of the rows that matched cargo and gives you the lengths.
tankerDraftDouble = cell2mat(tankerDraft); %cell -> double
mean(tankerDraftDouble) % 11.2807 m
std(tankerDraftDouble) % 2.3843 m
%plot length
figure
histogram(tankerDraftDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker Draft (m)')
ylabel('Frequency')

%SOG
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
tankerSOG = AIS_metrics(tankerIdx,4); % <- this selects all of the rows that matched cargo and gives you the lengths.
tankerSOGDouble = cell2mat(tankerSOG); %cell -> double
mean(tankerSOGDouble) % 12.4097 knots
std(tankerSOGDouble) %1.9243 knots
%plot length
figure
histogram(tankerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker Speed Over Ground (knots)')
ylabel('Frequency')

%SLLM
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLM = AIS_metrics(tankerIdx,5); 
tankerSLLMDouble = cell2mat(tankerSLLM);
mean(tankerSLLMDouble) % 161.5755
std(tankerSLLMDouble) %6.8893
%plot length
figure
histogram(tankerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker SLLM')
ylabel('Frequency')

%%T-test
[h,p,ci,stats] = ttest2(CargoLengthsDouble, tankerLengthsDouble) % h = 1; p = 5.4928e-04; tstat = 3.4823; df = 420
[h,p,ci,stats] = ttest2(CargoDraftsDouble,tankerDraftDouble) % h = 0; p = 0.6572; tstat = 0.4441; df = 444
[h,p,ci,stats] = ttest2(CargoSOGDouble,tankerSOGDouble) % h = 0; p = 0.2030; tstat = -1.2750; df = 444
[h,p,ci,stats] = ttest2(CargoSLLMDouble,tankerSLLMDouble) % h = 1; p = 0.0086; tstat = 2.6399; df = 444

%%Tug Tow metrics
%length
tugtowIdx = strcmp(AIS_metrics(:,1),'Tug_tow'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
tugtowLengths = AIS_metrics(tugtowIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
tugtowLengthsDouble = cell2mat(tugtowLengths); %cell -> double
mean(tugtowLengthsDouble,'omitnan') % 38.5000 m
std(tugtowLengthsDouble,'omitnan') % 4.5644 m
%plot length
figure
histogram(tugtowLengthsDouble,'BinWidth',5,'FaceColor','k')
xlabel('Tug Tow Length (m)')
ylabel('Frequency')
xlim([10 300])
%draft
tugtowIdx = strcmp(AIS_metrics(:,1),'Tug_tow'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
tugtowDraft = AIS_metrics(tugtowIdx,3); % <- this selects all of the rows that matched cargo and gives you the lengths.
tugtowDraftDouble = cell2mat(tugtowDraft); %cell -> double
mean(tugtowDraftDouble) % 5.6864 m
std(tugtowDraftDouble) % 1.9691 m
%plot draft
figure
histogram(tugtowDraftDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tug Tow Draft (m)')
ylabel('Frequency')
xlim([1 12])
%SOG
tugtowIdx = strcmp(AIS_metrics(:,1),'Tug_tow'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
tugtowSOG = AIS_metrics(tugtowIdx,4); % <- this selects all of the rows that matched cargo and gives you the lengths.
tugtowSOGDouble = cell2mat(tugtowSOG); %cell -> double
mean(tugtowSOGDouble) % 10.3182 knots
std(tugtowSOGDouble) %1.5774 knots
%plot SOG
figure
histogram(tugtowSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tug Tow Speed Over Ground (knots)')
ylabel('Frequency')
xlim([5 21])

%%Passenger metrics
%length
passengerIdx = strcmp(AIS_metrics(:,1),'Passenger'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
passengerLengths = AIS_metrics(passengerIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
passengerLengthsDouble = cell2mat(passengerLengths); %cell -> double
mean(passengerLengthsDouble,'omitnan') % 56.3333 m
std(passengerLengthsDouble,'omitnan') % 2.8868 m
%plot length
figure
histogram(passengerLengthsDouble,'BinWidth',5,'FaceColor','k')
xlabel('Passenger Length (m)')
ylabel('Frequency')
xlim([10 300])
%draft
passengerIdx = strcmp(AIS_metrics(:,1),'Passenger'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
passengerDraft = AIS_metrics(passengerIdx,3); % <- this selects all of the rows that matched cargo and gives you the lengths.
passengerDraftDouble = cell2mat(passengerDraft); %cell -> double
mean(passengerDraftDouble) % 2.3000 m
std(passengerDraftDouble) % 0 m
%plot draft
figure
histogram(passengerDraftDouble,'BinWidth',1,'FaceColor','k')
xlabel('Passenger Draft (m)')
ylabel('Frequency')
xlim([1 12])
%SOG
passengerIdx = strcmp(AIS_metrics(:,1),'Passenger'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
passengerSOG = AIS_metrics(passengerIdx,4); % <- this selects all of the rows that matched cargo and gives you the lengths.
passengerSOGDouble = cell2mat(passengerSOG); %cell -> double
mean(passengerSOGDouble) % 18.7667 knots
std(passengerSOGDouble) %0.8083 knots
%plot SOG
figure
histogram(passengerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Passenger Speed Over Ground (knots)')
ylabel('Frequency')
xlim([5 21])

%%Fishing metrics
%length
fishingIdx = strcmp(AIS_metrics(:,1),'Fishing'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
fishingLengths = AIS_metrics(fishingIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
fishingLengthsDouble = cell2mat(fishingLengths); %cell -> double
mean(fishingLengthsDouble,'omitnan') % 15 m
std(fishingLengthsDouble,'omitnan') % 0 m
%plot length
figure
histogram(fishingLengthsDouble,'BinWidth',5,'FaceColor','k')
xlabel('Fishing Length (m)')
ylabel('Frequency')
xlim([10 300])
%draft
fishingIdx = strcmp(AIS_metrics(:,1),'Fishing'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
fishingDraft = AIS_metrics(fishingIdx,3); % <- this selects all of the rows that matched cargo and gives you the lengths.
fishingDraftDouble = cell2mat(fishingDraft); %cell -> double
mean(fishingDraftDouble) % 10.3000 m
std(fishingDraftDouble) % 0 m
%plot draft
figure
histogram(fishingDraftDouble,'BinWidth',1,'FaceColor','k')
xlabel('Fishing Draft (m)')
ylabel('Frequency')
xlim([1 12])
%SOG
fishingIdx = strcmp(AIS_metrics(:,1),'Fishing'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
fishingSOG = AIS_metrics(fishingIdx,4); % <- this selects all of the rows that matched cargo and gives you the lengths.
fishingSOGDouble = cell2mat(fishingSOG); %cell -> double
mean(fishingSOGDouble) % 6.3000 knots
std(fishingSOGDouble) %0 knots
%plot SOG
figure
histogram(fishingSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Fishing Speed Over Ground (knots)')
ylabel('Frequency')
xlim([5 21])

%%Other metrics
%length
otherIdx = strcmp(AIS_metrics(:,1),'Other'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
otherLengths = AIS_metrics(otherIdx,2); % <- this selects all of the rows that matched cargo and gives you the lengths.
otherLengthsDouble = cell2mat(otherLengths); %cell -> double
mean(otherLengthsDouble,'omitnan') % 103.8571 m
std(otherLengthsDouble,'omitnan') % 83.5931 m
%plot length
figure
histogram(otherLengthsDouble,'BinWidth',5,'FaceColor','k')
xlabel('Other Length (m)')
ylabel('Frequency')
xlim([10 300])
%draft
otherIdx = strcmp(AIS_metrics(:,1),'Other'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
otherDraft = AIS_metrics(otherIdx,3); % <- this selects all of the rows that matched cargo and gives you the lengths.
otherDraftDouble = cell2mat(otherDraft); %cell -> double
mean(otherDraftDouble) % 6.8875 m
std(otherDraftDouble) % 3.1302 m
%plot draft
figure
histogram(otherDraftDouble,'BinWidth',1,'FaceColor','k')
xlabel('Other Draft (m)')
ylabel('Frequency')
xlim([1 12])
%SOG
otherIdx = strcmp(AIS_metrics(:,1),'Other'); %<- This will make a vector of 0s and 1s, where 0s indicate rows where the string matches "Tanker"
otherSOG = AIS_metrics(otherIdx,4); % <- this selects all of the rows that matched cargo and gives you the lengths.
otherSOGDouble = cell2mat(otherSOG); %cell -> double
mean(otherSOGDouble) % 10.6750 knots
std(otherSOGDouble) %2.7567 knots
%plot SOG
figure
histogram(otherSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Other Speed Over Ground (knots)')
ylabel('Frequency')
xlim([5 21])

%%Scatterplots using 11th column of SLLM_thirdoctave - 50 Hz
%Overall vs length
s = SLLM_thirdoctave(:,11);
l = AIS_length;
figure
scatter(s, l, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Ship Length (m)")
lin_reg_line = fitlm(s,l);
figure
plot(lin_ref_line)

%Overall vs draft
s = SLLM_thirdoctave(:,11);
d = AIS_draft;
figure
scatter(s, d, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Ship Draft (m)")
lin_reg_line1 = fitlm(s,d);
figure
plot(lin_reg_line1)

%Overall vs SOG
s = SLLM_thirdoctave(:,11);
SOG = AIS_SOG;
figure
scatter(s, SOG, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Ship Speed Over Ground (knots)")
lin_reg_line2 = fitlm(s,SOG);
figure
plot(lin_reg_line2)

%Cargo SLLM_thirdoctave vs Length
%cargo SLLM
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLM = AIS_metrics(cargoIdx,5); 
cargoSLLMDouble = cell2mat(cargoSLLM);
mean(CargoSLLMDouble) % 163.2638
std(CargoSLLMDouble) %6.0372 m
%cargo length
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLMLengths = AIS_metrics(cargoIdx,2); 
cargoSLLMLengthsDouble = cell2mat(cargoSLLMLengths); 
%scatter
s = CargoSLLMDouble;
cl = cargoSLLMLengthsDouble;
figure
scatter(s, cl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo Length (m)")
lin_reg_line4 = fitlm(s,cl);
figure
plot(lin_reg_line4)

%Cargo SLLM_thirdoctave vs Draft
%cargo SLLM
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLM = AIS_metrics(cargoIdx,5); 
cargoSLLMDouble = cell2mat(cargoSLLM);
mean(CargoSLLMDouble) % 163.2638
std(CargoSLLMDouble) %6.0372 m
%cargo draft
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLMDraft = AIS_metrics(cargoIdx,3); 
cargoSLLMDraftDouble = cell2mat(cargoSLLMDraft); 
%scatter
s = CargoSLLMDouble;
cd = cargoSLLMDraftDouble;
figure
scatter(s, cd, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo Draft (m)")
lin_reg_line5 = fitlm(s,cd);
figure
plot(lin_reg_line5)
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo Draft (m)")

%Cargo SLLM_thirdoctave vs SOG
%cargo SLLM
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLM = AIS_metrics(cargoIdx,5); 
cargoSLLMDouble = cell2mat(cargoSLLM);
mean(CargoSLLMDouble) % 163.2638
std(CargoSLLMDouble) %6.0372 m
%cargo SOG
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLMSOG = AIS_metrics(cargoIdx,4); 
cargoSLLMSOGDouble = cell2mat(cargoSLLMSOG); 
%scatter
s = CargoSLLMDouble;
cs = cargoSLLMSOGDouble;
figure
scatter(s, cs, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo SOG (knots)")
lin_reg_line6 = fitlm(s,cs);
figure
plot(lin_reg_line6)
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo SOG (knots)")

%Cargo SLLM_thirdoctave vs age
%cargo SLLM
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLM = AIS_metrics(cargoIdx,5); 
cargoSLLMDouble = cell2mat(cargoSLLM);
mean(CargoSLLMDouble) % 163.2638
std(CargoSLLMDouble) %6.0372 m
%cargo SOG
cargoIdx = strcmp(AIS_metrics(:,1),'Cargo'); 
cargoSLLMage = AIS_metrics(cargoIdx,10); 
cargoSLLMageDouble = cell2mat(cargoSLLMage); 
%scatter
s = CargoSLLMDouble;
cs = cargoSLLMSOGDouble;
figure
scatter(s, cs, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo SOG (knots)")
lin_reg_line6 = fitlm(s,cs);
figure
plot(lin_reg_line6)
xlabel("1/3 octave Monopole Source Level")
ylabel("Cargo SOG (knots)")

%Tanker SLLM_thirdoctave vs Length
%Tanker SLLM
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLM = AIS_metrics(tankerIdx,5); 
tankerSLLMDouble = cell2mat(tankerSLLM);
mean(tankerSLLMDouble) % 161.5755
std(tankerSLLMDouble) %6.8893 m
%tankerr length
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLMlength = AIS_metrics(tankerIdx,2); 
tankerSLLMlengthDouble = cell2mat(tankerSLLMlength); 
%scatter
t = tankerSLLMDouble;
tl = tankerSLLMlengthDouble;
figure
scatter(t, tl, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Tanker Length (m)")
lin_reg_line7 = fitlm(t,tl);
figure
plot(lin_reg_line7)
xlabel("1/3 octave Monopole Source Level")
ylabel("Tanker Length (m)")

%Tanker SLLM_thirdoctave vs Draft
%Tanker SLLM
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLM = AIS_metrics(tankerIdx,5); 
tankerSLLMDouble = cell2mat(tankerSLLM);
mean(tankerSLLMDouble) % 161.5755
std(tankerSLLMDouble) %6.8893 m
%tanker draft
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLMdraft = AIS_metrics(tankerIdx,3); 
tankerSLLMdraftDouble = cell2mat(tankerSLLMdraft); 
%scatter
t = tankerSLLMDouble;
td = tankerSLLMdraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Tanker Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Tanker Draft (m)")

%Tanker SLLM_thirdoctave vs SOG
%Tanker SLLM
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLM = AIS_metrics(tankerIdx,5); 
tankerSLLMDouble = cell2mat(tankerSLLM);
mean(tankerSLLMDouble) % 161.5755
std(tankerSLLMDouble) %6.8893 m
%tankerr SOG
tankerIdx = strcmp(AIS_metrics(:,1),'Tanker'); 
tankerSLLMSOG = AIS_metrics(tankerIdx,4); 
tankerSLLMSOGDouble = cell2mat(tankerSLLMSOG); 
%scatter
t = tankerSLLMDouble;
ts = tankerSLLMSOGDouble;
figure
scatter(t, ts, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Tanker SOG (knots)")
lin_reg_line9 = fitlm(t,ts);
figure
plot(lin_reg_line9)
xlabel("1/3 octave Monopole Source Level")
ylabel("Tanker SOG (knots)")

%%Ship Age
%Load Data
% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 8);
% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:H599";
% Specify column names and types
opts.VariableNames = ["Number", "Name", "Type", "General", "YearBuilt", "YearsOld", "Country", "VarName8"];
opts.VariableTypes = ["char", "char", "char", "char", "char", "char", "char", "char"];
% Specify variable properties
opts = setvaropts(opts, ["Number", "Name", "Type", "General", "YearBuilt", "YearsOld", "Country", "VarName8"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Number", "Name", "Type", "General", "YearBuilt", "YearsOld", "Country", "VarName8"], "EmptyFieldRule", "auto");
% Import the data
ShipTypes = readtable("/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Types.xlsx", opts, "UseExcel", false);
% Convert to output type
ShipTypes = table2cell(ShipTypes);
numIdx = cellfun(@(x) ~isnan(str2double(x)), ShipTypes);
ShipTypes(numIdx) = cellfun(@(x) {str2double(x)}, ShipTypes(numIdx));
% Clear temporary variables
clear opts

%Getting cargo vs age
cargoageIdx = strcmp(ShipTypes(:,1),'Cargo');
cargoage = ShipTypes(cargoageIdx,6);
CargoageDouble = cell2mat(cargoage);
mean(CargoageDouble,'omitnan') % 9.8859 years
std(CargoageDouble,'omitnan') % 6.5154 years
figure
histogram(CargoageDouble,'BinWidth',3,'FaceColor','k')
xlabel('Cargo Age')
ylabel('Frequency')

%Getting tanker vs age
tankerageIdx = strcmp(ShipTypes(:,1),'Tanker');
tankerage = ShipTypes(tankerageIdx,6);
tankerageDouble = cell2mat(tankerage);
mean(tankerageDouble,'omitnan') % 10.2892
std(tankerageDouble,'omitnan') % 5.4473
figure
histogram(tankerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Tanker Age')
ylabel('Frequency')

[h,p,ci,stats] = ttest2(CargoageDouble, tankerageDouble) % h = 0; p = 0.4926; tstat = -0.6867; df = 497

%%Specific ship type
%LPG tanker
%length
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerLengths = AISMetrics1(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths); %cell -> double
mean(LPGtankerLengthsDouble,'omitnan') % 138.2143 m
std(LPGtankerLengthsDouble,'omitnan') % 33.3909 m
%plot length
figure
histogram(LPGtankerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('LPG Tanker Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSLLM = AISMetrics1(LPGtankerIdx,5);
LPGtankerSLLMDouble = cell2mat(LPGtankerSLLM);
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerLengths = AISMetrics1(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
%scatter
t = LPGtankerSLLMDouble;
td = LPGtankerLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Length (m)")

%draft
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerDraft = AISMetrics1(LPGtankerIdx,3);
LPGtankerDraftDouble = cell2mat(LPGtankerDraft); %cell -> double
mean(LPGtankerDraftDouble,'omitnan') % 8.1000 m
std(LPGtankerDraftDouble,'omitnan') % 1.9911 m
%plot draft
figure
histogram(LPGtankerDraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('LPG Tanker Draft (m)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSLLM = AISMetrics1(LPGtankerIdx,5);
LPGtankerSLLMDouble = cell2mat(LPGtankerSLLM);
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerDraft = AISMetrics1(LPGtankerIdx,3);
LPGtankerDraftDouble = cell2mat(LPGtankerDraft);
%scatter
t = LPGtankerSLLMDouble;
td = LPGtankerDraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Draft (m)")

%SOG
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSOG = AISMetrics1(LPGtankerIdx,4);
LPGtankerSOGDouble = cell2mat(LPGtankerSOG); %cell -> double
mean(LPGtankerSOGDouble,'omitnan') % 14.3400 knots
std(LPGtankerSOGDouble,'omitnan') % 1.0063 knots
%plot SOG
figure
histogram(LPGtankerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('LPG Tanker Speed Over Ground (knots)')
ylabel('Frequency')
%Scatter plot SLLM vs SOG
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSLLM = AISMetrics1(LPGtankerIdx,5);
LPGtankerSLLMDouble = cell2mat(LPGtankerSLLM);
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSOG = AISMetrics1(LPGtankerIdx,4);
LPGtankerSOGDouble = cell2mat(LPGtankerSOG); 
%scatter
t = LPGtankerSLLMDouble;
td = LPGtankerSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker SOG (knots)")

%SLLM
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSLLM = AISMetrics1(LPGtankerIdx,5);
LPGtankerSLLMDouble = cell2mat(LPGtankerSLLM); %cell -> double
mean(LPGtankerSLLMDouble,'omitnan') % 164.1076
std(LPGtankerSLLMDouble,'omitnan') % 5.5952
%plot SLLM
figure
histogram(LPGtankerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('LPG Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerage = AISMetrics1(LPGtankerIdx,10);
LPGtankerageDouble = cell2mat(LPGtankerage); %cell -> double
mean(LPGtankerageDouble,'omitnan') % 10.6667 years
std(LPGtankerageDouble,'omitnan') % 4.6394 years
%plot age
figure
histogram(LPGtankerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('LPG Tanker Age (years)')
ylabel('Frequency')
%Scatter plot SLLM vs age
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerSLLM = AISMetrics1(LPGtankerIdx,5);
LPGtankerSLLMDouble = cell2mat(LPGtankerSLLM);
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerage = AISMetrics1(LPGtankerIdx,10);
LPGtankerageDouble = cell2mat(LPGtankerage);
%scatter
t = LPGtankerSLLMDouble;
td = LPGtankerageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("LPG Tanker Age (years)")

%Scatter plot length vs age
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerage = AISMetrics1(LPGtankerIdx,10);
LPGtankerageDouble = cell2mat(LPGtankerage);
LPGtankerIdx = strcmp(AISMetrics1(:,8),'LPG Tanker'); 
LPGtankerLengths = AISMetrics1(LPGtankerIdx,2);
LPGtankerLengthsDouble = cell2mat(LPGtankerLengths);
%scatter
t = LPGtankerLengthsDouble;
td = LPGtankerageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("LPG Tanker Length (m)")
ylabel("LPG Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("LPG Tanker Length (m)")
ylabel("LPG Tanker Age (years)")


%General Cargo Ship
%length
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoLengths = AISMetrics1(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths); %cell -> double
mean(generalcargoLengthsDouble,'omitnan') % 158.4750 m
std(generalcargoLengthsDouble,'omitnan') % 27.0403 m
%plot length
figure
histogram(generalcargoLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('General Cargo Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSLLM = AISMetrics1(generalcargoIdx,5);
generalcargoSLLMDouble = cell2mat(generalcargoSLLM);
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoLengths = AISMetrics1(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
%scatter
t = generalcargoSLLMDouble;
td = generalcargoLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Length (m)")

%draft
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoDraft = AISMetrics1(generalcargoIdx,3);
generalcargoDraftDouble = cell2mat(generalcargoDraft); %cell -> double
mean(generalcargoDraftDouble,'omitnan') % 9.1550 m
std(generalcargoDraftDouble,'omitnan') % 1.6313 m
%plot draft
figure
histogram(generalcargoDraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('General Cargo Ship Draft (m)')
ylabel('Frequency')
%scatter SLLM vs draft
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSLLM = AISMetrics1(generalcargoIdx,5);
generalcargoSLLMDouble = cell2mat(generalcargoSLLM);
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoDraft = AISMetrics1(generalcargoIdx,3);
generalcargoDraftDouble = cell2mat(generalcargoDraft);
%scatter
t = generalcargoSLLMDouble;
td = generalcargoDraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Draft (m)")

%SOG
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSOG = AISMetrics1(generalcargoIdx,4);
% **** generalcargoSOGDouble = cell2mat(generalcargoSOG, 'omitnan'); %cell -> double
mean(generalcargoSOGDouble,'omitnan') % 158.4750 knots
std(generalcargoSOGDouble,'omitnan') % 27.0403 knots
%plot SOG
figure
histogram(generalcargoSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('General Cargo Ship Speed Over Ground (knots)')
ylabel('Frequency')
% ****scatter SLLM vs SOG
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSLLM = AISMetrics1(generalcargoIdx,5);
generalcargoSLLMDouble = cell2mat(generalcargoSLLM);
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSOG = AISMetrics1(generalcargoIdx,4);
% **** generalcargoSOGDouble = cell2mat(generalcargoSOG, 'omitnan');
%scatter
t = generalcargoSLLMDouble;
td = generalcargoSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship SOG (knots)")

%SLLM
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSLLM = AISMetrics1(generalcargoIdx,5);
generalcargoSLLMDouble = cell2mat(generalcargoSLLM); %cell -> double
mean(generalcargoSLLMDouble,'omitnan') % 161.9648
std(generalcargoSLLMDouble,'omitnan') % 6.6032
%plot SLLM
figure
histogram(generalcargoSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('General Cargo Ship SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoage = AISMetrics1(generalcargoIdx,10);
generalcargoageDouble = cell2mat(generalcargoage); %cell -> double
mean(generalcargoageDouble,'omitnan') % 12.8000 years
std(generalcargoageDouble,'omitnan') % 5.0950 years
%plot age
figure
histogram(generalcargoageDouble,'BinWidth',1,'FaceColor','k')
xlabel('General Cargo Ship Age (years)')
ylabel('Frequency')
%scatter SLLM vs age
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoSLLM = AISMetrics1(generalcargoIdx,5);
generalcargoSLLMDouble = cell2mat(generalcargoSLLM);
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoage = AISMetrics1(generalcargoIdx,10);
generalcargoageDouble = cell2mat(generalcargoage);
%scatter
t = generalcargoSLLMDouble;
td = generalcargoageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("General Cargo Ship Age (years)")

%Scatter plot length vs age
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoLengths = AISMetrics1(generalcargoIdx,2);
generalcargoLengthsDouble = cell2mat(generalcargoLengths);
generalcargoIdx = strcmp(AISMetrics1(:,8),'General Cargo Ship'); 
generalcargoage = AISMetrics1(generalcargoIdx,10);
generalcargoageDouble = cell2mat(generalcargoage);
%scatter
t = generalcargoLengthsDouble;
td = generalcargoageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("General Cargo Ship Length (m)")
ylabel("General Cargo Ship Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("General Cargo Ship Length (m)")
ylabel("General Cargo Ship Age (years)")


%Chemical/Oil Products Tanker
%length
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerLengths = AISMetrics1(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths); %cell -> double
mean(chemoitankerLengthsDouble,'omitnan') % 172.7455 m
std(chemoitankerLengthsDouble,'omitnan') % 17.4705 m
%plot length
figure
histogram(chemoitankerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Chemical/Oil Product Tanker Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSLLM = AISMetrics1(chemoiltankerIdx,5);
chemoitankerSLLMDouble = cell2mat(chemoitankerSLLM);
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerLengths = AISMetrics1(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
%scatter
t = chemoitankerSLLMDouble;
td = chemoitankerLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Length (m)")

%draft
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerdraft = AISMetrics1(chemoiltankerIdx,3);
chemoitankerdraftDouble = cell2mat(chemoitankerdraft); %cell -> double
mean(chemoitankerdraftDouble,'omitnan') % 10.5309 m
std(chemoitankerdraftDouble,'omitnan') % 1.8513 m
%plot draft
figure
histogram(chemoitankerdraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Chemical/Oil Tanker Draft (m)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSLLM = AISMetrics1(chemoiltankerIdx,5);
chemoitankerSLLMDouble = cell2mat(chemoitankerSLLM);
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerdraft = AISMetrics1(chemoiltankerIdx,3);
chemoitankerdraftDouble = cell2mat(chemoitankerdraft);
%scatter
t = chemoitankerSLLMDouble;
td = chemoitankerdraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Draft (m)")

%SOG
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSOG = AISMetrics1(chemoiltankerIdx,4);
chemoitankerSOGDouble = cell2mat(chemoitankerSOG); %cell -> double
mean(chemoitankerSOGDouble,'omitnan') % 172.7455 m
std(chemoitankerSOGDouble,'omitnan') % 17.4705 m
%plot SOG
figure
histogram(chemoitankerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Chemical/Oil Tanker Speed Over Ground (knots)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSLLM = AISMetrics1(chemoiltankerIdx,5);
chemoitankerSLLMDouble = cell2mat(chemoitankerSLLM);
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSOG = AISMetrics1(chemoiltankerIdx,4);
chemoitankerSOGDouble = cell2mat(chemoitankerSOG);
%scatter
t = chemoitankerSLLMDouble;
td = chemoitankerSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker SOG (knots)")

%SLLM
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSLLM = AISMetrics1(chemoiltankerIdx,5);
chemoitankerSLLMDouble = cell2mat(chemoitankerSLLM); %cell -> double
mean(chemoitankerSLLMDouble,'omitnan') % 160.7300
std(chemoitankerSLLMDouble,'omitnan') % 6.7554
%plot SLLM
figure
histogram(chemoitankerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Chemical/Oil Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerage = AISMetrics1(chemoiltankerIdx,10);
chemoitankerageDouble = cell2mat(chemoitankerage); %cell -> double
mean(chemoitankerageDouble,'omitnan') % 10.2727 years
std(chemoitankerageDouble,'omitnan') % 5.9846 years
%plot age
figure
histogram(chemoitankerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Chemical/Oil Tanker Age (years)')
ylabel('Frequency')
%Scatter plot SLLM vs age
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerSLLM = AISMetrics1(chemoiltankerIdx,5);
chemoitankerSLLMDouble = cell2mat(chemoitankerSLLM);
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerage = AISMetrics1(chemoiltankerIdx,10);
chemoitankerageDouble = cell2mat(chemoitankerage);
%scatter
t = chemoitankerSLLMDouble;
td = chemoitankerageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Chemical/Oil Products Tanker Age (years)")

%Scatter plot length vs age
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerLengths = AISMetrics1(chemoiltankerIdx,2);
chemoitankerLengthsDouble = cell2mat(chemoitankerLengths);
chemoiltankerIdx = strcmp(AISMetrics1(:,8),'Chemical/Oil Products Tanker'); 
chemoitankerage = AISMetrics1(chemoiltankerIdx,10);
chemoitankerageDouble = cell2mat(chemoitankerage);
%scatter
t = chemoitankerLengthsDouble;
td = chemoitankerageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("Chemical/Oil Products Tanker Length (m)")
ylabel("Chemical/Oil Products Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("Chemical/Oil Products Tanker Length (m)")
ylabel("Chemical/Oil Products Tanker Age (years)")


%Bulk Carrier
%length
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierLengths = AISMetrics1(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths); %cell -> double
mean(bulkcarrierLengthsDouble,'omitnan') % 206.1729 m
std(bulkcarrierLengthsDouble,'omitnan') % 26.0952 m
%plot length
figure
histogram(bulkcarrierLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Bulk Carrier Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSLLM = AISMetrics1(bulkcarrierIdx,5);
bulkcarrierSLLMDouble = cell2mat(bulkcarrierSLLM);
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierLengths = AISMetrics1(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
%scatter
t = bulkcarrierSLLMDouble;
td = bulkcarrierLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Length (m)")

%draft
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierdraft = AISMetrics1(bulkcarrierIdx,3);
bulkcarrierdraftDouble = cell2mat(bulkcarrierdraft); %cell -> double
mean(bulkcarrierdraftDouble,'omitnan') % 11.4015 m
std(bulkcarrierdraftDouble,'omitnan') % 2.2530 m
%plot draft
figure
histogram(bulkcarrierdraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Bulk Carrier Draft (m)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSLLM = AISMetrics1(bulkcarrierIdx,5);
bulkcarrierSLLMDouble = cell2mat(bulkcarrierSLLM);
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierdraft = AISMetrics1(bulkcarrierIdx,3);
bulkcarrierdraftDouble = cell2mat(bulkcarrierdraft);
%scatter
t = bulkcarrierSLLMDouble;
td = bulkcarrierdraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Draft (m)")

%SOG
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSOG = AISMetrics1(bulkcarrierIdx,4);
bulkcarrierSOG(cellfun(@ischar,bulkcarrierSOG)) = {nan};
bulkcarrierSOGDouble = cell2mat(bulkcarrierSOG); %cell -> double
mean(bulkcarrierSOGDouble,'omitnan') % 12.0987 knots
std(bulkcarrierSOGDouble,'omitnan') % 1.767 knots
%plot SOG
figure
histogram(bulkcarrierSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bulk Carrier Speed Over Ground (knots)')
ylabel('Frequency')
%Scatter plot SLLM vs SOG
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSLLM = AISMetrics1(bulkcarrierIdx,5);
bulkcarrierSLLMDouble = cell2mat(bulkcarrierSLLM);
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSOG = AISMetrics1(bulkcarrierIdx,4);
bulkcarrierSOGDouble = cell2mat(bulkcarrierSOG); 
%scatter
t = bulkcarrierSLLMDouble;
td = bulkcarrierSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier SOG (knots)")

%SLLM
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSLLM = AISMetrics1(bulkcarrierIdx,5);
bulkcarrierSLLMDouble = cell2mat(bulkcarrierSLLM); %cell -> double
mean(bulkcarrierSLLMDouble,'omitnan') % 161.5933
std(bulkcarrierSLLMDouble,'omitnan') % 5.9312
%plot SLLM
figure
histogram(bulkcarrierSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bulk Carrier SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierage = AISMetrics1(bulkcarrierIdx,10);
bulkcarrierageDouble = cell2mat(bulkcarrierage); %cell -> double
mean(bulkcarrierageDouble,'omitnan') % years
std(bulkcarrierageDouble,'omitnan') % years
%plot age
figure
histogram(bulkcarrierageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bulk Carrier Age (years)')
ylabel('Frequency')
%Scatter plot SLLM vs age
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierSLLM = AISMetrics1(bulkcarrierIdx,5);
bulkcarrierSLLMDouble = cell2mat(bulkcarrierSLLM);
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierage = AISMetrics1(bulkcarrierIdx,10);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
%scatter
t = bulkcarrierSLLMDouble;
td = bulkcarrierageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bulk Carrier Age (years)")

%Scatter plot length vs age
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierLengths = AISMetrics1(bulkcarrierIdx,2);
bulkcarrierLengthsDouble = cell2mat(bulkcarrierLengths);
bulkcarrierIdx = strcmp(AISMetrics1(:,8),'Bulk Carrier'); 
bulkcarrierage = AISMetrics1(bulkcarrierIdx,10);
bulkcarrierageDouble = cell2mat(bulkcarrierage);
%scatter
t = bulkcarrierLengthsDouble;
td = bulkcarrierageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("Bulk Carrier Length (m)")
ylabel("Bulk Carrier Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("Bulk Carrier Length (m)")
ylabel("Bulk Carrier Age (years)")


%Bitumen Tanker
%length
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenLengths = AISMetrics1(bitumenIdx,2);
bitumenLengthsDouble = cell2mat(bitumenLengths); %cell -> double
mean(bitumenLengthsDouble,'omitnan') % 131.4444 m
std(bitumenLengthsDouble,'omitnan') % 30.1957 m
%plot length
figure
histogram(bitumenLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Bitumen Tanker Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSLLM = AISMetrics1(bitumenIdx,5);
bitumenSLLMDouble = cell2mat(bitumenSLLM);
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenLengths = AISMetrics1(bitumenIdx,2);
bitumenLengthsDouble = cell2mat(bitumenLengths);
%scatter
t = bitumenSLLMDouble;
td = bitumenLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker Length (m)")

%draft
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumendraft = AISMetrics1(bitumenIdx,3);
bitumendraftDouble = cell2mat(bitumendraft); %cell -> double
mean(bitumendraftDouble,'omitnan') % 7.6333 m
std(bitumendraftDouble,'omitnan') % 2.0827 m
%plot draft
figure
histogram(bitumendraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Bitumen Tanker Draft (m)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSLLM = AISMetrics1(bitumenIdx,5);
bitumenSLLMDouble = cell2mat(bitumenSLLM);
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumendraft = AISMetrics1(bitumenIdx,3);
bitumendraftDouble = cell2mat(bitumendraft);
%scatter
t = bitumenSLLMDouble;
td = bitumendraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker Draft (m)")

%SOG
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSOG = AISMetrics1(bitumenIdx,4);
bitumenSOGDouble = cell2mat(bitumenSOG); %cell -> double
mean(bitumenSOGDouble,'omitnan') % knots
std(bitumenSOGsDouble,'omitnan') % knots
%plot SOG
figure
histogram(bitumenSOGsDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bitumen Tanker Speed Over Ground (knots)')
ylabel('Frequency')
%Scatter plot SLLM vs SOG
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSLLM = AISMetrics1(bitumenIdx,5);
bitumenSLLMDouble = cell2mat(bitumenSLLM);
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSOG = AISMetrics1(bitumenIdx,4);
bitumenSOGDouble = cell2mat(bitumenSOG);
%scatter
t = bitumenSLLMDouble;
td = bitumenSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker SOG (knots)")

%SLLM
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSLLM = AISMetrics1(bitumenIdx,5);
bitumenSLLMDouble = cell2mat(bitumenSLLM); %cell -> double
mean(bitumenSLLMDouble,'omitnan') % 156.6309
std(bitumenSLLMDouble,'omitnan') % 5.1428
%plot SLLM
figure
histogram(bitumenSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bitumen Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenage = AISMetrics1(bitumenIdx,10);
bitumenageDouble = cell2mat(bitumenage); %cell -> double
mean(bitumenageDouble,'omitnan') % 7 years
std(bitumenageDouble,'omitnan') % 3.0822 years
%plot age
figure
histogram(bitumenageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Bitumen Tanker Age (years)')
ylabel('Frequency')
%Scatter plot SLLM vs age
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenSLLM = AISMetrics1(bitumenIdx,5);
bitumenSLLMDouble = cell2mat(bitumenSLLM);
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenage = AISMetrics1(bitumenIdx,10);
bitumenageDouble = cell2mat(bitumenage); 
%scatter
t = bitumenSLLMDouble;
td = bitumenageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Bitumen Tanker Age (years)")

%Scatter plot length vs age
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenLengths = AISMetrics1(bitumenIdx,2);
bitumenLengthsDouble = cell2mat(bitumenLengths); 
bitumenIdx = strcmp(AISMetrics1(:,8),'Bitumen Tanker'); 
bitumenage = AISMetrics1(bitumenIdx,10);
bitumenageDouble = cell2mat(bitumenage); 
%scatter
t = bitumenLengthsDouble;
td = bitumenageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("Bitumen Tanker Length (m)")
ylabel("Bitumen Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("Bitumen Tanker Length (m)")
ylabel("Bitumen Tanker Age (years)")


%Container Ship
%Length
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerLengths = AISMetrics1(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths); %cell -> double
mean(containerLengthsDouble,'omitnan') % 264.8000 m
std(containerLengthsDouble,'omitnan') % 56.8719 m
%plot length
figure
histogram(containerLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Container Ship Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSLLM = AISMetrics1(containerIdx,5);
containerSLLMDouble = cell2mat(containerSLLM);
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerLengths = AISMetrics1(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
%scatter
t = containerSLLMDouble;
td = containerLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Length (m)")

%draft
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerdraft = AISMetrics1(containerIdx,3);
containerdraftDouble = cell2mat(containerdraft); %cell -> double
mean(containerdraftDouble,'omitnan') % 12.3200 m
std(containerdraftDouble,'omitnan') % 1.7337 m
%plot draft
figure
histogram(containerdraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Container Ship Draft (m)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSLLM = AISMetrics1(containerIdx,5);
containerSLLMDouble = cell2mat(containerSLLM);
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerdraft = AISMetrics1(containerIdx,3);
containerdraftDouble = cell2mat(containerdraft);
%scatter
t = containerSLLMDouble;
td = containerdraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Draft (m)")

%SOG
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSOG = AISMetrics1(containerIdx,4);
containerSOGDouble = cell2mat(containerSOG); %cell -> double
mean(containerSOGDouble,'omitnan') %  knots
std(containerSOGDouble,'omitnan') %  knots
%plot SOG
figure
histogram(containerSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Container Ship Speed Over Ground (knots)')
ylabel('Frequency')
%Scatter plot SLLM vs SOG
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSLLM = AISMetrics1(containerIdx,5);
containerSLLMDouble = cell2mat(containerSLLM);
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSOG = AISMetrics1(containerIdx,4);
containerSOGDouble = cell2mat(containerSOG);
%scatter
t = containerSLLMDouble;
td = containerSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship SOG (knots)")

%SLLM
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSLLM = AISMetrics1(containerIdx,5);
containerSLLMDouble = cell2mat(containerSLLM); %cell -> double
mean(containerSLLMDouble,'omitnan') % 165.0235
std(containerSLLMDouble,'omitnan') % 8.0839
%plot SLLM
figure
histogram(containerSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Container Ship SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerage = AISMetrics1(containerIdx,10);
containerageDouble = cell2mat(containerage); %cell -> double
mean(containerageDouble,'omitnan') % 13.3600 years
std(containerageDouble,'omitnan') % 4.9907 years
%plot age
figure
histogram(containerageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Container Ship Age (years)')
ylabel('Frequency')
%Scatter plot SLLM vs age
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerSLLM = AISMetrics1(containerIdx,5);
containerSLLMDouble = cell2mat(containerSLLM);
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerage = AISMetrics1(containerIdx,10);
containerageDouble = cell2mat(containerage);
%scatter
t = containerSLLMDouble;
td = containerageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Container Ship Age (years)")

%Scatter plot length vs age
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerLengths = AISMetrics1(containerIdx,2);
containerLengthsDouble = cell2mat(containerLengths);
containerIdx = strcmp(AISMetrics1(:,8),'Container Ship'); 
containerage = AISMetrics1(containerIdx,10);
containerageDouble = cell2mat(containerage);
%scatter
t = containerLengthsDouble;
td = containerageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("Container Ship Length (m)")
ylabel("Container Ship Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("Container Ship Length (m)")
ylabel("Container Ship Age (years)")


%Crude Oil Tanker
%Length
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilLengths = AISMetrics1(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths); %cell -> double
mean(crudeoilLengthsDouble,'omitnan') % 237.1613 m
std(crudeoilLengthsDouble,'omitnan') % 18.2448 m
%plot length
figure
histogram(crudeoilLengthsDouble,'BinWidth',15,'FaceColor','k')
xlabel('Crude Oil Tanker Length (m)')
ylabel('Frequency')
%Scatter plot SLLM vs length
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSLLM = AISMetrics1(crudeoilIdx,5);
crudeoilSLLMDouble = cell2mat(crudeoilSLLM); 
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilLengths = AISMetrics1(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths); 
%scatter
t = crudeoilSLLMDouble;
td = crudeoilLengthsDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Length (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Length (m)")

%draft
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoildraft = AISMetrics1(crudeoilIdx,3);
crudeoildraftDouble = cell2mat(crudeoildraft); %cell -> double
mean(crudeoildraftDouble,'omitnan') % 13.0935 m
std(crudeoildraftDouble,'omitnan') % 2.0735 m
%plot draft
figure
histogram(crudeoildraftDouble,'BinWidth',0.5,'FaceColor','k')
xlabel('Crude Oil Tanker Draft (m)')
ylabel('Frequency')
%Scatter plot SLLM vs draft
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSLLM = AISMetrics1(crudeoilIdx,5);
crudeoilSLLMDouble = cell2mat(crudeoilSLLM); 
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoildraft = AISMetrics1(crudeoilIdx,3);
crudeoildraftDouble = cell2mat(crudeoildraft);
%scatter
t = crudeoilSLLMDouble;
td = crudeoildraftDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Draft (m)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Draft (m)")

%SOG
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSOG = AISMetrics1(crudeoilIdx,4);
crudeoilSOGDouble = cell2mat(crudeoilSOG); %cell -> double
mean(crudeoilSOGDouble,'omitnan') % knots
std(crudeoilSOGDouble,'omitnan') % knots
%plot SOG
figure
histogram(crudeoilSOGDouble,'BinWidth',1,'FaceColor','k')
xlabel('Crude Oil Tanker Speed Over Ground (knots)')
ylabel('Frequency')
%Scatter plot SLLM vs SOG
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSLLM = AISMetrics1(crudeoilIdx,5);
crudeoilSLLMDouble = cell2mat(crudeoilSLLM); 
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSOG = AISMetrics1(crudeoilIdx,4);
crudeoilSOGDouble = cell2mat(crudeoilSOG);
%scatter
t = crudeoilSLLMDouble;
td = crudeoilSOGDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker SOG (knots)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker SOG (knots)")

%SLLM
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSLLM = AISMetrics1(crudeoilIdx,5);
crudeoilSLLMDouble = cell2mat(crudeoilSLLM); %cell -> double
mean(crudeoilSLLMDouble,'omitnan') % 163.5270
std(crudeoilSLLMDouble,'omitnan') % 8.3158
%plot SLLM
figure
histogram(crudeoilSLLMDouble,'BinWidth',1,'FaceColor','k')
xlabel('Crude Oil Tanker SLLM (dB re 1 µPa^2/Hz • 1m)')
ylabel('Frequency')

%age
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilage = AISMetrics1(crudeoilIdx,10);
crudeoilageDouble = cell2mat(crudeoilage); %cell -> double
mean(crudeoilageDouble,'omitnan') % 11.6452 years
std(crudeoilageDouble,'omitnan') % 5.1287 years
%plot age
figure
histogram(crudeoilageDouble,'BinWidth',1,'FaceColor','k')
xlabel('Crude Oil Ship Age (years)')
ylabel('Frequency')
%Scatter plot SLLM vs age
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilSLLM = AISMetrics1(crudeoilIdx,5);
crudeoilSLLMDouble = cell2mat(crudeoilSLLM); 
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilage = AISMetrics1(crudeoilIdx,10);
crudeoilageDouble = cell2mat(crudeoilage);
%scatter
t = crudeoilSLLMDouble;
td = crudeoilageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("1/3 octave Monopole Source Level")
ylabel("Crude Oil Tanker Age (years)")

%Scatter plot length vs age
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilLengths = AISMetrics1(crudeoilIdx,2);
crudeoilLengthsDouble = cell2mat(crudeoilLengths); 
crudeoilIdx = strcmp(AISMetrics1(:,8),'Crude Oil Tanker'); 
crudeoilage = AISMetrics1(crudeoilIdx,10);
crudeoilageDouble = cell2mat(crudeoilage);
%scatter
t = crudeoilLengthsDouble;
td = crudeoilageDouble;
figure
scatter(t, td, "blue", "filled")
xlabel("Crude Oil Tanker Length (m)")
ylabel("Crude Oil Tanker Age (years)")
lin_reg_line8 = fitlm(t,td);
figure
plot(lin_reg_line8)
xlabel("Crude Oil Tanker Length (m)")
ylabel("Crude Oil Tanker Age (years)")

%ANOVA
[p,tbl,stats] = anova1(AISMetrics1,10);

