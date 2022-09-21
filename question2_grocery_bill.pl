% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Richard Marquez
%%%%% NAME:
%%%%% NAME:
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC: cost
% Add the atomic propositions for cost in this section
cost(bread, 4). cost(lettuce, 3). cost(apple, 8). cost(chocolate_bar, 6). cost(ginger_ale, 5).

%%%%%  ATOMIC: twoForOneSale
% Add the atomic propositions for twoForOneSale in this section
twoForOneSale(bread). twoForOneSale(ginger_ale).  

%%%%% ATOMIC: taxable
% Add the atomic propositions for taxable in this section
taxable(chocolate_bar). taxable(ginger_ale).

%%%%% ATOMIC: numPurchased
% Add the atomic propositions for numPurchased in this section
numPurchased(apple, 3).
numPurchased(lettuce, 6).
numPurchased(bread, 4).
numPurchased(chocolate_bar, 1).
numPurchased(ginger_ale, 2).

%%%%% ATOMIC: taxRate
% Add the atomic propositions for taxRate in this section
taxRate(0.13).

%%%%% RULE: costAfterTax
% Add the rule(s) for costAfterTax in this section

% is taxable
costAfterTax(Item, AfterTax) :- taxable(Item), cost(Item, ItemCost), taxRate(TaxRate), AfterTax is ItemCost * (1 + TaxRate).

% is not taxable
costAfterTax(Item, AfterTax) :- cost(Item, ItemCost), not taxable(Item), AfterTax is ItemCost.

%%%%% RULE: costAfterTaxAndSale
% Add the rule(s) for costAfterTaxAndSale in this section

% if item is taxable
costAfterTaxAndSale(Item, AfterSaleAndTax) :- 
    cost(Item, PricePerItem), numPurchased(Item, Quantity), 
    twoForOneSale(Item), taxable(Item), taxRate(TaxRate),
    AfterSaleAndTax is (((Quantity // 2) + (Quantity mod 2)) * PricePerItem) * (1 + TaxRate).

% if item is not taxable
costAfterTaxAndSale(Item, AfterSaleAndTax) :- 
    cost(Item, PricePerItem), numPurchased(Item, Quantity), 
    twoForOneSale(Item), not taxable(Item), 
    AfterSaleAndTax is ((Quantity // 2) + (Quantity mod 2)) * PricePerItem.
    

%%%%% RULE: totalCost
%  Add the rule(s) for totalCost in this section

totalCost(Cost) :- cost(Item, AfterTax). % idk what I'm doing lol

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
