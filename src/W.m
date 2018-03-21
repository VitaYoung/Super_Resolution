function [ output ] = W( input )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
    x = abs(input);
    
    if (0 <= x && x <= 1)
        output = double(1.5 * (x^3) - 2.5 * (x^2) + 1);
    elseif (1 < x && x <= 2)
        output = double(-0.5 * (x^3) + 2.5 * (x^2) - 4 * x + 2);
    else
        output = 0;
    end

end

