   %% P1 - Yusuf Khan – 2165474 – ykhan4@cougarnet.uh.edu
% ENGI 1331H, Landon - Due Friday, February 3rd @ 11:59AM 

%%
% Section 2 : Matrix Manipulation

clc, clear, close
matrixA = readmatrix('matrixA.txt');
matrixB = readmatrix('matrixB.txt');

disp('-Task 2.1-----------------------------------------------------');

matrixA;
matrixB;

fprintf('The size of Matrix A is: %d by %d \n',size(matrixA));
disp(' ');
fprintf('The size of Matrix A is: %d by %d \n',size(matrixB));
disp(' ');
fprintf('The maximum of Matrix A is %d and the minimum value is %d \n',max(max(matrixA)),min(min(matrixA)));
disp(' ');
fprintf('The third row of Matrix B is as follows:');
disp(matrixB(3,:));

negative_count = matrixA < 0;
sum_n = sum(sum(negative_count));
fprintf('The Matrix A contains %d negative numbers. \n ', sum_n);
disp(' ');
sum_cornersB = matrixB(1,1)+ matrixB(1,end)+matrixB(end,1)+ matrixB(end,end);
fprintf('The sum of the four corners of matrix B is %d \n', sum_cornersB);

%% Task 2.2
disp('-Task 2.2-----------------------------------------------------');

%matrixC = matrixB * matrixA
matrix_C = matrixA * matrixB;
disp(matrix_C);
% Why did the second example not recieve an errors? 
%   This is because when multiplying two matrices, we must be sure that the
%   first matrice's number of coloums is equal to the number of rows of the
%   second matrix. Which in the first case (%matrixC = matrixB * matrixA) is not true. 

%% Task 2.3
disp('-Task 2.3-----------------------------------------------------');

minC_R3 = min(matrix_C(3,1:end));
maxC_C5 = max(matrix_C(1:end,5));

disp(' ');
disp("The minimum value of the third row of MatrixC is " + minC_R3);
disp("The maximum value of the 5th Column of MatrixC is " + maxC_C5);

disp(' ');


%% Task 2.4
disp('-Task 2.4-----------------------------------------------------');
disp(' ');

Equation_GasShift = [-1 -1 1 1 0 0;-1 0 0 1 -1 1;0 -1 1 0 1 -1]
disp(' ')


%% Task 2.5
disp('-Task 2.5-----------------------------------------------------');
disp(' ');
% Basically if u add row 2+3 of Eq_GS u will get out R1, so the one vector (R1) is independant of the other two. 

r = rank(Equation_GasShift);

disp ("The rank of the gas shift equation is " + r);
disp(' ');
disp('This rank makes sense because one row of this set is a combination of the two others.')
disp(' ');

%% Task 2.6 
disp('-Task 2.6-----------------------------------------------------');
disp(' ');

MatrixE = [1 2 -3; 4 -5 -6; -7 8 9];
disp(MatrixE);
MatrixE2 = [1;2;3];
disp(MatrixE2);


%% Task 2.7 
disp('-Task 2.7-----------------------------------------------------');

MatrixV = [1 1 1; 2 1 1 ; 3 3 4];
MatrixVs = [187 ; 364 ; 564];

MatrixANSWER = linsolve(MatrixV,MatrixVs);



Students = MatrixANSWER(1);
disp(' ');
disp(' ');

format short

disp('# Students = ')
disp(Students);

TA = MatrixANSWER(2);
disp('# TAs = ');
disp(round(TA));

Profs = MatrixANSWER(3);
disp('# Proffessors =')
disp(round(Profs))


