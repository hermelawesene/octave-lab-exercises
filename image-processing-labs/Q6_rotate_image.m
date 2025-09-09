function Q6_rotate_any_angle(infile, angle_deg, method, bbox, outfile)
  % method: 'nearest' | 'bilinear' | 'bicubic'
  % bbox: 'loose' (default) or 'crop'
  if nargin<3, method='bicubic'; end
  if nargin<4, bbox='loose'; end
  pkg load image
  I = imread(infile);
  J = imrotate(I, angle_deg, method, bbox);
  if nargin>4, imwrite(J, outfile); end
  figure; subplot(1,2,1); imshow(I); title('Original');
  subplot(1,2,2); imshow(J); title(sprintf('Rotated %g° (%s,%s)',angle_deg,method,bbox));
end
