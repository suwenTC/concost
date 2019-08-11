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
