# Introduction
PI-Plat is an end-to-end pipeline to build 3D models of panicles from images and extract traits.
Please refer to our paper:
https://www.biorxiv.org/content/10.1101/835306v1

# Data Access
To test the pipeline, please download the image files from shared Box link:
https://unl.box.com/s/g0bof1mpfp33hn66b2qabrk9kiwmhbzv

# System Requirements and Compiling MVE
The code is only tested on Ubuntu 16.04.
System requirements are:
* MATLAB
* python 2.7
* libjpeg 
* libpng 
* libtiff 
* OpenGL 

MVE has to be compiled to run the pipeline. To compile MVE, type:
```sh
$ cd mve
$ make -j8
```

Details can be found in MVE project: 
https://github.com/simonfuhrmann/mve

# Steps to run pipeline
```sh
# preprocess images
matlab code XXXX

# run MVE


# extract traits

```