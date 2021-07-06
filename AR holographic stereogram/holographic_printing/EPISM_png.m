clear,clc
% pixel=1000;                                %����ͼƬ������
centerplaneToHolo = 13.8;%14.85\20.15�������Լ��趨�Ĳ���
pixel = round(centerplaneToHolo/13.8*1000);%ͨ���ı����ͼƬ�ֱ�������֤numb = 25
%��ȡ�ļ�
file_address='G:\model-based\print\';%����ͼƬ��ַ
file_address_c ='G:\model-based\png\';
h1size=0.4;
h2size=0.4;
hologramsize=8-h2size;
numb=100*h1size/2;

%���������
% FOV = 31.89/180*pi;
% LCDToHolo = 5/tan(FOV/2);%һ���ӳ��ǲ��ı�
LCDToHolo = 13.8;%�������ӳ��Ǿ����Ĳ���
virtueLCDsize = centerplaneToHolo/LCDToHolo*10;
xleftlable=-1*hologramsize/2+h2size/2-virtueLCDsize;%10��ָLCD�ߴ磬
count=round(2*-1*xleftlable/h1size+1); %����ͼ����Ŀ

hogelnum=8/h2size; %hogel  2��Ŀ
%�洢�ϳ�ͼ�����ݵľ���imagedata
imagedata=zeros(hogelnum,hogelnum,pixel,pixel,4);
tic
 for i=1:count*count

    disp(['i=',num2str(i)]);
    file = [file_address,num2str(i-1,'%04d'), '.png'];
    [Image_0,b1,c1] = imread(file);
    Image(:,:,1:3) = Image_0;
    Image(:,:,4) = c1;
    %����i��ֵ�õ�ͼ���к������r��i
    r = ceil(i/count);
    if rem(i,count) == 0
        c = count;
    else
        c = rem(i,count);
    end

    
    %imagedata(r,c,:,:,:)=Image;
%   
%    for row=1:hogelnum
%        for   column=1:hogelnum
%            if 1<=r-1+m-30&&r-1+m-30<=60&&1<=c-1+n-30&&c-1+n-30<=60
%           % processimage(m,n,:)=imagedata(r-1+m-30,c-1+n-30,pixel+1-m,pixel+1-n,:);
%             %imagedata(row,column,r-(row-1)*20,c-(column-1)*20,:) = Image(1001-r-(row-1)*20,1001-c-(column-1)*20,:);           
%             imagedata(row,column,1001-(r-(row-1)*20),1001-(c-(column-1)*20)),:) = Image(r-(row-1)*20,c-(column-1)*20,:);      
% 
%           
%            end
%        end
%     end
   
  for row=1:hogelnum
   for    column=1:hogelnum
      if pixel+1-(r-(row-1))*numb>0&&pixel+1-(c-(column-1))*numb>0&&numb*(r-(row-1))-(numb-1)>0&&numb*(c-(column-1))-numb>0
       imagedata(row,column,numb*(r-(row-1))-(numb-1):numb*(r-(row-1)),numb*(c-(column-1))-(numb-1):numb*(c-(column-1)),:) = Image(pixel+1-(r-(row-1))*numb:pixel+numb-(r-(row-1))*numb,pixel+1-(c-(column-1))*numb:pixel+numb-(c-(column-1))*numb,:); 
     end
   end
  end
end
toc
tic
processimageRGB=zeros(pixel,pixel,3);
processimageALPHA=zeros(pixel,pixel);
 for i=1:hogelnum

  disp(['i=',num2str(i)]);
    for j=1:hogelnum
     
      if rem(i,2) ~= 0
        r_f = i-1;
        c_f = j-1;
       file_c = [file_address_c,num2str(r_f,'%05d') , num2str(c_f,'%05d'),'.png']; 
       else
        r_f = i-1;
        c_f = hogelnum-j;
        file_c = [file_address_c,num2str(r_f,'%05d') , num2str(c_f,'%05d'),'.png'];
     end    
        
   processimageRGB(:,:,:)=imagedata(i,j,:,:,1:3);
   processimageALPHA(:,:)=imagedata(i,j,:,:,4);
   processimageRGB = imrotate(processimageRGB,-90);%������ʾ˳ʱ����ת
   processimageALPHA = imrotate(processimageALPHA,-90);%������ʾ˳ʱ����ת
   processimageRGBtem= imresize(processimageRGB,999.8/pixel);
   processimageALPHAtem = imresize(processimageALPHA,999.8/pixel);
%    set(processimage(:,:,1:3),'AlphaData',processimage(:,:,4));
    imwrite(uint8(processimageRGBtem),file_c,'Alpha',processimageALPHAtem/255);
   end
end
toc
        
 