function arr = quick_sort(arr)
  if length(arr) <= 1
    return;
  end
  pivot = arr(1);
  left = arr(arr < pivot);
  right = arr(arr > pivot);
  equal = arr(arr == pivot);
  arr = [quick_sort(left) equal quick_sort(right)];
end

