function [mean_val, median_val, mode_val] = statistics(data)
  mean_val = mean(data);
  median_val = median(data);

  % Mode (manual to avoid built-in mode())
  uniq = unique(data);
  counts = histc(data, uniq);
  [~, idx] = max(counts);
  mode_val = uniq(idx);
end

