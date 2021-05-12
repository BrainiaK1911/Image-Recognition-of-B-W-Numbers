%% PART 1: IMAGES AND THEIR FREQUENCY SPECTRUMS

% POSITION

position1 = imread('C:\Users\chiub\Downloads\SquareLeft.jpg');
position2 = imread('C:\Users\chiub\Downloads\SquareRight.jpg');
position3 = imread('C:\Users\chiub\Downloads\SquareDown.jpg');

figure(1)

subplot(3,2,1)
imshow(position1)

subplot(3,2,2)
imshow(image_2dfft(position1), [])

subplot(3,2,3)
imshow(position2)

subplot(3,2,4)
imshow(image_2dfft(position2), [])

subplot(3,2,5)
imshow(position3)

subplot(3,2,6)
imshow(image_2dfft(position3), [])

sgtitle('Frequency Domain Depending on Position', 'FontSize', 24)

% COLOR

blacksquare = imread('C:\Users\chiub\Downloads\BlackSquare.jpg');
greensquare = imread('C:\Users\chiub\Downloads\GreenSquare.jpg');
bluesquare = imread('C:\Users\chiub\Downloads\BlueSquare.jpg');

figure(2)

subplot(3,2,1)
imshow(blacksquare)

subplot(3,2,2)
imshow(image_2dfft(blacksquare), [])

subplot(3,2,3)
imshow(greensquare)

subplot(3,2,4)
imshow(image_2dfft(greensquare), [])

subplot(3,2,5)
imshow(bluesquare)

subplot(3,2,6)
imshow(image_2dfft(bluesquare), [])


sgtitle('Frequency Domain Depending on Color', 'FontSize', 24)

% ROTATION/SIZE

rotatedsquare = imread('C:\Users\chiub\Downloads\RotatedSquare.jpg');
smallsquare = imread('C:\Users\chiub\Downloads\SmallSquare.jpg');
enlargedsquare = imread('C:\Users\chiub\Downloads\enlargedsquare.jpg');

figure(3)

subplot(3,2,1)
imshow(rotatedsquare)

subplot(3,2,2)
imshow(image_2dfft(rotatedsquare), [])

subplot(3,2,3)
imshow(smallsquare)

subplot(3,2,4)
imshow(image_2dfft(smallsquare), [])

subplot(3,2,5)
imshow(enlargedsquare)

subplot(3,2,6)
imshow(image_2dfft(enlargedsquare), [])

sgtitle('Frequency Domain Depending on Rotation and Size', 'FontSize', 24)

%% PART 2: IMAGE RECOGNITION USING FFT


% DATABASE INITIALIZATION

% Read jpg files from each folder and location of each font folder
arial = dir('C:\Users\chiub\Downloads\Numbers_Arial\*.jpg');
segoe = dir('C:\Users\chiub\Downloads\Numbers_SegoeScript\*.jpg');
times = dir('C:\Users\chiub\Downloads\Numbers_TimesNewRoman\*.jpg');
courier = dir('C:\Users\chiub\Downloads\Numbers_CourierNew\*.jpg');

% Results in a 10x4 matrix 
fonts = [arial segoe times courier]';

% Used later in results 
font_names = ["Arial" "Segoe Script" "Times New Roman" "Courier"];

% Gets rows and columns for database 
[r,c] = size(fonts);

fourier_table = zeros(r,c); % Initialized with zero and will later store similarity coefficients

% INPUT
bold_input = imread('C:\Users\chiub\Downloads\yellowbold-09.jpg');   % Load the input image
resized_input = imresize(bold_input,[370 280]);                       % Resize input image to fit dimensions of table FFTs. 
bold_result = image_2dfft(resized_input);                           % Find image's 2D FFT

% RECOGNITION

% Find FFTs for each image
for i = 1:r % Fonts
    for j = 1:c % Numbers
           img = imread(fullfile(fonts(i,j).folder, fonts(i,j).name));  % Read each image from the database given folder and name 
           fft_iter = image_2dfft(img);                                 % Get image's 2-D FFT for each image
           fourier_table(i,j) = corr2(bold_result, fft_iter);           % Add 2-D correlation coefficient between input and current image's FFT to the table
    end
end

% Finds highest coefficient in entire table
maxcoef = max(max(fourier_table));

% a = Row of highest coefficient
% b = Column of highest coefficient
[a,b] = find(fourier_table == maxcoef);

percent = maxcoef*100;

% RESULTS

figure(4) % The input and its Frequency Domain

% Image in BW (Resized)
subplot(2,2,1)
imshow(rgb2gray(resized_input));
title('Input Image (in BW)')

% Frequency Domain of Image
subplot(2,2,2)
imshow(bold_result, []);
title('Input Frequency Domain')

% Found Number
subplot(2,2,3)
final_match = imread(fullfile(fonts(a,b).folder, fonts(a,b).name));
imshow(final_match);
title("Result: " + font_names(a) + " (" + round(percent,2) + "% Match)")

% Domain of Number
subplot(2,2,4)
imshow(image_2dfft(final_match), []);
title('Result Frequency Domain') 

sgtitle("Here is what your input matches with:", 'FontSize', 24); 


%% RESOURCES

% https://www.mathworks.com/help/images/ref/corr2.html
% https://www.youtube.com/watch?v=On5ydo7dB5o 
