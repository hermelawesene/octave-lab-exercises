function idx = binary_search(arr, target)
  low = 1;
  high = length(arr);
  idx = -1; % Not found

  while low <= high
    mid = floor((low + high) / 2);
    if arr(mid) == target
      idx = mid;
      return;
    elseif arr(mid) < target
      low = mid + 1;
    else
      high = mid - 1;
    end
  end
end

