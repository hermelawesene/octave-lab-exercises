function Q13_color_spaces_and_tasks(infile)
  pkg load image
  I = im2double(imread(infile));
  if size(I,3)~=3, error('Provide an RGB image.'); end
  G = rgb2gray(I);
  HSV = rgb2hsv(I);

  % Edge detection on grayscale
  E = edge(G, 'canny');

  % Simple color-based segmentation on HSV (example: threshold by Hue)
  H = HSV(:,:,1);
  mask = (H > 0.30) & (H < 0.45);   % adjust to your image (e.g., greens)
  mask = imopen(mask, strel('disk',3));

  figure;
  subplot(2,3,1); imshow(I);   title('Original');
  subplot(2,3,2); imshow(G);   title('Grayscale');
  subplot(2,3,3); imshow(E);   title('Edges (Canny on Gray)');
  subplot(2,3,4); imshow(HSV); title('HSV (visualized)');
  subplot(2,3,5); imshow(H);   title('Hue channel');
  subplot(2,3,6); imshow(mask);title('Segmentation via Hue');
end
