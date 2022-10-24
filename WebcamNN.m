clc
clear all
close all
fclose all
mycam = webcam(1);

%kitti.h5 for outdoors
%nyu.h5 for indoors

if isfile('kitti.h5')
     % File exists.
else
     display("Downloading pretrained neural network...")   
     urlwrite('https://drive.google.com/uc?id=1QbtiWELDE_oL7f4p7dlBT9g-B2XvvGOI&export=download&confirm=t&uuid=ccc7770d-3e98-49f4-ad1f-9a454dab6a60&at=ALAFpqxNvK_-evp_ehhc4UUJkBik:1666640389270','kitti.h5')

end

if isfile('nyu.h5')
     % File exists.
else
     display("Downloading pretrained neural network...")   
     urlwrite('https://drive.google.com/u/1/uc?id=1O1wwfmGJDJN9WYEKjCG6ekfYEBLC9N0x&export=download&confirm=t&uuid=18cf8d36-4e68-4b22-8492-32432704d94d&at=ALAFpqwnnKrp4Gaz25iftfe_kmh_:1666640715553','nyu.h5')

end

while 1    
    image = snapshot(mycam);    
    coder.extrinsic('NNextrinsic2'); 
    y = NNextrinsic2(image);

    imshow(y,[])
    

end