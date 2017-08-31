function result = mse(y, x, a, c)
    result = 0;
    for i=1:size(x, 1)  % could be done with matrices, but I prefer to be clear
        result = result + (y(i) - (a * x(i)^2 + c))^2;
    end
    result = result / size(x, 2);
end
