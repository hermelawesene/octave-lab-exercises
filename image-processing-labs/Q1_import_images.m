function Q1_import_images(folder_path)
  % Get all files in directory
  files = dir(fullfile(folder_path, '*.*'));
  valid_ext = {'.png', '.jpg', '.jpeg', '.bmp'};

  for i = 1:length(files)
    [~, name, ext] = fileparts(files(i).name);
    if ismember(lower(ext), valid_ext)
      img_path = fullfile(folder_path, files(i).name);
      try
        img = imread(img_path);
        figure;

        subplot(1,3,1);
        imshow(img, []);
        colormap gray; colorbar;
        title([name ' - Grayscale']);

        subplot(1,3,2);
        imshow(img, []);
        colormap hot; colorbar;
        title([name ' - Hot']);

        subplot(1,3,3);
        imshow(img, []);
        colormap jet; colorbar;
        title([name ' - Jet']);

      catch err
        fprintf("Error reading %s: %s\n", img_path, err.message);
      end
    end
  end
end

