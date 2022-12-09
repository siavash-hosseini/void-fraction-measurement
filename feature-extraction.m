close all
clear
clc

annular_original = xlsread('dataann.xlsx');
homogenous_original = xlsread('datahomo.xlsx');
stratified_original = xlsread('datastr.xlsx');

annular=nan(100,37);
j=1;
for i=1:4:14800
   annular(j)=mean(annular_original(i:i+3));
   j=j+1;
end

homogenous=nan(100,37);
l=1;
for i=1:4:14800
   homogenous(l)=mean(homogenous_original(i:i+3));
  l=l+1;
end

stratified=nan(100,37);
m=1;
for i=1:4:14800
   stratified(m)=mean(stratified_original(i:i+3));
  m=m+1;
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
annular = annular(5:end,1:end);
homogenous = homogenous(5:end,1:end);
stratified = homogenous(5:end,1:end);
%%%%%%%%%%%   annular   %%%%%%%%%
fft_ann=abs(fft(annular(:,2:end)));


fft_ann=fft_ann(1:48,:);
mean_ann=mean(fft_ann);
freq_ann= meanfreq(fft_ann);
medfreq_ann = medfreq(fft_ann);
rss_ann = rssq(fft_ann);
kurto_ann = kurtosis(fft_ann);
skw_ann = skewness(fft_ann);
rms_ann = rms(fft_ann);
std_ann =std(fft_ann);
var_ann =var(fft_ann);

%%%%%%%%%% homogenous %%%%%%%%%%
fft_homo=abs(fft(homogenous(:,2:end)));
fft_homo=fft_homo(1:48,:);
mean_homo=mean(fft_homo);
freq_homo= meanfreq(fft_homo);
medfreq_homo = medfreq(fft_homo);
rss_homo = rssq(fft_homo);
kurto_homo = kurtosis(fft_homo);
skw_homo = skewness(fft_homo);
rms_homo = rms(fft_homo);
std_homo =std(fft_homo);
var_homo =var(fft_homo);


%%%%%%%%%stratified
fft_str=abs(fft(stratified(:,2:end)));
fft_str=fft_str(1:48,:);
mean_str=mean(fft_str);
freq_str= meanfreq(fft_str);
medfreq_str = medfreq(fft_str);
rss_str = rssq(fft_str);
kurto_str = kurtosis(fft_str);
skw_str = skewness(fft_str);
rms_str = rms(fft_str);
std_str =std(fft_str);
var_str =var(fft_str);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = 0:1:47;
 amp_ann = nan(1,36);
 

 for i = 1:36
   [amp,freq] = findpeaks(fft_ann(:,i),f,'NPeaks',1,'SortStr','descend');
  amp_ann(i) = amp;
     
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 amp_homo = nan(1,36);
 
 for i = 1:36
   [amp,freq] = findpeaks(fft_homo(:,i),f,'NPeaks',1,'SortStr','descend');
  amp_homo(i) = amp;
     
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 amp_str = nan(1,36);
 
 for i = 1:36
   [amp,freq] = findpeaks(fft_str(:,i),f,'NPeaks',1,'SortStr','descend');
  amp_str(i) = amp;
     
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ann=nan(8,36);
homo=nan(8,36);
str=nan(8,36);

ann(1,:)=mean_ann;
homo(1,:)=mean_homo;
str(1,:)=mean_str;


ann(2,:)=kurto_ann;
homo(2,:)=kurto_homo;
str(2,:)=kurto_str;

ann(3,:)=rms_ann;
homo(3,:)=rms_homo;
str(3,:)=rms_str;

ann(4,:)=std_ann;
homo(4,:)=std_homo;
str(4,:)=std_str;

ann(5,:)=var_ann;
homo(5,:)=var_homo;
str(5,:)=var_str;

ann(6,:)=amp_ann;
homo(6,:)=amp_homo;
str(6,:)=amp_str;

ann(7,:)=medfreq_ann;
homo(7,:)=medfreq_homo;
str(7,:)=medfreq_str;

ann(8,:)=skw_ann;
homo(8,:)=skw_homo;
str(8,:)=skw_str;


f=1;
for i=1:8

     j=i;
        figure(f)
       
    plot(ann(i,1:2:36),ann(j,2:2:36),'s-','color',[55 158 52]/255,'markerfacecolor',[55 158 52]/255);
    hold on;
    
    plot(homo(i,1:2:36),homo(j,2:2:36),'rs-','markerfacecolor','r');
    hold on;

  
    plot(str(i,1:2:36),str(j,2:2:36),'bs-','markerfacecolor','b');
    %grid on
    
    legend('Annular', 'Stratified', 'Homogenous')

   
    f = f + 1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if i==1
          xlabel('det1 mean')
    elseif i==2
           xlabel('det1 kurtosis')
    elseif i==3
             xlabel('det1 rms')
    elseif i==4
             xlabel('det1 std')
    elseif i==5
             xlabel('det1 var')
    elseif i==6
             xlabel('det1 dominant freq')
    elseif i==7 
            xlabel('det 1 median')
    else
            xlabel('det1 skw')
   end
    %%%%%%%%%%%%%%%%%%%%%%%%
    if j==1
             ylabel('det2 mean')
    elseif j==2
             ylabel('det2 kurto')
    elseif j==3
             ylabel('det2 rms')
    elseif j==4
             ylabel('det2 std')
    elseif j==5
            ylabel('det2 var')
    elseif j==6
           ylabel('det2 dominant freq')
    elseif j==7
            ylabel('det2 median')
    else
            ylabel('det2 skw')
   end
        
end
