% Returns the function and gradient evaluated at w. 
% w: (d+1) x 1
% X: (d+1) x n
% y: 1 x n
function [f, g] = oracle_lr(w, X, y)

f = 0;
g = zeros(size(w));
lambda = ones(size(w)) * 10; % used in Q2.2.7
lambda(1) = 0; % do not penalize the bias term

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete the function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Calculate Log Likelihood 
%f = y * X.' * w + sum(log(sigmoid(-X.' * w)));
%g = X * (y - (1 - sigmoid(-w.' * X))).';

% l2 regulated
f = y * X.' * w + sum(log(sigmoid(-X.' * w))) - sum(lambda .* w .* w)/2;
g = X * (y - (1 - sigmoid(-w.' * X))).' - lambda .* w; %(d+1) * 1



