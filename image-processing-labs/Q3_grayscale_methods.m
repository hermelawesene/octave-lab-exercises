function Q3_grayscale_methods(image_path)
  % Q3_grayscale_methods: Apply different grayscale conversion methods
  %
  % Usage:
  %   Q3_grayscale_methods("images/sample.jpg")
  %
  % Methods:
  %   1. Average method
  %   2. Luminosity method
  %   3. Desaturation method

  % Load image
  img = imread(image_path);

  if size(img, 3) ~= 3
    error("Input image must be RGB (color).");
  end

  % Convert to double for calculations
  img = im2double(img);

  R = img(:,:,1);
  G = img(:,:,2);
  B = img(:,:,3);

  % 1. Average Method
  gray_avg = (R + G + B) / 3;

  % 2. Luminosity Method (weights human perception)
  gray_lum = 0.21 * R + 0.72 * G + 0.07 * B;

  % 3. Desaturation Method (average of min and max channel)
  gray_desat = (max(img, [], 3) + min(img, [], 3)) / 2;

  % Display results
  figure;

  subplot(2,2,1);
  imshow(img);
  title("Original RGB");

  subplot(2,2,2);
  imshow(gray_avg);
  title("Grayscale - Average");

  subplot(2,2,3);
  imshow(gray_lum);
  title("Grayscale - Luminosity");

  subplot(2,2,4);
  imshow(gray_desat);
  title("Grayscale - Desaturation");
end

