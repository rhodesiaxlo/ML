function [cost, gradient] = costFunc(theta)
    cost = (theta(1) - 5)^2 + (theta(2) - 5)^2
    gradient = zeros(2,1)
    length = size(gradient)
    for i=1:length
    	gradient(i) = 2*(theta(i)-5)
   	end
end
