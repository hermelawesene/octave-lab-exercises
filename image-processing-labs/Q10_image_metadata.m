function info = Q10_show_metadata(infile)
  info = imfinfo(infile);
  disp(info);
  % Simple display of key fields if present
  if isfield(info, 'FileSize')
    fprintf('File size: %d bytes\n', info.FileSize);
  end
  if isfield(info, 'ColorType')
    fprintf('Color space/type: %s\n', info.ColorType);
  end
  if isfield(info, 'Width')
    fprintf('Resolution: %dx%d\n', info.Width, info.Height);
  end
  if isfield(info, 'FileModDate')
    fprintf('File modified: %s\n', info.FileModDate);
  end
end
