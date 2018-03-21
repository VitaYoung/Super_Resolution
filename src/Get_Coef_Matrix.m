function  Get_Coef_Matrix( )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
    tic;
    lr_sample = zeros(2000000, 7*7);
    hr_sample = zeros(2000000, 21*21);
    file_path = '../Train/';
    img_path_list = dir(strcat(file_path, '*.jpg'));
    img_num = length(img_path_list);
    sign = 1;
    
    
    for i = 1 : img_num
        image_name = img_path_list(i).name;
        image = imread(strcat(file_path, image_name));
        image = double(image);
        lr = HR_To_LR(image, 1.2);
        lr_patches = Cutting(lr, 7);   
        hr_patches = Cutting(image, 21);
        
        
        [patch_num, size_pow] = size(lr_patches);

        if patch_num + sign > 2000000
            lr_sample(sign : 2000000, :) = lr_patches(1 : 2000000 - sign + 1, :);
            hr_sample(sign : 2000000, :) = hr_patches(1 : 2000000 - sign + 1, :);
            break;
        else
            lr_sample(sign : sign + patch_num - 1, :) = lr_patches;
            hr_sample(sign : sign + patch_num - 1, :) = hr_patches;
            sign = sign + patch_num;
        end 
    end
    
    lr_features = Get_Feature(lr_sample);
    hr_features = Get_Feature(hr_sample);
    
    for i = 1 : 2000000
        hr_old_features = hr_features(i, :);
        lr_temp = lr_sample(i, :);
        lr_temp = reshape(lr_temp, 7, 7);
        lr_cut = [2:6 8:42 44:48];
        lr_temp = lr_temp(lr_cut);
        lr_temp = double(lr_temp);
        lr_mean = mean2(lr_temp);
        hr_features(i, :) = hr_old_features - lr_mean;
    end
    
    load('../lib/center.mat');
    
    idx = zeros(2000000,1);
    
    for i = 1 : 2000000
        lr_patch = lr_features(i, :);
        temp = repmat(lr_patch, 512, 1);
        diff = temp - C;
        diff = diff.^2;
        distance = sum(diff, 2);
        [~, id] = min(distance);
        idx(i, 1) = id;
    end
    
    
    for i = 1  : 512
        Coef(:, :, i) = hr_features(idx == i, :)'/lr_features(idx == i, :)';
    end
     save('../lib/coef.mat', 'Coef');
     toc;
end

