 % P1 - Yusuf Khan – 2165474 – ykhan4@cougarnet.uh.edu
% ENGI 1331H, Landon - Due Friday, February 3rd @ 11:59AM 

%% 
% Section 4: Anonymous Functions 

% Task 4.0 
clc, clear, close

%% Task 4.1 
disp('-Task 4.1-----------------------------------------------------');
disp(' ');
Fxn = @(t) 7*sin(2*t); %[m/s]
Fxn_2 = @(u) abs(7*sin(2*u)); 
disp('Building Function...')

disp(' ');

%% Task 4.2 
disp('-Task 4.2-----------------------------------------------------');
disp(' ');
V_four = Fxn(4);

fprintf('When t = 4 seconds v(t) = %4.2f [m/s] \n', V_four);
disp(' ');

%% Task 4.3 
disp('-Task 4.3-----------------------------------------------------');
disp(' ');
disp('Plotting...');

Array_t = linspace(0,5,150);
Array_newT = linspace(0,3.5,1000);

hold on

x = linspace(0,5,33);
y = 0;

plot(Array_t,Fxn(Array_t),"LineWidth",4)
scatter(x,y,Marker="_",MarkerEdgeColor="red")

xlabel("Time [s]");
ylabel("Velocity [m/s]");
title("Velocity vs. Time");

hold off
disp(' ');

%% Task 4.4 
disp('-Task 4.4-----------------------------------------------------');
disp(' ');
z = find(Fxn(Array_newT) < 0);
z = [z(1,1),z(1,end)];
minz = Array_newT(z(1,1));
maxz = Array_newT(z(1,end));
fprintf('Within the first 3.5 [s], mass has a negative velocity between %4.2f [s] and %4.2f [s] \n', minz,maxz);
disp(' ');

%% Task 4.5 
disp('-Task 4.5-----------------------------------------------------');
disp(' ');
q = integral(Fxn,0,6);
fprintf('The position of the mass at t = 6 seconds is %4.2f [m] \n', q)

disp(' ');

%% Task 4.6 
disp('-Task 4.6-----------------------------------------------------');
disp(' ');
tPs = (integral(Fxn_2,0,2.7));
fprintf('The distance traveled by the mass from 0 to 2.7 seconds is %4.2f [m] \n', tPs)

disp(' ');

%% Task 4.7 
disp('-Task 4.7-----------------------------------------------------');
disp(' ');
% If the mass attached to the spring is 1.25 kg, calculate the kinetic energy at t = 5.1 seconds.
%Display the value to two decimal places and include units. Hint: 𝐾𝐸=1/2*m*v^2

KE = (1/2)*1.25*(Fxn(5.1)^2);
fprintf('If the mass attached to the spring is 1.25 kg, the kinetic energy at t = 5.1 is %4.2f [(kg*m^2)/s^2] \n', KE);
