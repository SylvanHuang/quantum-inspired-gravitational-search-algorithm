%Variable
clear 
Problem=[1 -1 1 1 -0.2 -0.2 ];
Nvar=size(Problem);
Nvar=Nvar(1,2);
%Nvar=14;
Kbest=19;
G1=0.125;
Best_Fitness=0;
T=50;
%Best_So_Far=0;
%Parent=zeros(1,Nvar);
NumOfChild=20;
Teta=zeros(NumOfChild,Nvar);
Alfa=zeros(NumOfChild,Nvar)+(1/sqrt(2));
Beta=zeros(NumOfChild,Nvar)+(1/sqrt(2));
for i=1:T
    G=G1*(1-(i/T));
    %Child=zeros(NumOfChild,Nvar);
    Child=Init_Child(NumOfChild,Nvar,Alfa);
    [Fitness,BestSoFar_Child, idx]=Calculation_Of_Fitness(Problem,Child);
    [Alfa,Beta,Teta]=Change_Parent(Fitness,idx,Child,Kbest,G,Alfa,Beta,Teta);
    %plot(Fitness(idx(NumOfChild),i );
    if   Fitness(idx(NumOfChild,1))>=Best_Fitness
         Best_Fitness=Fitness(idx(NumOfChild,1));
        Best_Child=BestSoFar_Child
    end 
    if i%2==0
    Kbest=Kbest-1;
    end
    if Kbest==0
        Kbest=1;
    end
end