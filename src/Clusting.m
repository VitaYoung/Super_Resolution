function Clusting( feature )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    opts = statset('Display', 'iter', 'MaxIter', 1000, 'UseParallel', 1);
    [IDX, C] = kmeans(feature, 512, 'options', opts);

    save('../lib/center.mat', 'C');
end

