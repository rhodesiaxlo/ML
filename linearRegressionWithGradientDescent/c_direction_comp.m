
% MSE derivative with respect to b:sum{2[y-f(x)*(-1)]}

function d= c_direction_comp(y,x,a,c)
    d = sum(2*(y-a*x.^2-c).*(-1))
end
