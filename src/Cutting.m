function patch = Cutting( src, patch_size )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

    patch_size_half = (patch_size - 1) / 2;
    
    [h, w, d] = size(src);
    
    if patch_size == 21
        if d == 3
            src = rgb2ycbcr(src);
            src = src(:, :, 1);
        end
        nh = h - mod(h,3);
        nw = w - mod(w,3);
        new_src = src(1 : nh, 1 : nw);
        [h, w] = size(new_src);
    end
    
   
    
    if patch_size == 21
        num = ((h - patch_size)/3 + 1) * ((w - patch_size)/3 + 1);
    else
        num = (h - patch_size + 1) * (w - patch_size + 1);
    end
    
    patch = zeros(num, patch_size * patch_size);
    
    flag = 1;
    
    if patch_size == 7
        for i = patch_size_half + 1 : h - patch_size_half
            for j = patch_size_half + 1 : w - patch_size_half
                temp_patch = src(i - patch_size_half : i + patch_size_half, j - patch_size_half : j + patch_size_half);
                temp_patch = reshape(temp_patch, 1, patch_size * patch_size);
                patch(flag, :) = temp_patch;
                flag = flag + 1;
            end
        end
    else
        for i = patch_size_half + 1 : 3 : h - patch_size_half
            for j = patch_size_half + 1 : 3 : w - patch_size_half
                temp_patch = src(i - patch_size_half : i + patch_size_half, j - patch_size_half : j + patch_size_half);
                temp_patch = reshape(temp_patch, 1, patch_size * patch_size);
                patch(flag, :) = temp_patch;
                flag = flag + 1;
            end
        end
    end
    
end

