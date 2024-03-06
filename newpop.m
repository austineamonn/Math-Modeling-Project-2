function pophat=newpop(pop,growth,hunt,initial)

if initial==0 %for case where calculating inital population
    pophat=pop;
else
    pophat=growth+pop-hunt; %new population is the old population + new growth - whales hunted
    if pophat<0 %prevent negative population
        pophat=0;
    end
end
