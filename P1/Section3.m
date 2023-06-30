 %% P1 - Yusuf Khan – 2165474 – ykhan4@cougarnet.uh.edu
% ENGI 1331H, Landon - Due Friday, February 3rd @ 11:59AM 


%% 
% Section 3 : Arrhenius Equation & Linear Regression Statistics 

clc, clear, close

%% Task 3.1 

Data = readmatrix("ArrheniusData.csv");

%% Task 3.2
Exp1 = Data(:,1:2);
Exp2 = Data(:,3:4);
Exp3 = Data(:,5:6);


format long


%% Task 3.3

%% Experiment 1 
% x = 1/T
x1 = 1./Exp1(:,1);

%y = ln(k)
y1 = [log(Exp1(:,2))];

%x^2
x1_square = x1.*x1;

%y^2
y1_square = y1.*y1;

%x*y
x1_mult_y1 = x1.*y1;

%Combine1 
NewExp1 = [x1 , y1 , x1_square , y1_square , x1_mult_y1];

%% 
% Experiment 2 

% x = 1/T
x2 = 1./Exp2(:,1);

%y = ln(k)
y2 = [log(Exp2(:,2))];

%x^2
x2_square = x2.*x2;

%y^2
y2_square = y2.*y2;

%x*y
x2_mult_y2 = x2.*y2;

%Combine2
NewExp2 = [x2 , y2 , x2_square , y2_square , x2_mult_y2];

%% 
% Experiment 3

% x = 1/T
x3 = 1./Exp3(:,1);

%y = ln(k)
y3 = [log(Exp3(:,2))];

%x^2
x3_square = x3.*x3;

%y^2
y3_square = y3.*y3;

%x*y
x3_mult_y3 = x3.*y3;

%Combine3 
NewExp3 = [x3 , y3 , x3_square , y3_square , x3_mult_y3];

%% 
% Combine123 

NewDataTable = [NewExp1 , NewExp2 , NewExp3];
%disp(NewDataTable);


%% 
% Create plot to see if linear 
hold on

scatter(NewExp1(:,1),NewExp1(:,2),40,'diamond');
scatter(NewExp2(:,1),NewExp2(:,2),40);
scatter(NewExp3(:,1),NewExp3(:,2),40,'square');



%% Task 3.4
% Finding Slope for lines 1 + 2 + 3 

n = length(x1);

m1 = (n*(sum(x1_mult_y1))-(sum(x1)*sum(y1)))/(n*sum(x1_square)-((sum(x1)^2)));
m2 = (n*(sum(x2_mult_y2))-(sum(x2)*sum(y2)))/(n*sum(x2_square)-((sum(x2)^2)));
m3 = (n*(sum(x3_mult_y3))-(sum(x3)*sum(y3)))/(n*sum(x3_square)-((sum(x3)^2)));

disp('-----m-----------')
fprintf('Slope 1: %4.2f \n', m1);
fprintf('Slope 2: %4.2f \n', m2);
fprintf('Slope 3: %4.2f \n', m3);
disp(' ');

b1 = (sum(y1)-(m1*sum(x1)))/(n);
b2 = (sum(y2)-(m2*sum(x2)))/(n);
b3 = (sum(y3)-(m3*sum(x3)))/(n);

disp('-----b-----------')
fprintf('Intercept 1: %4.2f \n', b1);
fprintf('Intercept 2: %4.2f \n', b2);
fprintf('Intercept 3: %4.2f \n', b3);
disp(' ');

%% Task 3.5
% Check with polyfit


disp('--------polyfit------')

%
f1 = polyfit (x1,y1,1);
fprintf('Experiment 1 Coefficients: %4.2f (m) and %4.2f (b) \n', f1);

ff1 =  @(x) f1(1,1).*(x) + f1(1,2);
plot(x1,ff1(x1),"LineWidth",2);

%
f2 = polyfit (x2,y2,1);
fprintf('Experiment 2 Coefficients: %4.2f (m) and %4.2f (b) \n', f2);

ff2 =  @(x) f2(1,1).*(x) + f2(1,2);
plot(x2,ff2(x2),"LineWidth",2);

%
f3 = polyfit (x3,y3,1);
fprintf('Experiment 3 Coefficients: %4.2f (m) and %4.2f (b) \n', f3);

ff3 =  @(x) f3(1,1).*(x) + f3(1,2);
plot(x3,ff3(x3),"LineWidth",2,"Color","black");

legend("Experiment 1", "Experiment 2", "Experiment 3",'Polyfit Exp1','Polyfit Exp2','Polyfit Exp3');

xlabel('!/T');
ylabel('ln(K)');
title('Arrhenius equation');

hold off 

disp(' ');
disp('--------Activation Energy ------')

R = 8.314;
AE1 = -1*(m1*R);
AE2 = -1*(m2*R);
AE3 = -1*(m3*R);

fprintf('Experiment 1 Activation Energy: %4.2d \n', AE1);
fprintf('Experiment 2 Activation Energy: %4.2d \n', AE2);
fprintf('Experiment 3 Activation Energy: %4.2d \n', AE3);
disp(' ');

disp('-------- Constant A ------')
CA1 = exp(b1);
fprintf('Experiment 1 Constant A: %4.2d \n', CA1);
CA2 = exp(b2);
fprintf('Experiment 2 Constant A: %4.2d \n', CA2);
CA3 = exp(b3);
fprintf('Experiment 3 Constant A: %4.2d \n', CA3);
disp(' ');


disp('-------- r^2 Values ------')


r1 = ((n*(sum(x1_mult_y1)))-((sum(x1)*sum(y1))))/((((n*(sum(x1_square)))-((sum(x1)^2)))^.5)*(((n*(sum(y1_square)))-((sum(y1)^2)))^.5));
fprintf('Experiment 1 r^2 Value: %4.3f \n', r1*r1);

r2 = ((n*(sum(x2_mult_y2)))-((sum(x2)*sum(y2))))/((((n*(sum(x2_square)))-((sum(x2)^2)))^.5)*(((n*(sum(y2_square)))-((sum(y2)^2)))^.5));
fprintf('Experiment 2 r^2 Value: %4.3f \n', r2*r2);

r3 = ((n*(sum(x3_mult_y3)))-((sum(x3)*sum(y3))))/((((n*(sum(x3_square)))-((sum(x3)^2)))^.5)*(((n*(sum(y3_square)))-((sum(y3)^2)))^.5));
fprintf('Experiment 3 r^2 Value: %4.3f \n', r3*r3);

disp(' ');

disp('---Task 3.8--')
disp(['The coefficients of dermination tell us how close the data is to the ideal model that we created using ' ...
    'polyfit (or the calculations done in 3.3 and 3.4).']);

fprintf(['My R^2 values make sense because it seems as it experiment 2 is less' ...
    ' fitted to its line of best fit when compared to experiment 3, and reflectively, experiment 3s R value ' ...
    'is closser to one. Showing us from a purely visual point of view that the R^2 value can determine how wel data is' ...
    ' fitted to a line of best fit']);