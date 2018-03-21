function  [output] = func( impath )
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
    f = imread(impath);
    
    flag = size(f);
    
    output = zeros(1, 2);
    
    figure, imshow(f);
    
    if numel(flag) > 2
        r = f(:,:,1);
        g = f(:,:,2);
        b = f(:,:,3);
    
        [m,n] = size(r);
    
        r = bicubic(r, round(m/3), round(n/3));
        g = bicubic(g, round(m/3), round(n/3));
        b = bicubic(b, round(m/3), round(n/3));

        temp(:, :, 1) = r;
        temp(:, :, 2) = g;
        temp(:, :, 3) = b;
        
        figure, imshow(temp);
        
        input2(:,:,1) = bicubic(r, m, n);
        input2(:,:,2) = bicubic(g, m, n);
        input2(:,:,3) = bicubic(b, m, n);

        figure, imshow(input2);
        output(1) = PSNR(f, input2);
        output(2) = SSIM(f, input2);
        

        
    else
        [m,n] = size(f);
        input1 = bicubic(f, round(m/3), round(n/3));
        figure, imshow(input1);
        input2 = bicubic(input1, m, n);
        figure, imshow(input2);
        output(1,1) = PSNR(f, input2);
        output(1,2) = SSIM(f, input2);
    end
        
end

