function [ Alfa,Beta,Teta] = Change_Parent(Fitness,idx,Child,Kbest,G,Alfa,Beta,Teta)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
%Calculate Mi
Nois=0.0001;
Test=0;
SumOfFitness=0;
tmp=size(Child);
NumOfChild=tmp(1,1);
Nvar=tmp(1,2);
R=0;
a=zeros(NumOfChild,Nvar);
Kbest_Matrix=zeros(100,1);
M=zeros(NumOfChild,1);
Worth_Child=Fitness(idx(1,1),:);
for i=1:NumOfChild
    SumOfFitness=SumOfFitness+Fitness(i,1)-Worth_Child;
end
for i=1:NumOfChild
    M(i,1)=(Fitness(i,1)-Worth_Child)/(SumOfFitness);
end
[~,M_idx]=sort(M);
%Calculate Kbest
for i=1:Kbest
    Kbest_Matrix(i,1)=M(M_idx(NumOfChild-i+1,1),1);
end


%Calculate ai
for i=1:NumOfChild
    for k=1:Kbest
        for g=1:Nvar
            for s=1:Kbest
                if i==idx(NumOfChild-s+1)
                    Test=Test+1;
                end
            end
            if Test==0
                for d=1:Nvar
                    R=R+abs(Child(idx(NumOfChild-k+1,1),d)-Child(i,d));
                end
                a(i,g)= a(i,g)+(rand(1,1)*G*Kbest_Matrix(k,1)/(Nois+R))*(Child(idx(NumOfChild-k+1,1),g))-Child(i,g);
            end
        Test=0;
        R=0;
        end
        
    end
end

for i=1:NumOfChild
    for j=1:Nvar
        if (Alfa(i,j)*Beta(i,j))>=0
            Teta(i,j)=a(i,j)+rand*Teta(i,j);
        else
            Teta(i,j)=-(a(i,j)+rand*Teta(i,j));    
        end    
        Alfa(i,j)=(cos(Teta(i,j)*pi/180)*Alfa(i,j))-(sin(Teta(i,j)*pi/180)*Beta(i,j));
        Beta(i,j)=(sin(Teta(i,j)*pi/180)*Alfa(i,j))+(cos(Teta(i,j)*pi/180)*Beta(i,j));
    end    
end
