function pophat=newpop(pop,growth,hunt,initial)

if initial==0 %for case where calculating inital population
    pophat=pop;
else
    pophat=growth+pop-hunt;
    if pophat<0
        pophat=0;
    end
end
