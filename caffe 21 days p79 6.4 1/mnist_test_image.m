clc;
clear;
for i=1:10
imgOrigin=imread([num2str(i,'%d'),'.png']);
imgBinaryImg(i,:,:)= imgOrigin(:,:,1).'; 
end
imgMnist = fopen('test_img_ubyte', 'wb');  %w：写，如果没有自动创建
magic = 2051;
numImages = i;
numRows = 28;
numCols = 28;  
fwrite(imgMnist, magic, 'int32', 0, 'ieee-be');  %ieee-be:大端存储
fwrite(imgMnist, numImages, 'int32', 0, 'ieee-be');%0貌似表是读完这个都下个之前的skip，0就是连着读，不跳
fwrite(imgMnist, numRows, 'int32', 0, 'ieee-be');  
fwrite(imgMnist, numCols, 'int32', 0, 'ieee-be');  
for i=1:10
imgBinaryImg1(numCols* numRows*(i-1)+1:numCols* numRows*i)= reshape(imgBinaryImg(i,:,:), 1, numCols* numRows); %reshape按列转换
end
fwrite(imgMnist, imgBinaryImg1, 'unsigned char');  
fclose(imgMnist);  
%将label转换为二进制
flabel = fopen('test_lable_ubyte', 'wb');  
magic = 2049;
numLabels = i;
labels = [5 6 1 4 7 0 9 1 3 5];
fwrite(flabel, magic, 'int32', 0, 'ieee-be');  
fwrite(flabel, numLabels, 'int32', 0, 'ieee-be');  
fwrite(flabel, labels, 'unsigned char');  
fclose(flabel);  
