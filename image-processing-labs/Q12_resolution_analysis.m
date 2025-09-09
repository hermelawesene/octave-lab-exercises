function Q12_resolution_effects(infile)
  pkg load image
  I = imread(infile);
  scales = [1, 0.5, 0.25, 0.125];
  times = zeros(size(scales));
  figure; 
  for k=1:numel(scales)
    Ik = imresize(I, scales(k), 'bicubic');
    t0 = tic; E = edge(rgb2gray(im2double(Ik)), 'canny'); times(k)=toc(t0);
    subplot(2,2,k); imshow(Ik); title(sprintf('Scale %.3g (edge time %.4fs)', scales(k), times(k)));
  end
  fprintf('Edge detection times by scale:\n');
  disp([scales(:), times(:)]);
end
