clc;
clear;
%之前寻找最佳c,g获得的结果
bestc=1;
bestg=0.0078125;
%采用高斯核函数
kernel_type=2;

%导入训练数据
load ('C:\Users\49181\Desktop\数据\Hog_Train_min\No_Person\np.mat');
train_labelNP=flagNp;
train_dataNP=aNp;
load ('C:\Users\49181\Desktop\数据\Hog_Train_min\Person\p.mat');
train_labelP=flagP;
train_dataP=aP;
train_label=[train_labelNP train_labelP]';
train_data=[train_dataNP train_dataP]';

%BP训练
input_train=train_data';
output_train=train_label';

%输入数据归一化
[inputn,inputps]=mapminmax(input_train);
% BP网络训练
% %初始化网络结构
net=newff(inputn,output_train,10);
net.trainParam.epochs=1000;
net.trainParam.lr=0.1;
net.trainParam.goal=0.000004;
% 网络训练
net=train(net,inputn,output_train);


%测试图片路径
file='C:\Users\49181\Desktop\搜索框\person_104.png';
%
[test_label,test_data]=get_picture(file);


%预测数据归一化
inputn_test=mapminmax('apply',test_data,inputps);
 
%网络预测输出
BPoutput=sim(net,inputn_test);
% 结果分析
%根据网络输出找出数据属于哪类
BPoutput(find(BPoutput<0.5))=0;
BPoutput(find(BPoutput>=0.5))=1;

sum(BPoutput(:))
