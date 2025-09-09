function isPal = palindrome_check(str)
  str = lower(str);
  str = regexprep(str, '[^a-z0-9]', ''); % remove non-alphanumerics
  isPal = strcmp(str, fliplr(str));
end

