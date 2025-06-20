SVConfig = {}

SVConfig.ShopItems = {
    wood_buyer  = {             
        -- Payout item allows you to pay the player with various items. I am using money as an item, but there could be a special situation where the buyer pays in a special currency or dirty money.
        {name = 'wood', amount = 50,  payoutItem = 'money'},
        {name = 'scrap', amount = 50,  payoutItem = 'money'},
        {name = 'scrap2', amount = 50,  payoutItem = 'money'},
        {name = 'scrap3', amount = 50,  payoutItem = 'money'},
        -- Add more items here if you want to sell more than one item.    
    }, 
    -- Sample of a secondary buyer/shop.
    -- elite_coin_buyer = {
    --     {name = 'weapon_pistol', amount = 2,  payoutItem = 'elite_coin'},
    --     -- Add more items here if you want to sell more than one item.    
    -- },
}
