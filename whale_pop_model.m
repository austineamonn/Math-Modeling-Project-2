function [totalpop,bluepop,finpop,bluegrowth,fingrowth,annprofit,totalprofit]=whale_pop_model(r1,r2,k1,k2,a1,a2,pop1,pop2,years,type)

%1 is blue whales, 2 is fin whales
%output:current total whale population, current total whale growth rate,
%total whaler profit

if nargin<1 %if no input assume these values
    %IWC assumed values
    r1=0.05;
    r2=0.08;
    k1=150000;
    k2=400000;
    a1=10^(-8);
    a2=10^(-8);
    pop1=75000;
    pop2=200000;
    years=15;
    %scenario where hunting levels are equal to growth rate
    type=1;
end

%ideal pop based on IWC rules
ideal1=k1/2;
ideal2=k2/2;

%initialize all the output vectors

totalpop=zeros(1,years+1);
bluepop=zeros(1,years+1);
finpop=zeros(1,years+1);
bluegrowth=zeros(1,years+1);
fingrowth=zeros(1,years+1);
annprofit=zeros(1,years+1);

%get initial growth and add to growth vectors

growth1=whale_growth(pop1,pop2,r1,k1,a1);
initalg1=growth1;
growth2=whale_growth(pop1,pop2,r2,k2,a2);
initalg2=growth2;

%use type and initial growth to determine hunting level
%type is the hunting level relative to the growth rate
%ex: type=1.05 is hunting at 105% of the growth rate

hunt1=type*growth1;
hunt2=type*growth2;

%initialize total profit
totalprofit=0;

%simulate whale populations for 'years' many years
for i=1:years+1
    %calculate current population
    pop1=newpop(pop1,growth1,hunt1,i-1);
    bluepop(1,i)=pop1;
    pop2=newpop(pop2,growth2,hunt2,i-1);
    finpop(1,i)=pop2;
    totalpop(1,i)=pop1+pop2;
    %calculate annual growth
    growth1=whale_growth(pop1,pop2,r1,k1,a1);
    growth2=whale_growth(pop2,pop1,r2,k2,a2);
    %when populatinons get above IWC ideal levels, remove quotas, so hunting is equal to population growth
    if pop1>=growth1
        hunt1=initalg1;
    end
    if pop2>=growth2
        hunt1=initalg2;
    end
    %update all the output vectors
    bluegrowth(1,i)=growth1;
    fingrowth(1,i)=growth2;
    profit1=profit(hunt1,12000,pop1);
    profit2=profit(hunt2,6000,pop2);
    combprofit=profit1+profit2;
    annprofit(1,i)=combprofit;
    totalprofit=totalprofit+combprofit;
end
