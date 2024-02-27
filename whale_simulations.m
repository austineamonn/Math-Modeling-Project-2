function [typepos,bestpos,typeneg,bestneg,type,best]=whale_simulations(num)

%[pop,growth,profit]=whale_pop_model(r1,r2,k1,k2,a1,a2,pop1,pop2,years,type)
%keep a1 and a2 same

%types=zeros(1,num);
%comps=zeros(1,num);

%initializing variables

r1=0.05;
r2=0.08;
k1=150000;
k2=400000;
a1=10^(-8);
a2=a1; %IWC assumption that a1=a2

%[~,~]=competition(r1,r2,k1,k2,a1,a2);
bestneg=[-1,r1,r2,k1,k2,a1,a2];
bestpos=[1,r1,r2,k1,k2,a1,a2];
best=zeros(1,7);

for i=1:num
    vary=variation(6);
    r1var=r1*vary(1);
    r2var=r2*vary(2);
    k1var=k1*vary(3);
    k2var=k2*vary(4);
    a1var=a1*vary(5);
    a2var=a2*vary(6);
    [~,comp]=competition(r1var,r2var,k1var,k2var,a1var,a2var);
    %types(1,i)=type;
    %comps(1,i)=comp;
    bestnegcomp=bestneg(1);
    bestposcomp=bestpos(1);
    %if comp>0 %for weak competition
        %if comp<bestposcomp
            %bestpos=[comp,r1var,r2var,k1var,k2var,a1var,a2var];
        %end
    %elseif comp<0 %for strong competition
        %if comp>bestnegcomp
            %bestneg=[comp,r1var,r2var,k1var,k2var,a1var,a2var];
        %end
    %elseif comp==0 %is this even possible?
        %best=[comp,r1var,r2var,k1var,k2var,a1var,a2var];
        %break;
    %end
end

%final result

%best1=bestneg(1);
%best2=bestneg(2);
%best3=bestneg(3);
%best4=bestneg(4);
%best5=bestneg(5);
%best6=bestneg(6);
%best7=bestneg(7);
%best8=bestpos(1);
%best9=bestpos(2);
%best10=bestpos(3);
%best11=bestpos(4);
%best12=bestpos(5);
%best13=bestpos(6);
%best14=bestpos(7);

%solve for type

typepos='weak';
typeneg='strong';
type='unknown';

