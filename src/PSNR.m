function [ output ] = PSNR( input_img1, input_img2 )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

    flag = size(input_img1);
    if numel(flag) > 2
        input_img1 = rgb2ycbcr(input_img1);
        input_img1 = input_img1(:,:,1);
        input_img2 = rgb2ycbcr(input_img2);
        input_img2 = input_img2(:,:,1);
    end

    X = double(input_img1);
    Y = double(input_img2);
    
    [M, N] = size(X);
    
    sum = 0;
    
    for i = 1 : M
        for j = 1 : N
            sum = sum + (X(i,j) - Y(i,j))^2;
        end
    end
    
   
    MSE = double(sum/(M*N));
    
    output = 20*log10(double(255/((MSE)^0.5)));

end

