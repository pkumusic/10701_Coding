addpath helper

binary_lr = false;                                                                    
[train,test] = load_train_test(binary_lr);

train.y = train.y + 1; % make labels 1-based.
c = length(unique(train.y));

num = 10;
err = zeros(num,1);
for i = 1:num
  W = rand(size(train.X,1),c) * 1e-3;
  err(i) = grad_check(@oracle_mlr, W, train.X(:,1:100), train.y(1:100));
end

err
if mean(err) < 1e-6
  fprintf('Pass!\n');
else
  fprintf('Fail\n');
end
