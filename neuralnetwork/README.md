## 神经网络实现，本地以训练神经网络识别图片数字 0-9 数字为0 ，详细展示神经网络的实现过程
# 0.该神经网络是3层结构，一个input layer（400 features), 一个 hidden layer (25 unit) ,和一个output layers (10 units)
# 1.数据集合  ex4data1.mat定义X变量和y变量，X变量是  5000*400的矩阵，每一行代表 20*20 像素的图片, y 变量是 5000*1 的列向量，表示每一个图片对应的数字
# 2.数据集 ex4weights.mat 定义了 θ1 和 θ2 2个变量，分别表示从 inputlayer -> hiddenlayer 和从 hiddenlayer -> outputlayer 的 weightmatrics, θ1 的 dimention是25*401
# 意味着是 hiddenLayerUnitsNumber * (inputFeatureNumber + 1), θ2的 dimention 是 10*26 ,以为着是 hiddenLayerUnitsNumber*(outputLayerUnitsNumber+1)

### 此处的维度很重要，神经网络的 vectorize 使用到 matric multiplycation. 需要考虑到矩阵的维度和方向

# 3.步骤：1.加载数据集合 ex4data1.mat ，选取前100行数据，显示 25*25的图像阵列，每个图片的像素是25*25 
#         2.FB,计算 costfunction

···
   初始化 cost = 0
   for i=1:numberOfTrainningSet
        % 增加 bias 列向量
        % a1 = x1
        % z2 = a1 * theta
        % a2 = sigmoid(z2)
        % z3 = a2 * theta2
        % a3 = sigmoid(z3)
        根据 logictic function 的 cost function 表达式  cost = -y.*sigmoid(a)-(1-y).*sigmoid(a),计算 cost
        % 因为 a3 最后计算出来的结果是一个 1*10的行向量，而y 是一个singlge value,因此有必要把single value 转化为对应的行向量进行 cost 计算
        %
   end
   % 对 cost 矩阵进行求和运算 sum(sum(matrics, 2), 因为 sigmoid(a) 是一个 5000 *（25+1）的行向量，所以，我们需要把 y 5000*1 列向量进行转化
   % eye(10)(y,:) 将数字对应到不同的 label 里面去，然后使用 element wise 操作 y.*sigmoid(a)+(1-y).*sigmoid(1-a)
   % 因为 cost 是一个 single value,最后还要进行一次求和运算, -sum(sum(costfuction)), 整个过程使用 vectorize ,没有 forloop 循环
   % 最后，加上 1/(2*λ）*（sum(sum(θ1(:,2:end))).^2+sum(sum(θ2(:,2:end))).^2)
   %% question: why bias term not regularized ? regularization is based on the idea that overfitting on y is caused by non-bias term too spedific,
   %% while bias has no business with this, so we exclude bias temr from regularization.
```
        3.计算 δ，利用 BP 求解 min(cost)， 调参
···
为什么要计算 δ，δ是什么含义
根据神经网络的模型可以知道 从 第l层 传导 到第 l+1 层 包含 input x 中间参数 z, 激活值a, 以及激活函数f()
数学模型为 a(l+1) = f(z(l+1)) 
           z(l+1) = w(l)x + b(l)

根据 GD, 求解 a(l+1) 对 w(l) 和 b(l) 的偏导数 得到  d(a(l+1))/d(w(l)) = d(a(l+1))/d(z(l+1))*d(z(l+1))/d(w)

记 d(a(l+1))/d(z(l+1)) 为 δ(l+1) 
   d(z(l+1))/d(w) 为 x 或者 a(l)

同理可以推导 δ(l) = d(a(l+1))/d(z(l+1))*d(z(l+1))/d(a(l)).*d(a(l))/d(z(l))
其中 d(a(l+1))/d(z(l+1)) = δ(l+1)
     d(z(l+1))/d(a(l)) = W(l)
     d(a(l))/d(z(l)) = f(z(l))‘

总结解释： δ(l) = δ(l+1).W(l)f(z(l))’

这样就求解出了所有的 δ, 然后回到第一个偏导方程  d(a(l+1))/d(w(l)) = δ(l+1)*a(l)
根据 GD 方法 w:=w - α * gradient 收敛参数w
```
      4. 计算 λ , regularization
