function resprofit=profit(hunt,price,pop)

%calculate profit based on number of whales hunted and the price
resprofit=hunt*price;

if pop<hunt %prevents negative population by limiting hunting to the number of whales that are left
    resprofit=pop*price;
end
