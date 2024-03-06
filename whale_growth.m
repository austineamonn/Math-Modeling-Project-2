function growth=whale_growth(pop1,pop2,r,k,a)

if nargin<1 %give error if no inputs
    error('missing inputs');
end

%use growth function from IWC
growth=r*pop1*(1-pop1/k)-a*pop1*pop2;
