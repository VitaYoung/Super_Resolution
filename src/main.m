function main( )
%UNTITLED8 此处显示有关此函数的摘要
%   此处显示详细说明
    psnr = zeros(1,14);
    ssim = zeros(1,14);
    
    temp = func('../Set14/baboon.bmp');
    psnr(1) = temp(1);
    ssim(1) = temp(2);
    temp = func('../Set14/barbara.bmp');
    psnr(2) = temp(1);
    ssim(2) = temp(2);
    temp = func('../Set14/bridge.bmp');
    psnr(3) = temp(1);
    ssim(3) = temp(2);
    temp = func('../Set14/coastguard.bmp');
    psnr(4) = temp(1);
    ssim(4) = temp(2);
    temp = func('../Set14/comic.bmp');
    psnr(5) = temp(1);
    ssim(5) = temp(2);
    temp = func('../Set14/face.bmp');
    psnr(6) = temp(1);
    ssim(6) = temp(2);
    temp = func('../Set14/flowers.bmp');
    psnr(7) = temp(1);
    ssim(7) = temp(2);
    temp = func('../Set14/foreman.bmp');
    psnr(8) = temp(1);
    ssim(8) = temp(2);
    temp = func('../Set14/lenna.bmp');
    psnr(9) = temp(1);
    ssim(9) = temp(2);
    temp = func('../Set14/man.bmp');
    psnr(10) = temp(1);
    ssim(10) = temp(2);
    temp = func('../Set14/monarch.bmp');
    psnr(11) = temp(1);
    ssim(11) = temp(2);
    temp = func('../Set14/pepper.bmp');
    psnr(12) = temp(1);
    ssim(12) = temp(2);
    temp = func('../Set14/ppt3.bmp');
    psnr(13) = temp(1);
    ssim(13) = temp(2);
    temp = func('../Set14/zebra.bmp');
    psnr(14) = temp(1);
    ssim(14) = temp(2);
    
    disp(psnr);
    disp(ssim);
    disp(mean(psnr));
    disp(mean(ssim));
    
end

