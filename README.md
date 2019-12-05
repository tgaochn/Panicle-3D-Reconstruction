# Introduction
PI-Plat is an end-to-end pipeline to build 3D models of panicles from images and extract traits. By tracking these traits of the same panicle at multiple developmental time points, we can explore the genetic variation for dynamic inflorescence traits in cereals and have a comprehensive understanding of the genotype-to-phenotype relationship.

Please refer to our paper if our pipeline helps:
https://www.biorxiv.org/content/10.1101/835306v1

# Data Access
To test the pipeline, please download the image files from shared Box link:
https://unl.box.com/s/g0bof1mpfp33hn66b2qabrk9kiwmhbzv

All the images should be put in the input folder before running the pipeline.

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

# Steps To Run Pipeline
```sh
# clone the project
git clone https://github.com/tgaochn/Panicle-3D-Reconstruction.git

# compile mve
cd lib/mve; make -j8

# copy all the data to the input folder and run preprocessing
matlab -nodesktop -nojvm -nosplash -r "preprocess;exit;"

# run mve
python runMVE.py

# extract traits

```

# Steps To obtain 2D panicle pixel count
matlab -nojvm -nodisplay -nosplash "Panicle_segment"

