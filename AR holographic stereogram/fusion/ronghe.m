clear,clc
file_address_c1 =  'C:\Users\lenovo\Desktop\��ʵ���\���⴦���\';%��һ��ϳ��Ӳ�ͼƬ�ļ���
file_address_c2 =  'C:\Users\lenovo\Desktop\��ʵ���\��ʵ�����\';%�ڶ���ϳ��Ӳ�ͼƬ�ļ���
file_address_c3 =  'C:\Users\lenovo\Desktop\��ʵ���\������ں�\';%���պϳ��Ӳ�ͼƬ�ļ���
hogelnum = 12;tic
for i=1:10
%for i=1:hogelnum*hogelnum
  disp(['i=',num2str(i)]);
  file_c1 = [file_address_c1,num2str(i,'%04d') ,'.png'];%�����ַ
  file_c2 = [file_address_c2,num2str(i,'%04d') , '.png'];
  file_c3 = [file_address_c3,num2str(i,'%04d') , '.png'];
  [RGB1,MAP1,ALPHA1] = imread(file_c1);    %��ȡRGB����ALPHAͨ��
  [RGB2,MAP2,ALPHA2] = imread(file_c2);
  RGB2(:,:,1) = RGB2(:,:,1).*(1-ALPHA1);
  RGB2(:,:,2) = RGB2(:,:,2).*(1-ALPHA1);
  RGB2(:,:,3) = RGB2(:,:,3).*(1-ALPHA1);
  RGB = RGB1 + RGB2;
 processimageALPHA = double(ALPHA1+ALPHA2);   
%      processimageALPHA = 255*ones(1000,1000);
     imwrite(uint8(RGB),file_c3,'Alpha',processimageALPHA/255);
     
%     imwrite(uint8(RGB),file_c3);
    
 
        
  
end

toc