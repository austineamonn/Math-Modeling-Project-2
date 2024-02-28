function pophat=newpop(pop,growth,hunt)

pophat=growth+pop-hunt;

if pophat<0
    pophat=0;
end