function out = mapFeature(X)
	% 根据图形判断是多项式,这里我们暂定为6次多项是
	out = ones(size(X(:,1)));
	degree = 6;
	for i=1:degree
		for j=0:i
			out(:,end+1) = (X(:,1).^(i-j)).*(X(:,2).^j);
		end
	end
end