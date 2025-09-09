function Q11_adjust_pixels(infile, scale, offset, outfile)
  pkg load image
  I = im2double(imread(infile));
  J = I*scale + offset;      % linear transform
  J = min(max(J,0),1);       % clip to [0,1]
  if nargin>3, imwrite(J, outfile); end
  figure; subplot(1,2,1); imshow(I); title('Original');
  subplot(1,2,2); imshow(J); title(sprintf('scale=%.2f, offset=%.2f',scale,offset));
end
