function feature = Get_Feature( patch )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
    [num, pow_ps] = size(patch);
     
    patch_size = pow_ps^0.5;
   
    if patch_size == 7
        lr_cut = [2:6 8:42 44:48]; 
        feature = zeros(num, 45);
        for i = 1 : num
            lr_patch = patch(i, :);
            lr_patch = reshape(lr_patch, 7, 7);
            new_lr_patch = lr_patch(lr_cut);
            new_lr_patch = double(new_lr_patch);
            patch_mean = mean2(new_lr_patch);
            feature(i, :) = reshape(new_lr_patch - patch_mean, 1, 45);
        end
    else
        feature = zeros(num, 81);
        for i = 1 : num
            hr_patch = patch(i, :);
            hr_patch = reshape(hr_patch, 21, 21);
            new_hr_patch = hr_patch(7:15, 7:15);
            new_hr_patch = double(new_hr_patch);
            feature(i, :) = reshape(new_hr_patch, 1, 81);
        end
        
    end

end

