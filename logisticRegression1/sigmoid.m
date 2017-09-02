function g = sigmoid(z)
    g = zeros(size(z), 1);
    g = 1./(1 + e.^(-z));
