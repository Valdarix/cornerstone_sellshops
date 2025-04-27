local function getItemCount(source, item)
    local src = source
    
    if not src then return end
   
    local itemCount = exports.ox_inventory:GetItemCount(source, item)
   
    return itemCount
end

lib.callback.register('cornerstone_sellshop:server:hasItem', function(source, item)  

    return getItemCount(source, item)

end)

lib.callback.register('cornerstone_sellshop:server:sellItem', function(source, item, itemPayoutAmount, itemPayoutItem)
    local src = source
    
    if not src then return end

    local numberOfItems = getItemCount(src, item)
  
    local message = ''
    
    local currentInventoryItem = exports.ox_inventory:GetItem(src, item, nil, false)  
   
    local payoutAmount = itemPayoutAmount
  
    local totalPayout =  numberOfItems * payoutAmount

    local payoutItem = itemPayoutItem

    if numberOfItems > 0 then
        
        local success = exports.ox_inventory:RemoveItem(src, item, numberOfItems)
        
        if success then 
            local payoutItemInfo = exports.ox_inventory:GetItem(src, payoutItem, nil, false)
            local canCarry = exports.ox_inventory:CanCarryItem(src, payoutItem, totalPayout, false)      
          
            if canCarry then -- do the can carry check to be safe. In cash rewards are something other than money or the money has weight. 
                exports.ox_inventory.AddItem(src, payoutItem, totalPayout)
                message = 'You have successfully sold ' .. currentInventoryItem.label   .. ' and were paid with ' .. totalPayout .. ' ' .. payoutItemInfo.label
                TriggerClientEvent('cornerstone_sellshop:client:sendNotify', src, 'success', message)                
            else
                message = 'You could not sell ' .. currentInventoryItem.label .. ' because you could not carry the payout.'
                TriggerClientEvent('cornerstone_sellshop:client:sendNotify', src, 'error', message)
                exports.ox_inventory:AddItem(src, item, numberOfItems)
            end               
        else
            message = 'Failed to remove ' .. currentInventoryItem.label .. ' from your inventory.'
            TriggerClientEvent('cornerstone_sellshop:client:sendNotify', src, 'error', message)
        end
    
    end
end)