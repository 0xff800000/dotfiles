import sys
import numpy as np
from scipy import ndimage
from scipy import misc
import imageio
import matplotlib.pyplot as plt

def applySine(path):
    face = imageio.imread(path)
    dims = face.shape
    r = face*(1,0,0)
    g = face*(0,1,0)
    b = face*(0,0,1)
    r = np.flip(r,0)
    r = np.roll(r, np.random.randint(dims[1]),0)
    g = np.roll(g, np.random.randint(dims[1]),0)
    b = np.roll(b, np.random.randint(dims[1]),0)
    face = r*2+g+b
    face = np.ravel(face)
    s = (np.sin(np.arange(face.shape[0])/(dims[1])))
    n = (np.round(np.sin(face)/1.9)).astype(int)
    face = face+n*255
    face = (s*face*255).astype('uint8')
    face = face.reshape(dims)
    imageio.imsave(path, face)

def resizeDestroy(path):
    face = imageio.imread(path)
    dims = face.shape
    face = (face.reshape((-1,face.shape[0],3))).T
    face = face.reshape(dims)
    imageio.imsave(path, face)

resizeDestroy(sys.argv[1])
