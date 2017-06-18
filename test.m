function []=test(M,N,file,L,num)

for tmp=1:num
    a=find(L==tmp);
    if (length(a)<=8)
        continue
    end
    min_i=10000;
    min_j=10000;
    max_i=0;
    max_j=0;
    for i=1:length(a)
        j1=fix(a(i,1)/M)+1;
        i1=a(i,1)-(j1-1)*M;
        if min_i>i1
            min_i=i1;
        end
        if max_i<i1
            max_i=i1;
        end
        if min_j>j1
            min_j=j1;
        end
        if max_j<j1
            max_j=j1;
        end
    end
    
%     M2=512;
%     N2=256;
%     i1=imresize(i1,[M2,N2]);
    i1=imread(file);
    i11=imcrop(i1,[4*(min_j-1)+1,4*(min_i-1)+1,63+4*(max_j-min_j),127+4*(max_i-min_i)]);
%     min_i
%     min_j
%     i1=drawRect(i1,[4*(min_i-1)+1,4*(min_j-1)+1],[63+4*(max_j-min_j),127+4*(max_i-min_i)],1);
    imwrite(i11,['C:\\Users\\49181\\Desktop\\½á¹û\\person',num2str(tmp),'.png'],'png');
end



