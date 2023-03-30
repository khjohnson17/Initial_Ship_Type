%Dates
%KHJ
%2/10/23

%For each of the sites run this code
myDates = floor(min(CPA_time_all)):7:ceil(max(CPA_time_all));
figure;
histogram(CPA_time_all,myDates)
datetick('x','mm/yy')
plottools

%concatonate - rename one of the two files CPA_time_all_
GA = cat(1,CPA_time_all,CPA_time_all_)
myDates = floor(min(GA)):7:ceil(max(GA));
figure;
histogram(GA,myDates)
datetick('x','mm/yy')
plottools
SL = cat(1,CPA_time_all,CPA_time_all_)
myDates = floor(min(SL)):7:ceil(max(SL));
figure;
histogram(SL,myDates)
datetick('x','mm/yy')
plottools




%Frequency Images
imagesc(SLLM_thirdoctave)
imagesc(SLLM_thirdoctave')
set(gca,'ydir','normal')
imagesc(f_thirdoctave.center,size(SLLM_thirdoctave,1),SLLM_thirdoctave)
imagesc(size(SLLM_thirdoctave,1),f_thirdoctave.center,SLLM_thirdoctave')
set(gca,'ydir','normal')
size(SLLM_thirdoctave,1)
imagesc(1:size(SLLM_thirdoctave,1),f_thirdoctave.center,SLLM_thirdoctave')
size(SLLM_thirdoctave,1)
set(gca,'ydir','normal')
imagesc(1:size(SL_TLLM,1),f_thirdoctave.center,SL_TLLM')
set(gca,'ydir','normal')
plottools