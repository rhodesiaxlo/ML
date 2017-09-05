function [J, grand] = nncostFunc(theta, inputLayerSize, hiddenLayerSize, outputLabelSize, X, y, lambda)
	% 根据 nn network的 costfunction = -y*log(a)-(1-y)*log(1-a) 可知
	J = 0;
	% unroll theta
	% theta1 25*401 theta2 10*26
	theta1 = reshape(theta([1:(inputLayerSize+1)*hiddenLayerSize]), ...
		             hiddenLayerSize, ...
		             inputLayerSize +1);
	theta2 = reshape(theta((inputLayerSize +1 )*hiddenLayerSize + [1:(hiddenLayerSize+1)*outputLabelSize]),...
		             outputLabelSize, ...
		             hiddenLayerSize +1);

	% 计算 cost 
	[r, c] = size(X);
	a1 = [ones(r, 1) X];

	z1 = a1*theta1';
	a2 = sigmoid(z1);
	a2 = [ones(r,1) a2];
	z2 = a2*theta2';
	a3 = sigmoid(z2);

	% 因为 y 是 5000*1 的阵列, 需要转化矩阵的形式
	y = eye(outputLabelSize)(y,:);

	% 计算 cost function
	J = -y.*log(a3)-(1-y).*log(1-a3); % 确保 cost function 为正, 检查矩阵乘法规则
	J = sum(sum(J,2))/r;

	regTerm = sum(sum(theta1(:,2:end).^2,2)) + sum(sum(theta2(:,2:end).^2, 2));
	regTerm = lambda*regTerm/(2*r);

	J = J + regTerm;
    
    % 计算 gradient 
    % 使用 for 循环,可以拆分为行向量,方便排查错误
   	X = [ones(r, 1) X];
   	G1 = zeros(size(theta1));
   	G2 = zeros(size(theta2));

    for i=1:r
    	% 计算 rz2  ra2 rz3 a3 
    	ra1 = X(i,:)';
    	rz2 = theta1*ra1;
    	ra2 = sigmoid(rz2);
    	ra2 = [1;ra2];
    	rz3 = theta2*ra2;
    	ra3 = sigmoid(rz3);

    	rerror3 = y(i,:)' - ra3;
    	rerror2 = (theta2'*rerror3)(2:end,1).*sigmoidGradient(rz2);

    	G1 = G1 - rerror2*ra1';
    	G2 = G2 - rerror3*ra2';

   	end
	Theta1_grad = G1 / r + lambda * [zeros(hiddenLayerSize, 1) theta1(:, 2:end)] / r;
	Theta2_grad = G2 / r + lambda * [zeros(outputLabelSize, 1) theta2(:, 2:end)] / r;

	% Unroll gradients
	grand = [Theta1_grad(:) ; Theta2_grad(:)];
	%grand = 0;
end