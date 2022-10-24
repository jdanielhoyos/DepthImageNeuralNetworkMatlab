function y = NNextrinsic(colored)

% delete('own\*')
% imwrite(colored,'own/myGray.png')
% pyrunfile("testSimulink.py")
% A = imread("test.png");
% A = imresize(A, [720,1280]);
% y = A;
% 
% 
delete('own\*')
imwrite(colored,'own/myGray.png')
persistent data;
if isempty(data)
   data = pyrunfile("loadModel.py", "model")
end
pyrunfile("predictmodel.py",model=data)


load('test.mat')


maxi=double(max(max(im2uint16(mydata)))*1.6);
cmap22 = hot(22220);  
cmap2 = hot(maxi); 
RGB2e2 = im2uint16(mydata);
J2 = ind2gray(RGB2e2,cmap2);
% figure
% imshow(J2)
rgbImage2 = ind2rgb(J2, cmap2);
% figure
% imshow(rgbImage2)
% figure
% imshow(ind2rgb(RGB2e2, cmap2))


A = imresize(im2uint8(rgbImage2), [720,1280]);
y = A;
