clc;
clear all;
close all;
A=input('Enter 3x3 matrix only')%asking matrix input for A of size 3x3 only
x=size(A);%gets the size of matrix A
if x==[3 3]%checks if the size of matrix A is 3x3
    %if matrix size of A is 3x3, it proceeds with below statements
    B=input('Enter another 3x3 matrix only')%asking matrix input for B of size 3x3 only
    y=size(B);%gets the size of matrix B
        if y==[3 3]%checks if the size of matrix B is 3x3
            %if matrix size of B is 3x3, it proceeds with below statements
            %since matrices sizes are equal, all the below statements are executed without any error
            K=A+B   %adds matrices A & B as defined in mathematics
            L=A-B   %subtracts matrix B from matrix A as defined in mathematics
            M=A*B   %multiplies matrices A & B as defined in mathematics
            N=A.*B  %multiplies matrices A & B element by element
            O=A/B   %divides matrix A by matrix B as defined in mathematics
            P=A./B  %divides matrix A by matrix B element by element
            C=[A;B] %concatenates matrix A with matrix B vertically/row-wise
            E=[A B] %concatenates matrix A with matrix B horizontally/column-wise
        else
            %if matrix size of B is not 3x3, it executes the below statement
            disp('Invalid entry for matrix B. Expected 3x3 matrix only.')
        end %nested if ends here
else
    %if matrix size of B is not 3x3, it executes the below statement
    disp('Invalid entry for matrix A. Expected 3x3 matrix only.')
end %if ends here