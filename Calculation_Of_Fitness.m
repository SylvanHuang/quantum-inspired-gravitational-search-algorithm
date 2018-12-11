function [ output,Best_Child ,idx] = Calculation_Of_Fitness(Problem,Child)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
a=size(Child);
Nvar=a(1,2);
NumOfChild=a(1,1);
sum1=0;
output=zeros(NumOfChild,1);
for i=1:NumOfChild
    b=Problem.*Child(i,:);
    for j=1:Nvar
        sum1=sum1+b(1,j);
    end   
    output(i,1)=sum1;
    sum1=0;
end
[~,idx]=sort(output);
Best_Child=Child(idx(NumOfChild,1),:);
end

