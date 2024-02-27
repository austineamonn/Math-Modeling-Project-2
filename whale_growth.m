function growth=whale_growth(pop1,pop2,r,k,a)

if nargin<1
    error('missing inputs');
end

growth=r*pop1*(1-pop1/k)-a*pop1*pop2;

%1725, 7850
%1731, 7856