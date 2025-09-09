function Q8_capture_camera(deviceIndex, brightness, contrast, outfile)
  % Requires the image-acquisition or video package (platform dependent).
  % Fallback: prints a note if not available.
  try
    pkg load image-acquisition
  catch
    warning('image-acquisition package not found. Trying video package...');
    try
      pkg load video
    catch
      error(['No camera acquisition package found. ' ...
             'Install "image-acquisition" or "video" package.']);
    end
  end

  try
    % image-acquisition style:
    vid = videoinput('v4l2', deviceIndex);            % adjust adaptor as needed
    src = getselectedsource(vid);
    try set(src, 'Brightness', brightness); catch, end
    try set(src, 'Contrast',   contrast);   catch, end
    start(vid); pause(0.5);
    frame = getsnapshot(vid);
    stop(vid); delete(vid);

    if nargin>3, imwrite(frame, outfile); end
    figure; imshow(frame); title('Captured frame');
  catch err
    error('Camera capture failed: %s', err.message);
  end
end
