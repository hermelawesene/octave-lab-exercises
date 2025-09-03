function C = matrix_multiply(A, B)
  [m, n] = size(A);
  [n2, p] = size(B);
  if n ~= n2
    error("Inner dimensions must match.");
  end

  C = zeros(m, p);
  for i = 1:m
    for j = 1:p
      for k = 1:n
        C(i,j) = C(i,j) + A(i,k) * B(k,j);
      end
    end
  end
end

