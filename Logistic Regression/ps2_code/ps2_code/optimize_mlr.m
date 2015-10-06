% Use gradient descent/ascent to optimize the mlr objective
% W0: (d+1) x c
% X:  (d+1) x n
% y:  1 x n
function W = optimize_mlr(W0, X, y)

step = 0.00001;
max_iter = 1000;

W = W0;
f_prev = 0;

fprintf('%16s iter %16s f %16s eps %16s ||W||^2\n', '', '', '', '');
for k = 1:max_iter

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
  % TODO: Complete this function
  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  eps = abs((f - f_prev) / f_prev);
  fprintf('%21d %18g %20g %24g\n', k, f, eps, sum(sum(W.^2)));
  if eps <= 1e-4
    break
  end
  f_prev = f;
end

