function whale_graph(years,graphtype)

if nargin<1
    years=15; %assume 15 years
    graphtype=0; %assume graphing population
end

%inital assumptions for values
r1=0.05;
r2=0.08;
k1=150000;
k2=400000;
a1=10^(-8);
a2=10^(-8);
pop1=4800; %75000; %4,800
pop2=43000; %400000; %43000
type=0.95;

%run whale population model, ignore total profit since no need to graph it
[totalpop,bluepop,finpop,bluegrowth,fingrowth,profit,~]=whale_pop_model(r1,r2,k1,k2,a1,a2,pop1,pop2,years,type);


%initialize time vector
time=0:years;


if graphtype==0
    %graph time vs total population, blue whale population, and fin whale
    %population
    plot(time,totalpop,"--or",time,bluepop,"--ob",time,finpop,"--og")
elseif graphtype==1
    %graph time vs blue whale growth vs fin whale growth
    plot(time,bluegrowth,"--ob",time,fingrowth,"--og")
elseif graphtype==2
    %graph time vs profit
    plot(time,profit,"--ob")
else
    error('try entering a 0,1 or 2')
end