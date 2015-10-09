function err = grad_check(oracle, t, varargin)

h = 1e-6;
d = length(t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete the function
% Hint: Use [f,g] = oracle(t, varargin{:}) to call oracle with the rest of the
% parameters
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for lr
% [~,g] = oracle(t, varargin{:});
% %t --> w, varargin{1} --> X, varargin{2} --> y
% g_hat = zeros(d,1);
% for i = 1:d
%     hi = zeros(d,1);
%     hi(i) = h;
%     [f2,~] = oracle(t + hi, varargin{:});
%     [f1,~] = oracle(t - hi, varargin{:});
%     g_hat(i) = (f2 - f1)/(2 * h);
% end
% err = sum(abs(g_hat - g));
% err = err / d;

% for mlr
[~,g] = oracle(t, varargin{:});
%t --> W, varargin{1} --> X, varargin{2} --> y
[d,c] = size(t);
g_hat = zeros(d,c);
for i = 1:d
    for j = 1:c
        hij = zeros(d,c);
        hij(i,j) = h;
        [f2,~] = oracle(t + hij, varargin{:});
        [f1,~] = oracle(t - hij, varargin{:});
        g_hat(i,j) = (f2 - f1)/(2 * h);
    end
end
err = sum(abs(g_hat(:) - g(:)));
err = err / (d*c);
