function saved = Q7_download_images(urls, outdir)
  % urls: cellstr or char (single URL)
  % Uses urlwrite (Octave). Ensure 'outdir' exists.
  if ischar(urls), urls = {urls}; end
  if ~isfolder(outdir), mkdir(outdir); end
  saved = {};
  for i=1:numel(urls)
    try
      [~,name,ext] = fileparts(urls{i});
      if isempty(ext), ext = '.jpg'; end
      outfile = fullfile(outdir, sprintf('%s_%03d%s', name, i, ext));
      urlwrite(urls{i}, outfile);     % In MATLAB: websave(outfile, urls{i})
      saved{end+1} = outfile;
      try
        I = imread(outfile); figure; imshow(I); title(outfile);
      catch err
        fprintf(2,'Downloaded but display failed (%s): %s\n', outfile, err.message);
      end
    catch err
      fprintf(2,'Download failed for %s: %s\n', urls{i}, err.message);
    end
  end
end
