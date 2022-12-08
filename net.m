close all
clear
clc 

data = xlsread('data.xlsx');

[m,n] = size(data);
P = 0.70 ;
idx = randperm(m)  ;
Training = data(idx(1:round(P*m)),:) ; 
Testing = data(idx(round(P*m)+1:end),:) ;


input_train = Training(:, 1:2);
output_train = Training(:,3);
input_test = Testing(:, 1:2);
output_test = Testing(:,3);


w=1.5;
        
for i=1:1:10
    for u=3:1:7
          for q=3:1:7
                 for ep=50:10:300
netann=newff(a,[u,q,1],{'tansig','tansig','purelin'});
netann.trainParam.epochs =ep;
netann=train(netann,input_train,output_train);
tt=sim(netann,input_train)';
te=sim(netann,input_test)';
tnew1=output_train(1,:);
tsim1=tt(:,1);
ttenew1=output_test(1,:);
tesim1=te(:,1);


MAE1=mean(abs(tnew1-tsim1'));
MRE1=100*mean(abs((tnew1-tsim1')/tnew1));
RMSE1=(mean((tnew1-tsim1').^2)).^0.5;
MAEtest1=mean(abs(ttenew1-tesim1'));
MREtest1=100*mean(abs((ttenew1-tesim1')/ttenew1));
RMSEtest1=(mean((ttenew1-tesim1').^2)).^0.5;

disp(i)

        if (RMSEtest1)<= w
            w=(RMSEtest1);
            save netann
            neuron1=u;
            epoch=ep;
        end
end
end
 end
end


load netann
view(netann)

MAE1=mean(abs(tnew1-tsim1'));
MRE1=100*mean(abs((tnew1-tsim1')/tnew1));
RMSE1=(mean((tnew1-tsim1').^2)).^0.5;
MAEtest1=mean(abs(ttenew1-tesim1'));
MREtest1=100*mean(abs((ttenew1-tesim1')/ttenew1));
RMSEtest1=(mean((ttenew1-tesim1').^2)).^0.5;
                    
%========
neuron1;
epoch;
w;
%=========PLOTS====

figure(1)
PlotResults(output_train(1,:),tt(:,1)','Train Data');        

figure(2)
PlotResults(output_test(1,:),te(:,1)','Test Data');            