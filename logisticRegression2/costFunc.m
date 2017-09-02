function [cost, grad] = costFunc(theta, X, y, lambda)
	% 机器学习, 对于原因和结果我们不能确切说明他们之前的关系
	% 但是二者一定有内在关联, 可以使用机器学习来找出这种关联
	% 进而对未来的数据判断作出依据

	% sigmoid 函数 hypothesis 解释
	% possibility >= 0.5 判断为 positive
	% possibility < 0.5  判断为 negative

	% sigmoid 函数  1/(1+e^tx)

	% 根据图形可以判断,decision boundary 为直线 (如果特征集合太多了无法做图,该如何确定decision boundary)?
	% 因此 tx 应该未形如 theta0 + theta1 * x1 + theta2 * x2 的形式

	% (考虑到常数项的情况,还要对 X 进行拓展)

    % hypothesis = sigmoid(theta*x)
    % costfunction = -(y*log(sigmoid(hypothesis))+(1-y)*(log(1-hypothesis))

    cost = 0;
    hypothesis = zeros(size(X,1),1);

    hypothesis = sigmoid(X*theta);
    cost = y.*log(hypothesis)+(1-y).*log(1-hypothesis);
    cost = (-1/size(X,1))*sum(cost);  % is a number not a vector

    costRegularizationTerm = lambda/(2*length(y)) * sum( theta(2:end).^2 );

    cost = cost + costRegularizationTerm;

    r = size(X,1);
    grad = zeros(size(theta),1);  % 这里是 zeros 而不是 ones

    % gradient 

   	for i=1:length(y)
   		% element wise and matrics wise
   		% update simudaniously
   		% 该公式比较复杂
   		% 这里的 gradient 是什么意思 ? 梯度的求解是从 2 个维度上来进行打
   		% 数据集的角度, n 个数据集 m 个特征
   		grad = grad + (hypothesis(i) - y(i))*(X(i,:)');
   	end

   	grad = 1/length(y) * grad;

    gradientRegularizationTerm = lambda/length(y) * [0; theta(2:end)];

    grad = grad + gradientRegularizationTerm;

end