clc;
clear;
for i=1:10
imgOrigin=imread([num2str(i,'%d'),'.png']);
imgBinaryImg(i,:,:)= imgOrigin(:,:,1).'; 
end
imgMnist = fopen('test_img_ubyte', 'wb');  %w��д�����û���Զ�����
magic = 2051;
numImages = i;
numRows = 28;
numCols = 28;  
fwrite(imgMnist, magic, 'int32', 0, 'ieee-be');  %ieee-be:��˴洢
fwrite(imgMnist, numImages, 'int32', 0, 'ieee-be');%0ò�Ʊ��Ƕ���������¸�֮ǰ��skip��0�������Ŷ�������
fwrite(imgMnist, numRows, 'int32', 0, 'ieee-be');  
fwrite(imgMnist, numCols, 'int32', 0, 'ieee-be');  
for i=1:10
imgBinaryImg1(numCols* numRows*(i-1)+1:numCols* numRows*i)= reshape(imgBinaryImg(i,:,:), 1, numCols* numRows); %reshape����ת��
end
fwrite(imgMnist, imgBinaryImg1, 'unsigned char');  
fclose(imgMnist);  
%��labelת��Ϊ������
flabel = fopen('test_lable_ubyte', 'wb');  
magic = 2049;
numLabels = i;
labels = [5 6 1 4 7 0 9 1 3 5];
fwrite(flabel, magic, 'int32', 0, 'ieee-be');  
fwrite(flabel, numLabels, 'int32', 0, 'ieee-be');  
fwrite(flabel, labels, 'unsigned char');  
fclose(flabel);  
