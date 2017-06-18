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
%SVM训练
cmd=['-t ',num2str(kernel_type),' -c ',num2str(bestc),' -g ',num2str(bestg)];
model=svmtrain(train_label,train_data,cmd);

%测试图片路径
file='C:\Users\49181\Desktop\搜索框\QQ图片20170410200102.png';
[M,N,test_label,test_data]=get_picture(file);
test_label=test_label';
test_data=test_data';
[predict_label,accuracy,value]=svmpredict(test_label,test_data,model);


i1=imread(file);
%i1=imresize(i1,[256,128]);

% M=96;
% N=48;
M=M/4;
N=N/4;
m=1;n=1;
for i=1:M*N
%     if predict_label(i)==1
%         figure;
%         a=fix(i/32)+1;
%         b=i-(a-1)*32;
%         l=4*a;
%         c=4*b;
%         row(cnt)=l;
%         col(cnt)=c;
%         cnt=cnt+1;
%         i11=imcrop(i1,[l,c,63,127]);
%         imshow(i11);
%     end
    if m>N 
        n=n+1;
        m=1;
    end
    mp(n,m)=predict_label(i);
    m=m+1;
end
[L,num] = bwlabel(mp,4);
test(file,L,num);
% if num>=10
%     test(file,L,num);
% else
%     fprintf('该图片不包含行人\n');
% end