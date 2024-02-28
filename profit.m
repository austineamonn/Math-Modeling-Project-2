function resprofit=profit(hunt,price,pop)

resprofit=hunt*price;

if pop<hunt
    resprofit=pop*price;
end
