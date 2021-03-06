function [BW_out,properties] = filterPanicle(BW_in)
%filterRegions  Filter BW image using auto-generated code from imageRegionAnalyzer app.
%  [BW_OUT,PROPERTIES] = filterRegions(BW_IN) filters binary image BW_IN
%  using auto-generated code from the imageRegionAnalyzer app. BW_OUT has
%  had all of the options and filtering selections that were specified in
%  imageRegionAnalyzer applied to it. The PROPERTIES structure contains the
%  attributes of BW_out that were visible in the app.

% Auto-generated by imageRegionAnalyzer app on 05-Dec-2019
%---------------------------------------------------------

BW_out = bwareafilt(BW_in, 1000);

% Filter image based on image properties.
% BW_out = bwpropfilt(BW_out, 'Area', [50000, 251874]);
BW_out = bwpropfilt(BW_out, 'Eccentricity', [0.9, 1]);
BW_out = bwpropfilt(BW_out, 'Solidity', [0, 0.8]);

% Get properties.
properties = regionprops(BW_out, {'Area', 'Eccentricity', 'EquivDiameter', 'EulerNumber', 'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Perimeter'});

% Uncomment the following line to return the properties in a table.
% properties = struct2table(properties);
