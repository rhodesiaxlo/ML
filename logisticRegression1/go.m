# load data
data = load('data.txt');
X = data(:,[1,2]); % matrics 
y = data(:,[3]); % vector

# plot data
plotData(X,y)

# calculate cost function and gradient descent
[r, c] = size(X);
X = [ones(r,1) X];
initTheata = zeros(c+1, 1);
[cost,gradient]  = costFunc(initTheata,X,y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', gradient);
 
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

# calc optTheta with fminunc function
options = optimset('GradObj','on',"MaxIter",400);

%[optTheta,funcVal,exitFlag] = fminunc(@(t)(costFunc(t,X,y)),initTheata, options)
[theta, cost, exitFlag] = fminunc(@(t)(costFunc(t, X, y)), initTheata, options)

# plot descion boundary
plotDecisionBoundary(theta,X,y)

# calc accurancy base on our train data
# test data

prob = sigmoid([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

close;