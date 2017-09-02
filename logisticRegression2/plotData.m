function plotData(X,y)
    % 画图, p = 1 用 o 表示, p = 0 用 + 表示

    posindex = find(y==1);
    negindex = find(y==0);

    figure
    hold on

    plot(X(posindex, 1), X(posindex,2), "bo")
    plot(X(negindex, 1), X(negindex,2), "r+")

    hold off;