function Q9_load_color_spaces(infile)
  pkg load image
  I = imread(infile);
  figure; subplot(1,2,1); imshow(I); title('Raw read');

  if size(I,3)==4
    % Assume CMYK 0..255 → convert to RGB
    I = im2double(I);
    C = I(:,:,1); M = I(:,:,2); Y = I(:,:,3); K = I(:,:,4);
    R = (1 - min(1, C.*(1-K) + K));
    G = (1 - min(1, M.*(1-K) + K));
    B = (1 - min(1, Y.*(1-K) + K));
    RGB = cat(3,R,G,B);
    subplot(1,2,2); imshow(RGB); title('Converted CMYK → RGB');
  else
    subplot(1,2,2); imshow(I); title('RGB image');
  end
end
