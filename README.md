# DepthImageNeuralNetworkMatlab
Depth prediction by neural network in Matlab/Simulink using python.

Welcome to the DepthImageNeuralNetworkMatlab wiki!

In this repository you'll find the script WebcamNN.m which shows the image of the webcam and the depth predicted by a pretrained neural network. For indoors, use nyu.h5, for outdoors use kitti.h5

To use kitti Comment line 25 and uncomment line 25 on predictmodel.py
Comment line 22 and uncomment line 23 on loadModel.py

On the other hand, to run the Simulink model, run first Parameters.m , and then NueralNetworkDisparity.slx  This simulation also compares the depth estimation from stereo vision, using the semi global matching method. 

https://youtu.be/2ymbGlH4G1g
https://youtu.be/u83mqxUuCLQ




https://user-images.githubusercontent.com/58446071/197628516-9435c006-f611-4399-a0e8-9b36bea322f6.mp4




https://user-images.githubusercontent.com/58446071/197628387-5e2dc64c-4433-4d62-9afe-2f627f71384c.mp4


