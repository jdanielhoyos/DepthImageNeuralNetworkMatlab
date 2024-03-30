# DepthImageNeuralNetworkMatlab
Depth prediction by neural network in Matlab/Simulink using python.


In this repository you'll find the script WebcamNN.m which shows the image of the webcam and the depth predicted by a pretrained neural network. For indoors, use nyu.h5, for outdoors use kitti.h5

To use kitti Comment line 25 and uncomment line 25 on predictmodel.py
Comment line 22 and uncomment line 23 on loadModel.py

On the other hand, to run the Simulink model, run first Parameters.m , and then NueralNetworkDisparity.slx  This simulation also compares the depth estimation from stereo vision, using the semi global matching method. 

https://youtu.be/T0gRhwgD0zo
https://youtu.be/xGF0JRVhGzo




https://user-images.githubusercontent.com/58446071/197628806-2aa29d16-367f-4b34-9b56-3f0dd9ef2ef4.mp4




https://user-images.githubusercontent.com/58446071/197629859-7b169bad-accb-42ec-9e3c-0c57893ee2e6.mp4

