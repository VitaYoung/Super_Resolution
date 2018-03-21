function  Train_Center( )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    tic;
    sample = zeros(200000, 7*7);
    file_path = '../Train/';
    img_path_list = dir(strcat(file_path, '*.jpg'));
    img_num = length(img_path_list);
    sign = 1;
    for i = 1 : img_num
        image_name = img_path_list(i).name;
        image = imread(strcat(file_path, image_name));
        lr = HR_To_LR(image, 1.2);
        lr_patches = Cutting(lr, 7);
        [patch_num, size_pow] = size(lr_patches);
        if patch_num + sign > 200000
            sample(sign : 200000, :) = lr_patches(1 : 200000 - sign + 1, :);
            break;
        else
            sample(sign : sign + patch_num - 1, :) = lr_patches;
            sign = sign + patch_num;
        end 
    end
        
    lr_features = Get_Feature(sample);
    Clusting(lr_features);
    
    
    toc;
end

