Config = Config or {}

-- NOTE: Setting the items a shop will buy and their prices is done in the server config file.
Config.Shops = {
   [1] = {        
        name = 'wood_buyer',
        label = 'Lumber Yard',
        pedModel = 'a_m_m_farmer_01',
        location = vec4(1196.48, -1301.27, 35.16, 193.84), -- You do not need to subtract 1 from the Z coord, the script handles that.        
        useBlip = true,
        blip = {
            sprite = 108,
            color = 2,
            scale = 0.8,
            name = 'Scarp Buyer',
        },
    },
    -- [2] = {        
    --     name = 'elite_coin_buyer',
    --     label = 'Supicious Gangster',
    --     pedModel = 'a_m_y_smartcaspat_01',
    --     location = vec4(1196.48, -1301.27, 35.16, 193.84), --                 
    -- }
}