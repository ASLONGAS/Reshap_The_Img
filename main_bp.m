clc;
clear;
%֮ǰѰ�����c,g��õĽ��
bestc=1;
bestg=0.0078125;
%���ø�˹�˺���
kernel_type=2;

%����ѵ������
load ('C:\Users\49181\Desktop\����\Hog_Train_min\No_Person\np.mat');
train_labelNP=flagNp;
train_dataNP=aNp;
load ('C:\Users\49181\Desktop\����\Hog_Train_min\Person\p.mat');
train_labelP=flagP;
train_dataP=aP;
train_label=[train_labelNP train_labelP]';
train_data=[train_dataNP train_dataP]';

%BPѵ��
input_train=train_data';
output_train=train_label';

%�������ݹ�һ��
[inputn,inputps]=mapminmax(input_train);
% BP����ѵ��
% %��ʼ������ṹ
net=newff(inputn,output_train,10);
net.trainParam.epochs=1000;
net.trainParam.lr=0.1;
net.trainParam.goal=0.000004;
% ����ѵ��
net=train(net,inputn,output_train);


%����ͼƬ·��
file='C:\Users\49181\Desktop\������\person_104.png';
%
[test_label,test_data]=get_picture(file);


%Ԥ�����ݹ�һ��
inputn_test=mapminmax('apply',test_data,inputps);
 
%����Ԥ�����
BPoutput=sim(net,inputn_test);
% �������
%������������ҳ�������������
BPoutput(find(BPoutput<0.5))=0;
BPoutput(find(BPoutput>=0.5))=1;

sum(BPoutput(:))
