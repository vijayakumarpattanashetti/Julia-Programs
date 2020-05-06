clc; close all; clear all; %[0 1 1 1;1 0 1 1;1 1 1 0;1 1 0 1]
P=input('Enter parity matrix of k rows only, P= '); %asks user input for parity matrix
[k,j]=size(P); %finds number of rows and columns in parity matrix
I=eye(k,k); %creates identity matrix of order kxk where k is number of rows in the parity matrix
G=cat(2,I,P) %computation of generator matrix using its matrix definition
v=1;
for v=1
R=input('Enter recived message sequence of length equal to number of columns of generator marix, R= '); %asks user input for received message vector
s=0:1; %binary i.e., 0s and 1s
idx=rem(nchoosek(0:2^k-1,k),2)+1; %modulo 2 for having only binary numbers
D=unique(s(idx),'rows'); %lists down all possible message vectors of k bits in ascending order, [D]
z=1;
C=[]; %initialization of code vector, [C]
for z=1:2^k %loop for computing all possible code vectors,[C] for each unique message vector, [D]
    y=1;
    d=[D(z)];
    for y=1:k-1
        d=cat(2,d,D(z+((2^k)*y))); %forming message vector, [D]
    end
    c=d*G; %computing code vector,[C] for a message vector,[D] using matrix definition i.e. [C]=[D]*[G]
    C=[C c]; %grouping all possible vectors together in an array
end
l1=length(C); %computes length of grouped codes array [C]
C=rem(C(1:l1),2); %converts array [C] into binary array using modulo 2
[m,n]=size(G); %finds number of rows and columns in generator matrix
C=transpose(reshape(C,n,[])) %puts all possible code vectors in a sequence corresponding to message vectors sequence
H=cat(2,transpose(P),eye(n-k,n-k)) %computes parity check matrix using matrix definition i.e. [H]=[transpose(P) : I(n-k)] i.e. concatenation of transpose of parity matrix and identity matrix of order (n-k) where n is number of columns in generator matrix
S=R*transpose(H); %computes syndrome, S using its matrix definition i.e. S=R*transpose(H) i.e. multiplication of received message vector with transpose of parity check matrix
l2=length(S); %finds length of syndrome vector
S=rem(S(1:l2),2) %converts the syndrome vector into binary syndrome vector
[~, rowloc] = ismember(S,transpose(H), 'rows') %locates the binary syndrome vector that is present as a row of transpose(H) matrix
if rowloc>0 %if the binary syndrome vector is present in any rows of the transpose(H)
    E=zeros(1,length(R));
    E(rowloc)=1; %identifying the error vector using its matrix definition i.e. only the rowloc th message bit in the received message vector has error i.e. only the rowloc th message bit of received message vector is taken as it is while others are made zeros in the error vector
    Cc=R+E; %corrected is then computed using the matrix definition i.e. coorected code vector=[R]+[E] i.e. matrix sum of received message vector and error vector
    Cc=rem(Cc(1:length(Cc)),2) %converting corrected code vector into binary
else %if the binary syndrome vector is not present in any rows of the transpose(H) then we get rowloc as 0 indicating no error in the received message vector [R]
    disp('Found no error!')
end
eff=(k/n)*100; %code efficiency
st1=string('Rate Efficiency is');
st2=int2str(eff);
st3=string('%.');
st=st1+' '+st2+st3;
disp(st)
end