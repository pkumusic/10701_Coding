% Oracle mlr returns the function and gradient evaluated at w. 
% W: (d+1) x c
% X: (d+1) x n
% y: 1 x n
function [f, g] = oracle_mlr(W, X, y)

f = 0;
g = zeros(size(W));
Lambda = ones(size(W)) * 10;
Lambda(1,:) = 0; % do not penalize the bias term

% Y(i,j) = 1 if y(j) == i, otherwise 0
Y = full(sparse(y, 1:length(y), 1)); % c x n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete this function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%f = trace(X.' * W * Y) - sum(log(sum(exp(W.' * X), 1)));
%f = f + lambda * trace(W * W.')/2 % l2-regularization
%g = g + X * Y'
%g = 

[d,n] = size(X); % d: #features, n: #data
[~,c] = size(W); % c: #classes

% calculate f
for i = 1:n
    cc = y(n); % current class
    f = f + W(:,cc).' * X(:,i);
    for cl = 1:c
        sum = exp(W(:,cl).' * X(:,i));
    end
    f = f - log(sum);    
end
%l2 regularization goes here


% calculate g(j,c)
for i = 1:n %current data
    for cc = 1:c % current class
        for j = 1:d % current feature
            % first
            if y(i) == cc
                g(j,c) = g(j,c) + X(j,i);
            end
            % second
            for cl = 1:c
                t1 = 1 / exp(W(:,cl).' * X(:,i));
            end
            data_class = y(i);
            t2 = exp(W(:,data_class).' * X(:,i));
            t3 = X(j,i);
            g(j,c) = g(j,c) - t1 * t2 * t3;
        end
    end
end





