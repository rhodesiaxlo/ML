close all;clc;clear

% 加载数据, 画出图形
load('ex4data1.mat'); % load x 5000*400 y 5000*1
load('ex4weights.mat'); % load theta1 25*401 theta2 10*26
inputLayerSize = 400;
hiddenLayerSize = 25;
outputLabelSize = 10;

%displayData(X);

fprintf('Program paused. Press enter to continue.\n');
pause;

% lambda = 0, 验证 cost function
%% 为了验证cost function 的正确性, 我们使用了一直的 theta 计算,对比取预期结果
%% 排除了 lambda 的干扰
lambda = 0
theta = [Theta1(:);Theta2(:)];
J = nncostFunc(theta,inputLayerSize, hiddenLayerSize, outputLabelSize, X, y,lambda)

fprintf(['Cost at parameters (loaded from ex4weights): %f '...
         '\n(this value should be about 0.28763)\n'], J);
fprintf('Program paused. Press enter to continue.\n');
pause;

# lambda = 1, 验证 regularization
lambda = 1
J = nncostFunc(theta,inputLayerSize, hiddenLayerSize, outputLabelSize, X, y,lambda)

fprintf(['Cost at parameters (loaded from ex4weights): %f '...
         '\n(this value should be about 0.383770)\n'], J);

fprintf('Program paused. Press enter to continue.\n');
pause;

% 验证 sigmoidGradient
fprintf('\nEvaluating sigmoid gradient...\n')

g = sigmoidGradient([1 -0.5 0 0.5 1]);
fprintf('Sigmoid gradient evaluated at [1 -0.5 0 0.5 1]:\n  ');
fprintf('%f ', g);
fprintf('\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

% lambda = 0,验证BP
% 验证 cost func lambda =0 
%      cost func lambda = 1
% 现在验证 gradient 是否可以正确计算, 运用微分知识
checkNNGradient;

# lambda = 1, 验证BP
lambda = 1;
checkNNGradient(lambda);


# 训练

options = optimset('MaxIter', 50);
% Create "short hand" for the cost function to be minimized
costFunction = @(p) nncostFunc2(p, ...
                                   inputLayerSize, ...
                                   hiddenLayerSize, ...
                                   outputLabelSize, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[neuralNetworkParameters, cost] = fmincg(costFunction, theta, options);

% Obtain Theta1 and Theta2 back from neuralNetworkParameters
Theta1 = reshape(neuralNetworkParameters(1:hiddenLayerSize * (inputLayerSize + 1)), ...
                 hiddenLayerSize, (inputLayerSize + 1));

Theta2 = reshape(neuralNetworkParameters((1 + (hiddenLayerSize * (inputLayerSize + 1))):end), ...
                 outputLabelSize, (hiddenLayerSize + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 9: Visualize Weights =================
%  You can now "visualize" what the neural network is learning by 
%  displaying the hidden units to see what features they are capturing in 
%  the data.

fprintf('\nVisualizing Neural Network... \n')

displayData(Theta1(:, 2:end));

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ================= Part 10: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);