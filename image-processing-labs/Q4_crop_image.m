function Q4_crop_image(image_path, x, y, w, h)
  % Q4_crop_image: Crop an image to a specified region of interest (ROI)
  %
  % Usage:
  %   Q4_crop_image("images/sample.jpg", x, y, width, height)
  %
  % Example:
  %   Q4_crop_image("images/sample.jpg", 50, 30, 200, 150)
  %
  % Parameters:
  %   x, y  -> top-left corner of the ROI
  %   w, h  -> width and height of the ROI

  % Load the image
  img = imread(image_path);

  % Check bounds
  [rows, cols, ~] = size(img);
  if x < 1 || y < 1 || x+w-1 > cols || y+h-1 > rows
    error("ROI is out of image bounds!");
  end

  % Crop using array slicing
  cropped = img(y:y+h-1, x:x+w-1, :);

  % Show results
  figure;

  subplot(1,2,1);
  imshow(img);
  title("Original Image");

  subplot(1,2,2);
  imshow(cropped);
  title(sprintf("Cropped ROI (x=%d, y=%d, w=%d, h=%d)", x, y, w, h));
end

