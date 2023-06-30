clc
close all
clear

%Project 3 (Section3) – Yusuf Khan – 2165474 – ykhan5@cougarnet.uh.edu - Prof.Landon

%Section 3
fprintf("Project 3 (Section3)  – Yusuf Khan – 2165474 – ykhan5@cougarnet.uh.edu - Prof.Landon \n\n")

pause(.2)
fprintf('Section3: Axial Stress die to a Distributed Axial Force \n');
pause(.2);
fprintf('-------------------------------------------------------- \n \n \n')

pause(.7);
%% Uner Inputs

%length input
l = input('Please input the length: ');

%width input
w = input('Please input the width: ');

%height input
h = input('Please input the height: ');

%user input axial distributed force [N]
TAF = input('\n\nInput total axial distributed force [N]: ');


%Total force Calculation
TStress=TAF/(w*h);

%Read in beam diagram
Original = imread('Beam Diagram.jpg');
BeamD = Original; %bc you are changing, and may not want to change original file. 

%% Image Dimentions

%"The inside of the beam image that will be colored begins at [20,20] and
%ends at [950, 160]"

Dimi = size(BeamD);

%seperate into individual dimentions
SLength = Dimi(2) - (20+(Dimi(2)-950));
SWidth = Dimi(1) - (20+(Dimi(1)-160));

PD = zeros(SWidth,SLength);
CBeam = BeamD;

for i = 1:SWidth
    for w = 1:SLength
        PD(i,w,:) = w;
    end
end


%pixels to the distance [m]
Dist = (PD/SLength)*l; % beam length is the total # of pixles that make up the beam

%Stress, Ultimate Tensile(UTS), and %Stress(PStress)
StressE = (TAF.*(1-(Dist./l)));

UTS = 400*(10^6); %[N/m^2]

StressP = (StressE./UTS).*100;

%runs through pixels to change colors
for i = 1:SWidth
    for w = 1:SLength

        if StressP(i,w)<30
            %green
            CBeam(i+20,w+20,:) = [0,255,17];

        elseif StressP(i,w) > 30 && StressP(i,w) <= 60
            %yellow
            CBeam(i+20,w+20,:) = [255,255,0];

        elseif StressP(i,w) > 60 && StressP(i,w) <= 90
            %orange
            CBeam(i+20,w+20,:) = [255,171,0];

        elseif StressP(i,w) > 90 && StressP(i,w) <= 100
            %red
            CBeam(i+20,w+20,:) = [255,0,0];

        else %StressP(i,w) > 100
            %purple
            CBeam(i+20,w+20,:) = [154,0,255];

        end
    end
end

pause(.5);
fprintf('\n\nDisplaying the result...\n(Look up!)')

%and the result iss....
pause(.2);
figure(200)
imshow(CBeam);
colorbar;

%send to file 
imwrite(CBeam,'Color-Coded Image.jpg');


