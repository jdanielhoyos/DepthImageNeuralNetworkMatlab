clear all
close all
clc

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


%global d focalLength principalPoint imageSize  reprojectionMatrix
d=0.2;       %meters between left and right camera
global disparityswitch points3Dswitch ORBswitch 
disparityswitch=1;
points3Dswitch=0;
ORBswitch=0;
% Stereo camera parameters , for real cameras I can use Using the Stereo
% Camera Calibrator App and Export Camera Parameters
focalLength    = [1109, 1109]; % In pixels
principalPoint = [640, 360];   % In pixels [x, y]
imageSize      = [720, 1280];  % In pixels [mrows, ncols]
baseline       = d;          % In meters

reprojectionMatrix = [1, 0, 0, -principalPoint(1); 
    0, 1, 0, -principalPoint(2);
    0, 0, 0, focalLength(1);
    0, 0, 1/baseline, 0];


% In this example, the images are already undistorted and rectified. In a general workflow, 
% uncomment the following code to undistort and rectify the images.
% currILeft     = undistortImage(currILeft, intrinsics);
% currIRight    = undistortImage(currIRight, intrinsics);
% stereoParams  = stereoParameters(intrinsics, intrinsics, eye(3), [-baseline, 0 0]);
% [currILeft, currIRight] = rectifyStereoImages(currILeft, currIRight, stereoParams, 'OutputView','full');
