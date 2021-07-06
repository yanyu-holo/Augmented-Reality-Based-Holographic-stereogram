clc;
clear;

imgPath1 = 'F:\Lyp\Scene fusion\code\mask-rcnn-keras-master\1\';        % Í¼Ïñ¿âÂ·¾¶
imgDir1  = dir([imgPath1 '*.png']);
file_address_final3='F:\Lyp\Scene fusion\code\mask-rcnn-keras-master\1\';%Ð´ÈëÂ·¾¶
for k =1:length(imgDir1)
    I = imread([imgPath1 imgDir1(k).name]);
%I=imread('G:\write\×÷Í¼8422.png');
    img=I(:,:,1);
    %imshow(img)
    [h,w]=size(img);
    h;w;
    for i = 1:h
        for j = 1:w
            if img(i,j)>240
                img(i,j)=255;
            elseif img(i,j)==0
                img(i,j)=100;
            else 
                img(i,j)=0;
            end
        end
    end
    
    %imshow(img)
    filename3=[file_address_final3,num2str(k),'.png'];
    imwrite(img,filename3);
    %imwrite(img,'G:\write\',imgDir1(k).name);
end
