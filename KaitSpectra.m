% plot concatenated spectra to check for problems:
figure(110);clf
h = surf(SL_TLLM','EdgeColor','none'); %1:size(SL_TLLM,2),F,
view(2)
h.y
set(gca,'ydir','normal')
% Compute band level 10Hz - 1000Hz

[~,Flow] = find(F==10);
[~,Fhigh] = find(F==1000);
bandMean = mean(SL_TLLM(:,Flow:Fhigh),2);
plot(SLLM_thirdoctave(:,11),bandMean,'.')


SL01meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));
SL02meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));

GA01meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));
GA02meanBroadbandMSL = 20.*log10(mean(10.^(SL_TLLM(:,Flow:Fhigh)/20),2));

%concatonate SL
SLmeanBroadbandMSL = cat(1, SL01meanBroadbandMSL,SL02meanBroadbandMSL);

%concatonate GA
GAmeanBroadbandMSL = cat(1, GA01meanBroadbandMSL,GA02meanBroadbandMSL);
