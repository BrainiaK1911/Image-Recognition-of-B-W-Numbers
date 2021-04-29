zero = imread("TimesNewRoman_Zero.jpg");
zero_g = rgb2gray(zero);
fft_zero = log(1+abs(fftshift(fft2(zero_g))));
imshow(fft_zero,[])
one = imread("TimesNewRoman_One.jpg");
one_g = rgb2gray(one);
fft_one = log(1+abs(fftshift(fft2(one_g))));

two = imread("TimesNewRoman_two.jpg");
two_g = rgb2gray(two);
fft_two = log(1+abs(fftshift(fft2(two_g))));

three = imread("TimesNewRoman_three.jpg");
three_g = rgb2gray(three);
fft_three = log(1+abs(fftshift(fft2(three_g))));

four = imread("TimesNewRoman_four.jpg");
four_g = rgb2gray(four);
fft_four = log(1+abs(fftshift(fft2(four_g))));

five = imread("TimesNewRoman_five.jpg");
five_g = rgb2gray(five);
fft_five = log(1+abs(fftshift(fft2(five_g))));

six = imread("TimesNewRoman_six.jpg");
six_g = rgb2gray(six);
fft_six = log(1+abs(fftshift(fft2(six_g))));

seven = imread("TimesNewRoman_seven.jpg");
seven_g = rgb2gray(seven);
fft_seven = log(1+abs(fftshift(fft2(seven_g))));

eight = imread("TimesNewRoman_eight.jpg");
eight_g = rgb2gray(eight);
fft_eight = log(1+abs(fftshift(fft2(eight_g))));

nine = imread("TimesNewRoman_nine.jpg");
nine_g = rgb2gray(nine);
fft_nine = log(1+abs(fftshift(fft2(nine_g))));
