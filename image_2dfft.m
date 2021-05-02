function [result] = image_2dfft(image)
    img_fft = fft2(image);
    shift_input = fftshift(img_fft);
    result = log(1+abs(shift_input));
end
