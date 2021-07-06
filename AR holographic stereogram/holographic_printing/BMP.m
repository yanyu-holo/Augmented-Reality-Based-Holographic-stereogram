clc
clear
path_file='G:\model-based\png\*.png';
dir1=dir(path_file); 
path='G:\model-based\png\';
for i=1:length(dir1)
    filename=dir1(i).name;
    I=imread([path,filename]);
    filename=strcat('G:\model-based\bmp\',filename);
    filename_new=strcat(filename(1:end-4),'.bmp');
    imwrite(I,filename_new,'bmp');
end