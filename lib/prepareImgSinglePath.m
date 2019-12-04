function prepareImgSinglePath(imgInputPath, imgOutputPath, maskColorSpaceType, maskFuncType, maskThresLis, enableDenoise, intensThres, minAreaThres, debugMode, debugImgFn)
    imgInputDir = [dir([imgInputPath, '/*.jpg']), dir([imgInputPath, '/*.JPG'])];
    if ~exist(imgOutputPath)
        mkdir(imgOutputPath)
    end

    if debugMode
        loopCnt = 1;
    else
        loopCnt = length(imgInputDir);
    end

    parfor i = 1: loopCnt
    % for i = 1: loopCnt
        % load image
        imgInputFn = [imgInputPath, '/', imgInputDir(i).name];
        % imgInputFn
        imgInput = imread(imgInputFn);

        % mask the image
        if strcmp(maskColorSpaceType, 'LAB')
            colorSpace = rgb2lab(imgInput);
        elseif strcmp(maskColorSpaceType, 'HSV')
            colorSpace = rgb2hsv(imgInput);
        else
            disp('wrong colorspace!')
        end

        % use diff mask function, keep or remove some region
        if strcmp(maskFuncType, 'keep')
            [BW, maskedImg] = maskUnivKeep(imgInput, colorSpace, maskThresLis);
        elseif strcmp(maskFuncType, 'remove')
            [BW, maskedImg] = maskUnivRemove(imgInput, colorSpace, maskThresLis);
        else
            disp('wrong mask function type!')
        end

        if enableDenoise
            % density filter
            intensIm = sum(maskedImg, 3);
            intensIm(intensIm < intensThres) = 0;

            % fill holes
            filledIm = imfill(intensIm);

            % denoise
            BW = bwareaopen(filledIm, minAreaThres, 8);

            % generate final image after denosing
            channelR = maskedImg(:, :, 1);
            channelG = maskedImg(:, :, 2);
            channelB = maskedImg(:, :, 3);
            channelR(BW == 0) = 0;
            channelG(BW == 0) = 0;
            channelB(BW == 0) = 0;
            finalImg = zeros(size(maskedImg));
            finalImg(:, :, 1) = channelR;
            finalImg(:, :, 2) = channelG;
            finalImg(:, :, 3) = channelB;
            finalImg = uint8(finalImg);
        else
            finalImg = maskedImg;
        end

        % imwrite(imgInput, '1_input.jpg')
        % imwrite(maskedImg, '2_masked.jpg')
        % imwrite(finalImg, '3_final.jpg')

        % grayIm = rgb2gray(imgInput);
        % BW = imbinarize(grayIm);
        % oriPixelCnt = nnz(BW)

        % output the masked image
        if debugMode
            imgOutputFn = debugImgFn;
        else
            imgOutputFn = [imgOutputPath, '/', imgInputDir(i).name];
        end
        imwrite(finalImg, imgOutputFn);

        % add exif info
        exiftoolExec = '';
        osStr = computer;
        if osStr == 'PCWIN64'
            exiftoolExec = 'exiftool.exe';
        elseif osStr == 'GLNXA64'
            exiftoolExec = 'exiftool';
        end
        cmd = [exiftoolExec, ' -overwrite_original -TagsFromFile', ' "', imgInputFn, '" "', imgOutputFn, '"'];
        if debugMode
            display(cmd)
        else
            [status, info] = system(cmd);
        end

    end
end
