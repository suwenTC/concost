from __future__ import print_function
import argparse
import torch
import torch.utils.data
from torch import nn, optim
from torch.nn import functional as F
from torchvision import datasets, transforms
from torchvision.utils import save_image
import time
import os
import sys
import psutil

no_cuda = False                                                                                                                                                                                             
seed = 1                                                                                                                                                                                                    
log_inverval = 10

cuda = not no_cuda and torch.cuda.is_available()

torch.manual_seed(seed)

device = torch.device("cuda" if cuda else "cpu")

kwargs = {'num_workers': 1, 'pin_memory': True} if cuda else {}

batch_size = 128
train_loader = torch.utils.data.DataLoader( 
    datasets.MNIST("/root/", train=True, download=True,                        
                   transform=transforms.ToTensor()),                           
    batch_size=batch_size, shuffle=True, **kwargs)
test_loader = torch.utils.data.DataLoader(
    datasets.MNIST("/root/", train=False, transform=transforms.ToTensor()),
    batch_size=batch_size, shuffle=True, **kwargs)
File Edit Options Buffers Tools Python Help                                     
from __future__ import print_function

import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Activation
from keras.layers import SimpleRNN
from keras import initializers
from keras.optimizers import RMSprop

batch_size = 32
num_classes = 10
epochs = 200
hidden_units = 100

learning_rate = 1e-6
clip_norm = 1.0

# the data, split between train and test sets                                   
(x_train, y_train), (x_test, y_test) = mnist.load_data()
