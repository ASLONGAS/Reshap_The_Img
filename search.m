file_name='person_101.png';
cnt=1;
i1=imread(strcat('E:\QQFILES\759262631\FileRecv\',file_name));
%     [M,N,K]=size(i1);
%     if M<128||N<64
%         continue;
%     end
M=256;
N=128;
i1=imresize(i1,[M,N]);
for c=1:4:M-128
    for l=1:4:N-64
        i11=imcrop(i1,[l,c,63,127]);
        figure;
        imshow(i11);
    end
end