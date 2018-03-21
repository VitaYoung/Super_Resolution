function hr = Generate_HR( lr )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
    lr = padarray(lr, [2,2], 'replicate', 'both');
    
    lr_patches = Cutting(lr, 7);
    
    lr_features = Get_Feature(lr_patches);
    
    load('../lib/coef.mat');
    
    for i = 1 : 512
        coef(:, :, i) = Coef(:, :, i)';
    end
    
    load('../lib/center.mat');
    
    [patch_num, patch_size_pow] = size(lr_patches);
    
    [lr_height, lr_width] = size(lr);
    
    h_num = lr_height - 7 + 1;
    w_num = lr_width - 7 + 1;
    
    hr = zeros((lr_height - 4) * 3, (lr_width - 4) * 3);
    count = zeros((lr_height - 4) * 3, (lr_width - 4) * 3);
    
    
    for i = 1 : patch_num
        lr_patch = lr_features(i, :);
        temp = repmat(lr_patch, 512, 1);
        diff = temp - C;
        diff = diff.^2;
        distance = sum(diff, 2);
        [~, id] = min(distance);
        hr_patch = lr_patch * coef(:, :, id);
        lr_cut = [2:6 8:42 44:48];
        lr_temp = lr_patches(i,:);
        lr_temp = lr_temp(lr_cut);
        lr_temp = double(lr_temp);
        lr_mean = mean(lr_temp);
        hr_patch = reshape(hr_patch, 9, 9) + lr_mean;
        
        
        r = ceil(i/w_num);
        c = mod(i - 1, w_num) + 1;
        
        rh = (r - 1) * 3 + 1;
        rh1 = rh + 9 - 1;
        ch = (c - 1) * 3 + 1;
        ch1 = ch + 9 - 1;
        
        hr(rh : rh1, ch : ch1) = hr(rh : rh1, ch : ch1) + hr_patch;
        count(rh : rh1, ch : ch1) = count(rh : rh1, ch : ch1) + 1;
    end
        
    hr = hr ./ count;
    hr = uint8(hr);

end

