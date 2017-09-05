## 1.roll vector vs un-roll vector
垂直方向为正方向  roll unroll 互为逆向操作


## 2.neural architecture 

input layer size s(j)
hidden layer size s(j+1)

则参数矩阵的大小为 (s(j) +1) * s(j+1)
方向没有固定 

## 3.关于参数矩阵 theta(l, j, i)

## 4.关于初始化 Inputlayer 
```
X = [ones(size(X,1),1) X]
```

## 5.关于拼接
```
X = [a X]
X = [a;X]

```

## 6.关于 output layer > 1 的情况
output layer > 1 ,如何在 vectorization 中求解 costfunction

## 7. about lambda ,remove biads parameters

## 8.
```
G1 = zeros( size(Theta1) );
G2 = zeros( size(Theta2) );

for i = 1:numberOfTrainingExamples,
    ra1 = X(i, :)';

    rz2 = Theta1 * ra1;
    ra2 = sigmoid(rz2);
    ra2 = [1; ra2];

    rz3 = Theta2 * ra2;
    ra3 = sigmoid(rz3);

    err3 = ra3 - ry(i, :)';

    err2 = (Theta2' * err3)(2:end, 1) .* sigmoidGradient(rz2);

    G1 = G1 + err2 * ra1';
    G2 = G2 + err3 * ra2';
end
```

## 9.costfunction
costFunc = @(p) nncostFunction(p, input_layer_size, hidden_layer_size, ...
                               num_labels, X, y, lambda);

## 10.init parameters
rand() * 2 * episilon - episilon  
(-episilon, episilon)2 * episilon - episilon  
(-episilon, episilon)

## 10.visual theta1 的意义在哪里?

## 11.fminunc vs fmincg

## sum(matric, dimention)
## max(matric, [], dimention)
## eye(dimention)(matrics,:)


## 12.求解 求解 cost 直接 使用了vectorization ，求解 lambda 和 gradient 时候也可以使用vectorization，避免使用 for 循环，提高代码质量能？如果可以，该如何做？
fminunc fmincg 的实现逻辑是怎样的？  sigmoid 的cost function 不同于 linear regression 的 MSE(mean square error)，以为 sigmoid(x) > 0 and 0 < y < 1
所以 costfunction = -y*log(a)-(1-y)*log(1-a) 是一定为正数的(会影响到最后的 gradient 的正负号)
为什么 logistics regress 的 cost function 是除以 numberoffeature 但是 lambda 除以 2*numberoffeature
