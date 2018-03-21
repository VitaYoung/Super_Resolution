function  lr = HR_To_LR( hr, sigma)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    hr = double(hr);
    [h, w, d] = size(hr);
    hr_height = h - mod(h, 3);
    hr_width = w - mod(w, 3);
    new_hr = hr(1:hr_height, 1:hr_width, 1:d);
    lr_height = hr_height / 3;
    lr_width = hr_width /3;
    
    kernel_size = ceil(sigma * 3) * 2 + 1;
    
    win = zeros(kernel_size, kernel_size);    
    
    center = (kernel_size - 1) / 2 + 1;
    for i = 1 : kernel_size
        for j = 1 : kernel_size
            win(i,j) = exp(-((i - center)^2 + (j - center)^2) /(2 * sigma^2)) / (2 * pi * sigma^2);
        end
    end

    win = win/sum(sum(win));
    
    if d == 1
        temp_img = filter_2d(win, new_hr);
    elseif d == 3
        new_hr = rgb2ycbcr(new_hr);
        new_hr = new_hr(:, :, 1);
        temp_img = filter_2d(win, new_hr);
    end
    lr = bicubic(temp_img, lr_height, lr_width);
end

