function [type,comp]=competition(r1,r2,k1,k2,a1,a2)

comp=(r1/k1)*(r2/k2)-a1*a2; %calculate if it is strong or weak competition

%declare type of competition depending on 'comp' value
if comp>0
    type='weak';
elseif comp<0
    type='strong';
else
    type='unknown';
end
