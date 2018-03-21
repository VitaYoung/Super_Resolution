function [ output ] = SSIM( input_img1, input_img2 )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
    flag = size(input_img1);
    
    if numel(flag) > 2
        input_img1 = rgb2ycbcr(input_img1);
        input_img1 = input_img1(:,:,1);
        input_img2 = rgb2ycbcr(input_img2);
        input_img2 = input_img2(:,:,1);
    end
    
    X = double(input_img1);
    Y = double(input_img2);
    
    w = zeros(11, 11);
    
    center = (11 - 1) / 2 + 1;
    for i = 1 : 11
        for j = 1 : 11
            w(i,j) = exp(-((i - center)^2 + (j - center)^2) /(2 * 1.5^2)) / (2 * pi * 1.5^2);
        end
    end
    w = w/sum(sum(w));
    
    k1 = 0.01;
    k2 = 0.03;
    L = 255;
    c1 = (k1 * L)^2;
    c2 = (k2 * L)^2;
    
  
    
    ua = filter2d(w, X);
    ub = filter2d(w, Y);
    ua_sq = ua.*ua;
    ub_sq = ub.*ub;
    ua_ub = ua.*ub;
    siga_sq = filter2d(w, X.*X) - ua_sq;
    sigb_sq = filter2d(w, Y.*Y) - ub_sq;
    sigab = filter2d(w, X.*Y) - ua_ub;
    
    
    output = mean2(((2 * ua_ub + c1) .* (2 * sigab + c2)) ./ ((ua_sq + ub_sq + c1) .* (siga_sq + sigb_sq + c2)));

end

