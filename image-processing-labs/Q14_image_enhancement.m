function Q14_enhancement_methods(infile)
  pkg load image
  I = im2double(imread(infile));
  if size(I,3)==3, G = rgb2gray(I); else, G = I; end

  heq = histeq(G);                    % histogram equalization
  % contrast stretching using percentiles
  p = stretchlim(G, [0.01 0.99]);     % ignore extreme 1% tails
  cst = imadjust(G, p, [0 1]);

  figure;
  subplot(2,3,1); imshow(G);   title('Input (Gray)');
  subplot(2,3,2); imshow(heq); title('Histogram Equalization');
  subplot(2,3,3); imshow(cst); title('Contrast Stretching');

  subplot(2,3,4); imhist(G);   title('Hist: Input');
  subplot(2,3,5); imhist(heq); title('Hist: Equalized');
  subplot(2,3,6); imhist(cst); title('Hist: Stretched');
end
