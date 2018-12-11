function [ output ] = Init_Child(NumOfChild,Nvar,Alfa)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
%Nvar=size(Parent);
%Nvar=Nvar(1,2);
output=zeros(NumOfChild,Nvar);
for i=1:NumOfChild
    for j=1:Nvar
        if rand<(Alfa(i,j)^2)
            output(i,j)=1;
        else
            output(i,j)=0;
        end    
    end    
end

end

