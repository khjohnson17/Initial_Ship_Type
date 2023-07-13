%Neural Net Attempt 1
%KAJ
%06/13/2023


%LOAD
clearvars
%load('C:\Users\HARP\Desktop\KHJ\MATLAB\NeuralNet1\NNet2.mat')
%load('C:\Users\HARP\Desktop\KHJ\MATLAB\NeuralNet1\F.mat')
%load('C:\Users\HARP\Desktop\KHJ\MATLAB\NeuralNet1\SL_TLLM.mat')
%load('C:\Users\HARP\Desktop\KHJ\MATLAB\NeuralNet1\SL.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/NNet2.mat');
%load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/SL_TLLM.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/SL.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/F.mat')
 
%NNData = cell2mat(NN2);
mean(SL)
std(SL)
%%
% throw out rows with NaNs (neural nets can't handle Nans)

goodData = ~isnan(sum(NNData,2));
nGood = sum(goodData);
 
predictorParams_NoNan = NNData(goodData,:);
SLs_NoNan = SL(goodData,:);

% normalize predictors: This seems to make a big difference in accuracy.
% Specifying exactly how you want it done and then telling Matlab not to
% enforce its own default normalization is probably better.
%normalization 1
%predictorParams_NoNan = (predictorParams_NoNan - mean(predictorParams_NoNan,1))./std(predictorParams_NoNan,1);

%normalization 2
%predictorParams_NoNan = normalize(predictorParams_NoNan);

%normalization 3
%predictorParams_NoNan = normalize(predictorParams_NoNan,"center","mean");

%normalization 4
predictorParams_NoNan = normalize(predictorParams_NoNan,"norm",1);

%normalization 5
%predictorParams_NoNan = normalize(predictorParams_NoNan,"norm",2);

% split 2/3 train, 1/3 test (this could be done more rigorously).
trainIdx = 1:round(2*nGood/3);
testIdx = (round(2*nGood/3)+1):nGood;

trainPredParams_NoNan = predictorParams_NoNan(trainIdx,:);
trainSLs_NoNan = SLs_NoNan(trainIdx,:);

testPredParams_NoNan = predictorParams_NoNan(testIdx,:);
testSLs_NoNan = SLs_NoNan(testIdx,:);

% build network (single input to single output, if you need multi-input,
% let me know, it's a pain to get stuff formatted right).

layers2 = [imageInputLayer([1,size(trainPredParams_NoNan,2),1],...
    'Name','vinput','normalization', 'none')
    fullyConnectedLayer(100,'Name','fc20')
    reluLayer('Name','lr_1')    
    fullyConnectedLayer(300,'Name','fc21')
    reluLayer('Name','lr_2')
    dropoutLayer(.5,'Name','do_2')
    fullyConnectedLayer(400,'Name','fc22')
    reluLayer('Name','lr_3')
    dropoutLayer(.5,'Name','do_3')
    fullyConnectedLayer(1,'Name','fc13')
    regressionLayer('Name','reg_out')];

lgraph = layerGraph(layers2);

options = trainingOptions('rmsprop', ...
    'MaxEpochs',10, ...
    'MiniBatchSize',30, ...
    'Verbose',1, ...
    'Plots','training-progress',...
    'GradientThreshold',1, ...
    'Shuffle','every-epoch');

% Reshape inputs and outputs. Matlab is very frustrating and picky about
% this.
trainInputs = mat2cell(trainPredParams_NoNan,ones(size(trainPredParams_NoNan,1),1));
testInputs = mat2cell(testPredParams_NoNan,ones(size(testPredParams_NoNan,1),1));

trainOutputs = mat2cell(trainSLs_NoNan,ones(size(trainSLs_NoNan,1),1));
testOutputs = mat2cell(testSLs_NoNan,ones(size(testSLs_NoNan,1),1));

for iT = 1:size(trainSLs_NoNan,1)
    trainOutputs{iT,1} = reshape(trainOutputs{iT}',1,1,1);
end

for iT = 1:size(testSLs_NoNan,1)
    testOutputs{iT,1} = reshape(testOutputs{iT}',1,1,1);
end

% train on training data
net = trainNetwork(table(trainInputs,trainOutputs),lgraph,options);

%%
% predict on test data

testPredictions = predict(net,table(testInputs));

figure(300);clf
subplot(2,1,1)
imagesc(testIdx,F(6:end-7),testSLs_NoNan')
set(gca,'ydir','normal')
colormap(jet)
colorbar
title ('Actual (test)')
%set(gca,'clim',[135,157])
ylabel('Frequency (Hz)')
ylim([0 1000])
subplot(2,1,2)
imagesc(testIdx,F(6:end-7),testPredictions')
set(gca,'ydir','normal')
title ('Predicted (test)')
set(gca,'clim',[135,180])
ylim([0 1000])
colorbar
xlabel('Test Transit number')
ylabel('Frequency (Hz)')

% Estimate error on train/test
rmseTest = mean(sqrt((reshape(cell2mat(testOutputs),size(testPredictions))-testPredictions).^2),'all')
trainPredictions = predict(net,table(trainInputs));% predict on train data for comparison
rmseTrain = mean(sqrt((reshape(cell2mat(trainOutputs),size(trainPredictions))-trainPredictions).^2),'all')


%%
%plot predictor parameters
plot(predictorParams_NoNan(:,1),'*')
plot(predictorParams_NoNan(:,2),'*')
plot(predictorParams_NoNan(:,3),'*')
plot(predictorParams_NoNan(:,4),'*')
plot(predictorParams_NoNan(:,5),'*')
plot(predictorParams_NoNan(:,6),'*')
plot(predictorParams_NoNan(:,7),'*')
plot(predictorParams_NoNan(:,8),'*')
plot(predictorParams_NoNan(:,9),'*')
plot(predictorParams_NoNan(:,10),'*')
plot(predictorParams_NoNan(:,11),'*')
plot(predictorParams_NoNan(:,12),'*')
plot(predictorParams_NoNan(:,13),'*')
plot(predictorParams_NoNan(:,14),'*')
plot(predictorParams_NoNan(:,15),'*')
plot(predictorParams_NoNan(:,16),'*')


%% F = 500

load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/NNet2.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/SL.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/F500.mat')

goodData = ~isnan(sum(NNData,2));
nGood = sum(goodData);
 
predictorParams_NoNan = NNData(goodData,:);
SLs_NoNan = SL(goodData,:);

% normalize predictors: This seems to make a big difference in accuracy.
% Specifying exactly how you want it done and then telling Matlab not to
% enforce its own default normalization is probably better.
%normalization 1
%predictorParams_NoNan = (predictorParams_NoNan - mean(predictorParams_NoNan,1))./std(predictorParams_NoNan,1);

%normalization 2
%predictorParams_NoNan = normalize(predictorParams_NoNan);

%normalization 3
%predictorParams_NoNan = normalize(predictorParams_NoNan,"center","mean");

%normalization 4
predictorParams_NoNan = normalize(predictorParams_NoNan,"norm",1);

%normalization 5
%predictorParams_NoNan = normalize(predictorParams_NoNan,"norm",2);

% split 2/3 train, 1/3 test (this could be done more rigorously).
trainIdx = 1:round(2*nGood/3);
testIdx = (round(2*nGood/3)+1):nGood;

trainPredParams_NoNan = predictorParams_NoNan(trainIdx,:);
trainSLs_NoNan = SLs_NoNan(trainIdx,:);

testPredParams_NoNan = predictorParams_NoNan(testIdx,:);
testSLs_NoNan = SLs_NoNan(testIdx,:);

% build network (single input to single output, if you need multi-input,
% let me know, it's a pain to get stuff formatted right).

layers2 = [imageInputLayer([1,size(trainPredParams_NoNan,2),1],...
    'Name','vinput','normalization', 'none')
    fullyConnectedLayer(100,'Name','fc20')
    reluLayer('Name','lr_1')    
    fullyConnectedLayer(300,'Name','fc21')
    reluLayer('Name','lr_2')
    dropoutLayer(.5,'Name','do_2')
    fullyConnectedLayer(400,'Name','fc22')
    reluLayer('Name','lr_3')
    dropoutLayer(.5,'Name','do_3')
    fullyConnectedLayer(1,'Name','fc13')
    regressionLayer('Name','reg_out')];

lgraph = layerGraph(layers2);

options = trainingOptions('rmsprop', ...
    'MaxEpochs',10, ...
    'MiniBatchSize',30, ...
    'Verbose',1, ...
    'Plots','training-progress',...
    'GradientThreshold',1, ...
    'Shuffle','every-epoch');

% Reshape inputs and outputs. Matlab is very frustrating and picky about
% this.
trainInputs = mat2cell(trainPredParams_NoNan,ones(size(trainPredParams_NoNan,1),1));
testInputs = mat2cell(testPredParams_NoNan,ones(size(testPredParams_NoNan,1),1));

trainOutputs = mat2cell(trainSLs_NoNan,ones(size(trainSLs_NoNan,1),1));
testOutputs = mat2cell(testSLs_NoNan,ones(size(testSLs_NoNan,1),1));

for iT = 1:size(trainSLs_NoNan,1)
    trainOutputs{iT,1} = reshape(trainOutputs{iT}',1,1,1);
end

for iT = 1:size(testSLs_NoNan,1)
    testOutputs{iT,1} = reshape(testOutputs{iT}',1,1,1);
end

% train on training data
net = trainNetwork(table(trainInputs,trainOutputs),lgraph,options);

% predict on test data

testPredictions = predict(net,table(testInputs));

figure(300);clf
subplot(2,1,1)
imagesc(testIdx,F(6:end-7),testSLs_NoNan')
set(gca,'ydir','normal')
colormap(jet)
colorbar
title ('Actual (test)')
%set(gca,'clim',[135,157])
ylabel('Frequency (Hz)')
ylim([0 500])
subplot(2,1,2)
imagesc(testIdx,F(6:end-7),testPredictions')
set(gca,'ydir','normal')
title ('Predicted (test)')
%set(gca,'clim',[141.4,143.1])
ylim([0 500])
colorbar
xlabel('Test Transit number')
ylabel('Frequency (Hz)')

% Estimate error on train/test
rmseTest = mean(sqrt((reshape(cell2mat(testOutputs),size(testPredictions))-testPredictions).^2),'all')
trainPredictions = predict(net,table(trainInputs));% predict on train data for comparison
rmseTrain = mean(sqrt((reshape(cell2mat(trainOutputs),size(trainPredictions))-trainPredictions).^2),'all')

%% F = 300

load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/NNet2.mat');
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/SL.mat')
load('/Users/katrina/Documents/MATLAB/GOM/Initial_Ship_Type/Ship_Neural_Net/F300.mat')

goodData = ~isnan(sum(NNData,2));
nGood = sum(goodData);
 
predictorParams_NoNan = NNData(goodData,:);
SLs_NoNan = SL(goodData,:);

% normalize predictors: This seems to make a big difference in accuracy.
% Specifying exactly how you want it done and then telling Matlab not to
% enforce its own default normalization is probably better.
%normalization 1
%predictorParams_NoNan = (predictorParams_NoNan - mean(predictorParams_NoNan,1))./std(predictorParams_NoNan,1);

%normalization 2
%predictorParams_NoNan = normalize(predictorParams_NoNan);

%normalization 3
%predictorParams_NoNan = normalize(predictorParams_NoNan,"center","mean");

%normalization 4
predictorParams_NoNan = normalize(predictorParams_NoNan,"norm",1);

%normalization 5
%predictorParams_NoNan = normalize(predictorParams_NoNan,"norm",2);

% split 2/3 train, 1/3 test (this could be done more rigorously).
trainIdx = 1:round(2*nGood/3);
testIdx = (round(2*nGood/3)+1):nGood;

trainPredParams_NoNan = predictorParams_NoNan(trainIdx,:);
trainSLs_NoNan = SLs_NoNan(trainIdx,:);

testPredParams_NoNan = predictorParams_NoNan(testIdx,:);
testSLs_NoNan = SLs_NoNan(testIdx,:);

% build network (single input to single output, if you need multi-input,
% let me know, it's a pain to get stuff formatted right).

layers2 = [imageInputLayer([1,size(trainPredParams_NoNan,2),1],...
    'Name','vinput','normalization', 'none')
    fullyConnectedLayer(100,'Name','fc20')
    reluLayer('Name','lr_1')    
    fullyConnectedLayer(300,'Name','fc21')
    reluLayer('Name','lr_2')
    dropoutLayer(.5,'Name','do_2')
    fullyConnectedLayer(400,'Name','fc22')
    reluLayer('Name','lr_3')
    dropoutLayer(.5,'Name','do_3')
    fullyConnectedLayer(1,'Name','fc13')
    regressionLayer('Name','reg_out')];

lgraph = layerGraph(layers2);

options = trainingOptions('rmsprop', ...
    'MaxEpochs',10, ...
    'MiniBatchSize',30, ...
    'Verbose',1, ...
    'Plots','training-progress',...
    'GradientThreshold',1, ...
    'Shuffle','every-epoch');

% Reshape inputs and outputs. Matlab is very frustrating and picky about
% this.
trainInputs = mat2cell(trainPredParams_NoNan,ones(size(trainPredParams_NoNan,1),1));
testInputs = mat2cell(testPredParams_NoNan,ones(size(testPredParams_NoNan,1),1));

trainOutputs = mat2cell(trainSLs_NoNan,ones(size(trainSLs_NoNan,1),1));
testOutputs = mat2cell(testSLs_NoNan,ones(size(testSLs_NoNan,1),1));

for iT = 1:size(trainSLs_NoNan,1)
    trainOutputs{iT,1} = reshape(trainOutputs{iT}',1,1,1);
end

for iT = 1:size(testSLs_NoNan,1)
    testOutputs{iT,1} = reshape(testOutputs{iT}',1,1,1);
end

% train on training data
net = trainNetwork(table(trainInputs,trainOutputs),lgraph,options);

% predict on test data

testPredictions = predict(net,table(testInputs));

figure(300);clf
subplot(2,1,1)
imagesc(testIdx,F(6:end-7),testSLs_NoNan')
set(gca,'ydir','normal')
colormap(jet)
colorbar
title ('Actual (test)')
%set(gca,'clim',[135,157])
ylabel('Frequency (Hz)')
ylim([0 300])
subplot(2,1,2)
imagesc(testIdx,F(6:end-7),testPredictions')
set(gca,'ydir','normal')
title ('Predicted (test)')
%set(gca,'clim',[145,148])
ylim([0 300])
colorbar
xlabel('Test Transit number')
ylabel('Frequency (Hz)')

% Estimate error on train/test
rmseTest = mean(sqrt((reshape(cell2mat(testOutputs),size(testPredictions))-testPredictions).^2),'all')
trainPredictions = predict(net,table(trainInputs));% predict on train data for comparison
rmseTrain = mean(sqrt((reshape(cell2mat(trainOutputs),size(trainPredictions))-trainPredictions).^2),'all')

