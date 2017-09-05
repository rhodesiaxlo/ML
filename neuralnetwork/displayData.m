function displayData(X)
	% 从X中随机取100条数据
	sel = randperm(size(X, 1));
	sel = sel(1:100);

	% 取前 100 条数据, 即 100*400
    X = X(sel,:);

    % 计算矩阵的维度
    [r, c] = size(X);

    % 计算图形的宽度
    example_width = round(sqrt(size(X, 2)));
    example_height = c/example_width;

    %计算显示宽度
    display_rows = floor(sqrt(r));
    display_columns = ceil(r/display_rows);

    % 创建图形pathch
    pad = 1;
    display_array = -ones(pad + display_rows * (example_height + pad), ...
                          pad + display_columns * (example_width + pad));

    % Gray Image
	colormap(gray);

    % 渲染像素
    for i=1:display_rows
    	for j=1:display_columns
    		display_array(pad + (i-1) * (example_height + pad) + (1:example_height), ...
    			          pad + (j-1) * (example_width + pad) + (1:example_width)) = reshape(X((i-1)*display_columns+j,:), example_height, example_width);
    	end
   	end

   	% Display Image
	h = imagesc(display_array);

	% Do not show axis
	axis image off

	drawnow;


end