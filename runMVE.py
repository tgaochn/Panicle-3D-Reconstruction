#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
ProjectName:

Author:
    Tian Gao
Email:
    tgaochn@gmail.com
CreationDate:
    4/27/2018
Description::
    _
"""
import os

class PipelineSinglePath:
    def __init__(self, inputDir, outputDir):
        self.inputDir = inputDir
        self.outputDir = outputDir
        self.screenOutputFn = os.path.join(outputDir, 'screenOutput.txt')

        if not os.path.exists(outputDir):
            os.makedirs(outputDir)
    # end_func

    def run(self):
        print("begin to make scene...")
        cmd = './lib/mve/apps/makescene/makescene -i \"%s\" \"%s\" > \"%s\"' % (self.inputDir, self.outputDir, self.screenOutputFn)
        print(cmd)
        os.system(cmd)

        print("begin to reconstruct SfM...")
        cmd = './lib/mve/apps/sfmrecon/sfmrecon \"%s\" >> \"%s\"' % (self.outputDir, self.screenOutputFn)
        print(cmd)
        os.system(cmd)

        print("begin to reconstruct depth map...")
        cmd = './lib/mve/apps/dmrecon/dmrecon -s2 \"%s\" >> \"%s\"' % (self.outputDir, self.screenOutputFn)
        print(cmd)
        os.system(cmd)

        print("begin to reconstruct dense point cloud...")
        cmd = './lib/mve/apps/scene2pset/scene2pset -F2 \"%s\" \"%s/pset-L2.ply\" >> \"%s\"' % (self.outputDir, self.outputDir, self.screenOutputFn)
        print(cmd)
        os.system(cmd)

        print("begin to reconstruct surface using fssr...")
        cmd = './lib/mve/apps/fssrecon/fssrecon \"%s/pset-L2.ply\" \"%s/surface-L2.ply\" >> \"%s\"' % (self.outputDir, self.outputDir, self.screenOutputFn)
        print(cmd)
        os.system(cmd)

        print("begin to clean surface...")
        cmd = './lib/mve/apps/meshclean/meshclean -t10 \"%s/surface-L2.ply\" \"%s/surface-L2-clean.ply\" >> \"%s\"' % (self.outputDir, self.outputDir, self.screenOutputFn)
        print(cmd)
        os.system(cmd)
    # end_func
# end_class

def main():
    preprocessedImgPath = './output'
    pipeline = PipelineSinglePath(preprocessedImgPath, preprocessedImgPath)
    pipeline.run()
# end_main

if __name__ == "__main__":
    main()
# end_if
