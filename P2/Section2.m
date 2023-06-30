
%% Honors ENGI 1331 Exam 1 - Yusuf Khan – ykhan4@uh.edu - 2165474

% Section 2 

%% 
% Task 2.0 

clc, clear, close all


%% 
% Task 2.1 
standard = imread('Standards.jpeg');

%% 
% Task 2.2

%Separating the layers of original image 
Red = standard(:,:,1);
Green = standard(:,:,2);
Blue = standard(:,:,3);

%plotting under figure202
figure(202)

subplot(1,4,1)
imshow(standard)
title('Original')
colorbar

subplot(1,4,2)
imshow(Red)
title('Red Layer');
colorbar

subplot(1,4,3)
imshow(Green)
title('Green Layer');
colorbar

subplot(1,4,4)
imshow(Blue)
title('Blue Layer');
colorbar


%pause to allow viewer to see original 
pause(2);



%% 
% Task 2.3 

%plotting under figure203

figure(203)
PlotSUB3(1,6,1,standard) %User defines fxn --> [first three variables are basically subplot, last is name of image variable]
title('Orignal');

%masks created from looking at figure 202
Rmask = Red>110 & Green<110 & Blue<80;
subplot(1,6,2)
imshow(Rmask)
title('2209');

Gmask = Red<150 & Blue<50;  
subplot(1,6,3)
imshow(Gmask)
title('3256');

Pmask = Red<200 & Green<50 & Blue>150;
subplot(1,6,4)
imshow(Pmask)
title('4112');

Bmask = Red<40 & Green>130 & Blue>200;
subplot(1,6,5)
imshow(Bmask);
title('9532');

origin = Red<230 & Red >190 & Green<230 & Green>180 & Blue>20;
subplot(1,6,6)
imshow(origin)
title('Sample Origin')

%% 
%Task 2.4 

%Rf = Distance traveled by species from origin / Distance traveled by
%solvent from origin 

%Ditance given for Solvent = 620 Pixels 
%by five samples so -->

DisGiven = 620; %[Pixels] 


Rf2209 = ((DisGiven/5)*4)/DisGiven;  %[Pixels] / [Pixels] --> Units Cancel 
Rf3256 = ((DisGiven/5)*3)/DisGiven;
Rf4112 = ((DisGiven/5)*2)/DisGiven;
Rf9532 = ((DisGiven/5)*1)/DisGiven;


fprintf('Displaying the Retention Factors for each chemical species: \n \n')
fprintf('Compound Name \t \t Retension Factors \n');
fprintf('%s \t \t %4.2f \n','UH-2209',Rf2209);
fprintf('%s \t \t %4.2f \n','UH-3256',Rf3256);
fprintf('%s \t \t %4.2f \n','UH-4112',Rf4112);
fprintf('%s \t \t %4.2f \n\n\n\n','UH-9532',Rf9532);


%%
%Task 2.5 

HowMany = input('How many compounds do you need to check? \n');

for i = 1:HowMany
        
    Choice = input('\nEnter the measures retention factor:');
    
    if Choice <= Rf2209+0.05 && Choice >= Rf2209-0.05

        fprintf('The compound is UH-2209\n') 

    elseif Choice <= Rf3256+0.05 && Choice >= Rf3256-0.05

        fprintf('The compound is UH-3256\n') 

    elseif Choice <= Rf4112+0.05 && Choice >= Rf4112-0.05

        fprintf('The compound is UH-4112\n') 

    elseif Choice <= Rf9532+0.05 && Choice >= Rf9532-0.05

        fprintf('The compound is UH-9532\n') 

    elseif Choice < 0 || Choice > 1

        fprintf(2,'The entered Rf value is not physically possible. Double check your measurements and calculations!\n')
   
    else
        
        fprintf('Unknown Compund. Not present in the standards. \n');
    
    end
        
end





