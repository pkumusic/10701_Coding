% Use gradient descent/ascent to optimize the lr objective
% w0: (d+1) x 1
% X:  (d+1) x n
% y:  1 x n
function w = optimize_lr(w0, X, y)

step = 0.0001;
max_iter = 1000;

w = w0;
f_prev = 0;

fprintf('%16s iter %16s f %16s eps %16s ||w||^2\n', '', '', '', '');
for k = 1:max_iter

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
  % TODO: Complete this function
  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  eps = abs((f - f_prev) / f_prev);
  fprintf('%21d %18g %20g %24g\n', k, f, eps, dot(w,w));
  if eps <= 1e-4
    break
  end
  f_prev = f;
end
