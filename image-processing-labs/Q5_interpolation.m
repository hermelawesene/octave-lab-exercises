function Q5_interpolation_compare(infile, newH, newW)
  pkg load image
  I = imread(infile);
  t0=tic; N = imresize(I,[newH,newW],'nearest');  tn=toc(t0);
  t0=tic; B = imresize(I,[newH,newW],'bilinear'); tb=toc(t0);
  t0=tic; C = imresize(I,[newH,newW],'bicubic');  tc=toc(t0);

  figure;
  subplot(2,2,1); imshow(I); title('Original');
  subplot(2,2,2); imshow(N); title(sprintf('Nearest (%.3fs)',tn));
  subplot(2,2,3); imshow(B); title(sprintf('Bilinear (%.3fs)',tb));
  subplot(2,2,4); imshow(C); title(sprintf('Bicubic (%.3fs)',tc));
end
