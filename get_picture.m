function [M,N,flag,a]=get_picture(file)


m=1;
a=[];


i1=imread(file);
% M=512;
% N=256;
% i1=imresize(i1,[M,N]);

[M,N,K]=size(i1);
for c=1:4:M-128
    for l=1:4:N-64
        i11=imcrop(i1,[l,c,63,127]);
        F = hogcalculator(i11,16,16,2,2, 9, 0.5,'localinterpolate', 'unsigned', 'l2hys');
        a=[a,F'];
        flag(m)=1;
        m=m+1;
    end
end
