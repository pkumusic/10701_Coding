% Returns the accuracy of binary classifier w
% w: (d+1) x 1
% X: (d+1) x n
% y: 1 x n
function acc = binary_accuracy(w, X, y)

pred = zeros(size(y));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TODO: Complete this function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nacc = sum(y == pred);
acc = nacc / length(y);
