clear,clc
close all
%file_address_final1='G:\��ͼ\tru_process\';
%file_address_final2='G:\��ͼ\vir_process\';
file_address_final3='G:\EXP2\��ʵ�ں�\';
imgPath1 = 'G:\EXP2\��ʵ����/';        % ͼ���·��
imgDir1  = dir([imgPath1 '*.png']);
imgPath2 = 'G:\EXP2\���⴦��/';        % ͼ���·��
imgDir2  = dir([imgPath2 '*.png']);
%pic_num = 112;
tic
for k =1:length(imgDir1)
    disp(['k=',num2str(k)]);
    I = imread([imgPath1 imgDir1(k).name]);
    J = imread([imgPath2 imgDir2(k).name]);
    K=imadd(I,J);
    filename3=[file_address_final3,imgDir1(k).name];
    imwrite(K,filename3);
end
toc
