
%% Honors ENGI 1331 Exam 1 - Yusuf Khan – ykhan4@uh.edu - 2165474


%%
% Task 1.0
clc, clear, close all

%% 
% Task 1.1

x = -2:.01:6;
y = x;
%y2 = x;

%% 
% Task 1.2 

R1 = x<=2; %creates logical array (1 1 1 1 1 0 0 0 0) %This is for increment by one 
R2 = x>2 & x<=4; %                (0 0 0 0 0 1 1 0 0) 
R3 = x>4; %                       (0 0 0 0 0 0 0 1 1) 

 
%do a mask 
y(R1) = exp(x(R1)-1); % Output: 0.0498    0.1353    0.3679    1.0000    2.7183    3.0000    4.0000    5.0000    6.0000 
y(R2) = (x(R2)).^2 + x(R2);
y(R3) = x(R3)./(x(R3)-7);

%Plotting figure102
figure(102)
plot(x,y);
xlabel('X');
ylabel('Y');
xlim([-2 6]); %just to set limits 
ylim([-10 20]);



%% 
% Task 1.3 

for i = x

    if i<=2

        y3 = exp(x(R1)-1);

    elseif i > 2 && i<=4

        y4 = (x(R2)).^2 + x(R2);

    elseif i > 4
    
        y5 = x(R3)./(x(R3)-7); 
    end

end 

yComb = cat(2,y3,y4,y5); %combines all three answer matrices into one

figure(103)
hold on 
plot(x,yComb,'black');
xlabel('X');
ylabel('Y');
xlim([-2 6]); 
ylim([-10 20]); %just to set limits 
hold off 


%%
%Task 1.4 
fprintf("Q: Which approach would you prefer? \n\n" + ...
    "I can definitely see the similarities in the approaches, however I would take the approach that uses forloops because \nto me it looks more like how I think " + ...
    "through a problem like this. The first approach is a little harder for me to grasp\nconceptually than the loops.\n")

