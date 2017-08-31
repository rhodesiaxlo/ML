###

data = load($data_path)
x = data(:,2)
y = data(:,1)


function plotData(x,y)
    plot(x,y,'rx','MakerSize',8)
end

plotData(x,y)
xlabel('Rate of Cricket Chirping');%set th x-axis label
ylabel('Temperature in Degree Fahrenhelt');% set the y-axis label

m = length(x)

X = [ones(m,1) x]

% cacl theta with normal equation

theta = (pinv(X'*X))*X'*y

% plot fightre

hold on;
plot(x,X*theta,'-')
