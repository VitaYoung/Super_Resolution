function SR_main( impath )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
    tic;
    f = imread(impath);
    
    f = double(f);
    
    win = zeros(9, 9);    
    
    center = (9 - 1) / 2 + 1;
    for i = 1 : 9
        for j = 1 : 9
            win(i,j) = exp(-((i - center)^2 + (j - center)^2) /(2 * 1.2^2)) / (2 * pi * 1.2^2);
        end
    end

    win = win/sum(sum(win));
    
    [h, w, d] = size(f);
    
    if d == 1
        f = filter_2d(win, f);
        lr = bicubic(f, floor(h/3), floor(w/3));
        hr = Generate_HR(lr);
    else
        
        r = f(:, :, 1);
        r = filter_2d(win, r);
        g = f(:, :, 2);
        g = filter_2d(win, g);
        b = f(:, :, 3);
        b = filter_2d(win, b);
        
        r = bicubic(r, floor(h/3), floor(w/3));
        g = bicubic(g, floor(h/3), floor(w/3));
        b = bicubic(b, floor(h/3), floor(w/3));
        
        lr(:, :, 1) = r;
        lr(:, :, 2) = g;
        lr(:, :, 3) = b;
        
        temp = rgb2ycbcr(lr);
        temp2 = temp(:, :, 1);
        hr(:, :, 1) = Generate_HR(temp2);
        
        [nh, nw] = size(hr(:, :, 1));
        hr(:, :, 2) = bicubic(temp(:, :, 2), nh, nw);
        hr(:, :, 3) = bicubic(temp(:, :, 3), nh, nw);
        hr = ycbcr2rgb(hr);
    end
    figure, imshow(uint8(f));
    figure, imshow(lr);
    figure, imshow(hr);
    imwrite(hr, '../Set14/zebra_sr.bmp');
    toc;
end

