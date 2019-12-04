# Introduction
PI-Plat is an end-to-end pipeline to build 3D models of panicles from images and extract traits.
Please refer to our paper:
https://www.biorxiv.org/content/10.1101/835306v1

# Data Access
To test the pipeline, please download the image files from shared Box link:
https://unl.box.com/s/g0bof1mpfp33hn66b2qabrk9kiwmhbzv

# System Requirements
The code is only tested on Ubuntu 16.04.
System requirements are:
* MATLAB
* python 2.7
* libjpeg 
* libpng 
* libtiff 
* OpenGL 
* exiftool

Details about MVE compiling can be found in MVE project: 
https://github.com/simonfuhrmann/mve

# Steps to run pipeline
```sh
# clone the project
git clone https://github.com/tgaochn/Panicle-3D-Reconstruction.git

# compile mve
cd lib/mve; make -j8

# copy all the data to the input folder and run preprocessing
matlab -nodesktop -nojvm -nosplash -r "preprocess;exit;"

# run mve
python runMVE.py
```
