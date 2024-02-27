function [pop,growth,profit]=whale_pop_model(r1,r2,k1,k2,a1,a2,pop1,pop2,years,type)

%1 is blue whales, 2 is fin whales
%output:current total whale population, current total whale growth rate,
%total whaler profit

if nargin<1
    r1=0.05;
    r2=0.08;
    k1=150000;
    k2=400000;
    a1=10^(-8);
    a2=10^(-8);
    pop1=75000;
    pop2=200000;
    years=15;
    type=0;
end

profit=0; %initialize profit

growthinit1=whale_growth(pop1,pop2,r1,k1,a1);
growthinit2=whale_growth(pop1,pop2,r2,k2,a2);


for i=1:years
    growth1=whale_growth(pop1,pop2,r1,k1,a1);
    growth2=whale_growth(pop1,pop2,r2,k2,a2);
    if type==0 %hunting is same rate as growth
        hunt1=growthinit1;
        hunt2=growthinit2;
    elseif type==1 %hunting is 75% of growth
        hunt1=0.75*growthinit1;
        hunt2=0.75*growthinit2;
    elseif type==2 %hunting is 105% of growth
        hunt1=1.05*growthinit1;
        hunt2=1.05*growthinit2;
    elseif type==3 %hunting is 110% of growth
        hunt1=1.1*growthinit1;
        hunt2=1.1*growthinit2;
    elseif type==4 %hunting is 115% of growth
        hunt1=1.15*growthinit1;
        hunt2=1.15*growthinit2;
    elseif type==5 %hunting is 120% of growth
        hunt1=1.2*growthinit1;
        hunt2=1.2*growth2;
    elseif type==6 %hunting is 125% of growth
        hunt1=1.25*growthinit1;
        hunt2=1.25*growthinit2;

    end
    pop1=pop1+growth1-hunt1;
    pop2=pop2+growth2-hunt2;
    profit1=hunt1*12000;
    profit2=hunt2*6000;
    profit=profit1+profit2+profit;
end

pop=pop1+pop2;
growth=growth1+growth2;

%comp=(r1/k1)*(r2/k2)-a1*a2;


