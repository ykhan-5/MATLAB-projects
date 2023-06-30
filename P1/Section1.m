%%% P1 - Yusuf Khan – 2165474 – ykhan4@cougarnet.uh.edu
% ENGI 1331H, Landon - Due Friday, February 3rd @ 11:59AM 

%% 
% Section 1 – CHEE Data Analysis

clc, clear, close
load('Matrices.mat');

%Task 1.1
disp('-Task 1.1-----------------------------------------------------');
disp(' ');
disp('Reading Matrix in...');
disp(' ');

RxnD = readmatrix("Reaction.xlsx");

%Task 1.2 
disp('-Task 1.2-----------------------------------------------------');
disp(' ');

startT = RxnD(1,1)*86400;

deltaT = (RxnD(:,1)* 86400) - startT; 

fFive = deltaT(1:5,1);
lFive = deltaT(end-5:end,1);

disp('The first 5 values of delta time are ' );
disp(fFive);
disp('The last 5 values of delta time are ' );
disp(lFive);
disp(' ');

%Task 1.3
disp('-Task 1.3-----------------------------------------------------');
disp(' ');
start_sixT = find(RxnD(:,2)==60);
[rows_sixT,col_sixT] = size(start_sixT);
fprintf('The number of measurements that contain the default measurement for both the BOND and URH concentrations is %d rows \n', rows_sixT);
disp(' ');

%Task 1.4
disp('-Task 1.4-----------------------------------------------------');
disp(' ');
disp('Plotting.....');
disp(' ');


scatter(deltaT,RxnD(:,2)); %BOND
hold on
scatter(deltaT,RxnD(:,3)); %URH 

xlim([0 440])
ylim([50 220])
xlabel('Time [s]')
ylabel('Concentration [M]')
title('Reaction of BOND and URH vs Time');

legend('BOND','URH')

[MixTime,ConcURH] = min(RxnD(1:100,3));
minVal = min(RxnD(:,3));

s = scatter(ConcURH,MixTime,SizeData=70, MarkerFaceColor=[0 0 0], Marker="diamond");

legend('BOND','URH','Time of Mixing')

hold off 

%Task 1.5
disp('-Task 1.5-----------------------------------------------------');
disp(' ');
fprintf('Mixing occured %4.3f minutes after start of measurement collection. \n',MixTime/60);
disp(' ');

%Task 1.6 
disp('-Task 1.6-----------------------------------------------------');
disp(' ');

v = round(MixTime-1);
v_nr = MixTime-1;
ConcURH_before = (RxnD(v,3)); %finds a concentration of URH right before mixing 
indexURH = find(RxnD(:,3) == ConcURH_before); 

indexConcBOND_after = find(round(RxnD(:,2)) == round(ConcURH_before)); %finds the indexes where URH concentration = BOND concentration 
indexBOND = indexConcBOND_after(1,1); %finds the 1st index of when BOND = the URH concentration 
comp_t = ((RxnD(indexBOND,1)*86400)-v_nr)/60; %in terms of minutes 

fprintf('The time it took for the experiment to reach completion is %4.3f [min]\n', comp_t);
disp(' ');

%Task 1.7
disp('-Task 1.7-----------------------------------------------------');
disp(' ');


shut_t =  RxnD(start_sixT(1,1),1)*(86400/60);      %time when we start to get 60
time_e = shut_t - comp_t ;
fprintf('Between experiment completion and equiptment being shut off, %4.3f [min] elapsed \n', time_e);



