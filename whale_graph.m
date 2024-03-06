function whale_graph(years,graphtype)

if nargin<1
    years=15; %assume 15 years
    graphtype=0; %assume graphing population
end

%Inital assumptions for values
%Use values given by IWC
r1=0.05;
r2=0.08;
k1=150000;
k2=400000;
a1=0.00000001;
a2=0.00000001;
pop1=4800; %IWC current blue whale population
pop2=43000; %IWC current fin whale population
type=1; %This is the scenario where the quota is equal to the growth rate

%run whale population model, ignore total profit since it is just one value.
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
else %error if no type is entered
    error('try entering a 0,1 or 2')
end
