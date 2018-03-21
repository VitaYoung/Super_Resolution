function Clusting( feature )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    opts = statset('Display', 'iter', 'MaxIter', 1000, 'UseParallel', 1);
    [IDX, C] = kmeans(feature, 512, 'options', opts);

    save('../lib/center.mat', 'C');
end

