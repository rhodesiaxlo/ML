function checkNNGradient(lambda)
	if ~exist('lambda', 'var') || isempty(lambda)
	    lambda = 0;
	end

    %检查 梯度是否正确计算,为了达到目的,需要控制其它所有变量
    
	input_layer_size = 3;
	hidden_layer_size = 5;
	num_labels = 3;
	m = 5;

	% 生成 input layer, hiddenlayer, outputlayer
	% 生成 theta1 ,theta12, 注意所有参数每次生成应该返回的结果应该是相同打
	theta1 = debugInitializeWeights(hidden_layer_size, input_layer_size);
	theta2 = debugInitializeWeights(num_labels, hidden_layer_size);
	X = debugInitializeWeights(m, input_layer_size-1);
	y = 1 + mod(1:m, num_labels);

	% 根据 cost function 计算 gradient, 比对通过微分法得到结果
	costFunc = @(p)nncostFunc(p, input_layer_size, hidden_layer_size, num_labels, X, y,lambda);

	param = [theta1(:);theta2(:)];

	[cost, grad] = costFunc(param);
	grad2 = computeGradient(costFunc, param);

	disp([grad2 grad]);
	fprintf(['The above two columns you get should be very similar.\n' ...
	         '(Left-Your Numerical Gradient, Right-Analytical Gradient)\n\n']);


	diff = norm(grad2-grad)/norm(grad2+grad);

	fprintf(['If your backpropagation implementation is correct, then \n' ...
	         'the relative difference will be small (less than 1e-9). \n' ...
	         '\nRelative Difference: %g\n'], diff);

end