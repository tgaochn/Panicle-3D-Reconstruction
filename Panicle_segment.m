files=dir('input/*.jpg');

for i=1:5:length(files)
    
    image=imread(fullfile(files(i).folder,files(i).name));
    
    BW=PanicleMask(image);
    BW=filterPanicle(BW);
    
    image=image.*uint8(BW);
    
    figure,imshow(image)
    
    Count=sum(BW(:));
    disp(Count)
    
end
