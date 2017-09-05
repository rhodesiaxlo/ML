function numgrad = computeGradient(J, param)
	numgrad = zeros(size(param));
	numpert = zeros(size(param));

	% 循环遍历 theta, 微调, 计算 grad 值
	e = 1e-4;

	for i=1:length(param)
		% 设置微变量
		numpert(i) = e;

		% 修改原始 thete
		loss1 = J(param + numpert);   %!!!
		loss2 = J(param - numpert);   %!!!
		numgrad(i) = (loss1 - loss2)/(2*e);

		% 还原微变量
		numpert(i) = 0;
	end

	%numgrad = zeros(size(param));
	%perturb = zeros(size(param));
	%e = 1e-4;
	%for p = 1:numel(param)
	    % Set perturbation vector
	%    perturb(p) = e;
	%    loss1 = J(param - perturb);
	%    loss2 = J(param + perturb);
	    % Compute Numerical Gradient
	%    numgrad(p) = (loss2 - loss1) / (2*e);
	%    perturb(p) = 0;
	%end

end