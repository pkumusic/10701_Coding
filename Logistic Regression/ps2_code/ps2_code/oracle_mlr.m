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
%Y = full(sparse(y, 1:length(y), 1)); % c x n note: this doesn't always
%output c * n matrix



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete this function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[d,n] = size(X); % d: #features, n: #data
[~,c] = size(W); % c: #classes
Y = zeros(c,n);
for i = 1:n
    Y(c,i) = 1;
end

for cc = 1:c
    cal1 = W(:,cc).' * X; % 1 * n
    f = f + cal1 * Y(cc,:).'; % scalar
end
sum1 = sum(exp(W.' * X), 1); % 1 * n
sum2 = sum(log(sum1)); % scalar
f = f - sum2;

for cc = 1:c 
    nom = exp(W(:,cc).' * X); % 1 * n
    tmp1 = nom ./ sum1; % 1 * n
    tmp2 = Y(cc,:) - tmp1; % 1 * n
    tmp3 = repmat(tmp2, d, 1) .* X; % d * n
    g(:,cc) = sum(tmp3, 2); % d * 1
    g(:,cc) = g(:,cc);%- Lambda(:,cc) .* W(:,cc); %l2-regularization
    %g(:,cc) = X * Y(:,cc) - sum(repmat(exp(W(:,cc).' * X),d,1) .* X ./ repmat(sum(exp(W.' * X), 1),d,1),2);
end
% l2-regularization
f = f - sum(sum(Lambda .* W .* W))/2; 
g = g - Lambda .* W;



% % calculate f
% for i = 1:n
%     cc = y(n); % current class
%     f = f + W(:,cc).' * X(:,i);
%     for cl = 1:c
%         sum = exp(W(:,cl).' * X(:,i));
%     end
%     f = f - log(sum);    
% end
% %l2 regularization goes here
% 
% 
% % calculate g(j,c)
% for i = 1:n %current data
%     for cc = 1:c % current class
%         for j = 1:d % current feature
%             % first
%             if y(i) == cc
%                 g(j,c) = g(j,c) + X(j,i);
%             end
%             % second
%             for cl = 1:c
%                 t1 = 1 / exp(W(:,cl).' * X(:,i));
%             end
%             data_class = y(i);
%             t2 = exp(W(:,data_class).' * X(:,i));
%             t3 = X(j,i);
%             g(j,c) = g(j,c) - t1 * t2 * t3;
%         end
%     end
% end





