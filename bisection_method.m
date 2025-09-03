function root = bisection_method(f, a, b, tol, max_iter)
  if f(a) * f(b) > 0
    error("f(a) and f(b) must have opposite signs");
  end

  for i = 1:max_iter
    c = (a + b) / 2;
    if abs(f(c)) < tol || (b - a) / 2 < tol
      root = c;
      return;
    end

    if f(c) * f(a) < 0
      b = c;
    else
      a = c;
    end
  end
  root = (a + b) / 2;
end

