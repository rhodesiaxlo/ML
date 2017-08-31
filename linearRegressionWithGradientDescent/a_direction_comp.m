function d = a_direction_comp(y, x, a, c)
    d = sum(2*(y - a * (x .^ 2) - c) .* (-2 * x .^ 2));
end
