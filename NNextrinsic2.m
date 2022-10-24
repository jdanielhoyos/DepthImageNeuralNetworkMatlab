function y = NNextrinsic2(colored)

[a b c]=size(colored);

delete('own\*')
imwrite(colored,'own/myGray.png')
persistent data;
if isempty(data)
   data = pyrunfile("loadModel.py", "model")
end
pyrunfile("predictmodel.py",model=data)


load('test.mat')



A = imresize(mydata, [a,b]);
y = A;