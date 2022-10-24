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

# Custom object needed for inference and training
custom_objects = {'BilinearUpSampling2D': BilinearUpSampling2D, 'depth_loss_function': None}

print('Loading model...')

# Load model into GPU / CPU
model = load_model(args.model, custom_objects=custom_objects, compile=False)

print('\nModel loaded ({0}).'.format(args.model))

