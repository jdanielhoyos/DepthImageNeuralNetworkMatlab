import os
import glob
import argparse
import matplotlib
import cv2
import pdb
import numpy as np
from PIL import Image
import scipy
from scipy.io import savemat
# Keras / TensorFlow
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '5'
from keras.models import load_model
from layers import BilinearUpSampling2D
from tensorflow.keras.layers import Layer, InputSpec
from utils import predict, load_images, display_images
from matplotlib import pyplot as plt




# Argument Parser
parser = argparse.ArgumentParser(description='High Quality Monocular Depth Estimation via Transfer Learning')
#kitti for outdoors nyu for indoors
parser.add_argument('--model', default='nyu.h5', type=str, help='Trained Keras model file.')
#parser.add_argument('--model', default='kitti.h5', type=str, help='Trained Keras model file.')
#parser.add_argument('--input', default='examples/*.png', type=str, help='Input filename or folder.')
parser.add_argument('--input', default='own/*.png', type=str, help='Input filename or folder.')


args = parser.parse_args()
# Input images
inputs = load_images( glob.glob(args.input) )
inputs=np.reshape(inputs,(inputs.shape[1], inputs.shape[2], inputs.shape[3]))
if inputs.shape[2] == 4:    
     
     
     inputs = cv2.cvtColor(np.float32(inputs), cv2.COLOR_BGRA2BGR)
  
inputs = cv2.resize(inputs, (640, 480))
#pdb.set_trace()
x3 = np.random.rand(1, 480, 640, 3)
x3[0]=inputs
inputs=x3
#inputs = np.reshape(inputs,(1, 480, 640, 3))

print('\nLoaded ({0}) images of size {1}.'.format(inputs.shape[0], inputs.shape[1:]))

#pdb.set_trace()
# Compute results
outputs = predict(model, inputs)

#matplotlib problem on ubuntu terminal fix
#matplotlib.use('TkAgg')   

# Display results
#viz = display_images(outputs.copy(), inputs.copy())
#plt.figure(figsize=(10,5))
#plt.imshow(viz)
#plt.savefig('test.png')
arr = np.moveaxis(outputs , 0, -1)
bb = arr.astype('float64')
scipy.io.savemat('test.mat', {'mydata': bb[:,:,0,0]})
#plt.imsave('test.png', arr)
#plt.show()
