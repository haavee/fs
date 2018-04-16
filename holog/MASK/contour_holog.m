function out=contour_holog(grid,azc,azs,elc,els,levels)
%contour map of data grid generated by holog program
%input
% grid   = rectangular matrix of data
% azc    = center of az range
% azs    = az step size
% elc    = center of el range
% els    = el step size
%levels  = vector of levels, default is MATLAB levels
%
if(nargin < 5)
    error('Too few arguments');
    return;
elseif(nargin < 6)
    no_levels=1;
else
    no_levels=0;
end
[rows,cols]=size(grid);
xmin=azc-fix(cols/2)*azs;
xmax=azc+fix(cols/2)*azs;
ymin=elc-fix(rows/2)*els;
ymax=elc+fix(rows/2)*els;
clf
hold on
if(no_levels==1)
    [Z,h]=contour([xmin:azs:xmax],[ymin:els:ymax],grid);
else
    [Z,h]=contour([xmin:azs:xmax],[ymin:els:ymax],grid,levels);
end
box on
clabel(Z,h);