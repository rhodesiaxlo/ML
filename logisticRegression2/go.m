% load data
data = load('data.txt');
X = data(:,[1,2]); % matrics 
y = data(:,[3]); % vector

% plot data
plotData(X,y)

% map feature
X = mapFeature(X);

% calc cost function and gradient
initTheta = zeros(size(X,2),1);
lambda = 1;
[cost, gradient] = costFunc(initTheta, X, y, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', gradient);
 
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

% gradient descent with fminunc function
options = optimset('GradObj','on','MaxIter','400');
[optTheta, funcVal, exitFlag] = fminunc(@(t)(costFunc(t,X,y,lambda)), initTheta, options)

% plot decision boundary
plotDecisionBoundary(optTheta, X, y);

% predict

% accuracy



% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
