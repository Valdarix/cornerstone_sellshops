Config = {}

Config.Shops = {
   [1] = {        
        name = 'wood_buyer',
        label = 'Lumber Yard',
        pedModel = 'a_m_m_farmer_01',
        location = vec4(1196.48, -1301.27, 35.16, 193.84), -- You do not need to subtract 1 from the Z coord, the script handles that. 
        items = {
            -- Payot item allows you to pay the player with various items. I am using money as an item, but there could be a special situation where the buyer pays in a special currency or dirty money. 
            {name = 'wood', amount = 50,  payoutItem = 'money'}
            -- Add more items here if you want to sell more than one item.
        },        
        
    },
    -- [2] = {        
    --     name = 'elite_coin_buyer',
    --     label = 'Supicious Gangster',
    --     pedModel = 'a_m_y_smartcaspat_01',
    --     location = vec4(1196.48, -1301.27, 35.16, 193.84), 
    --     items = {
    --      
    --         {name = 'wood', amount = 50,  payoutItem = 'money'}
    --     },        
        
    -- }
}