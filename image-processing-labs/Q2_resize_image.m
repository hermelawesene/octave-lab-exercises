function Q2_resize_image(image_path, target_width, target_height)
  img = imread(image_path);
  [h, w, ~] = size(img);

  % Compute scaling factor
  scale_w = target_width / w;
  scale_h = target_height / h;
  scale = min(scale_w, scale_h);

  new_w = round(w * scale);
  new_h = round(h * scale);

  % Resize image
  resized_img = imresize(img, [new_h new_w]);

  % Display comparison
  figure;
  subplot(1,2,1);
  imshow(img);
  title(sprintf("Original (%dx%d)", w, h));

  subplot(1,2,2);
  imshow(resized_img);
  title(sprintf("Resized (%dx%d)", new_w, new_h));
end

