local function sendNotify(notifyType, message)
    exports.qbx_core:Notify(message, notifyType, 3000)
end

RegisterNetEvent('cornerstone_sellshop:client:sendNotify')
AddEventHandler('cornerstone_sellshop:client:sendNotify', function(notifyType, message)
    
    sendNotify(notifyType, message)
    
end)

local function LoadModel(model)
    RequestModel(model)
    local startTime = GetGameTimer()
    while not HasModelLoaded(model) do
        Wait(0)
        if GetGameTimer() - startTime > 5000 then
            DebugPrint("ERROR: Model load timeout:" .. " " .. model)
            break
        end
    end
end

local function hasItem(item)
    local itemCount = lib.callback.await('cornerstone_sellshop:server:hasItem', false, item)
 
    local hasItem = false
    if itemCount > 0 then
        hasItem = true
    end   
   
    return hasItem
    
end

local function sellItem(item, itemPayoutAmount, itemPayoutItem, buyerName)
    lib.callback.await('cornerstone_sellshop:server:sellItem', false, item, itemPayoutAmount, itemPayoutItem, buyerName)
end

function OpenBuyMenu(buyer)
    local buyerItems = lib.callback.await('cornerstone_sellshop:server:getBuyerItems', false, buyer.name)
   
    local menu = {}
    for i = 1, #buyerItems  do
        local currentItem = buyerItems[i].name
        local itemPayoutAmount = buyerItems[i].amount
        menu[#menu + 1] = {                  
            title = exports.ox_inventory:Items(currentItem).label .. ' - $' .. itemPayoutAmount,          
            disabled = not hasItem(currentItem),
            onSelect = function()
                sellItem(currentItem, buyer.name )               
            end}  
        end

    lib.registerContext({
        id = 'OpenBuyMenu',
        title = "Sell Items",
        options = menu
    })
    lib.showContext('OpenBuyMenu')
end

for i = 1, #Config.Shops do
    local buyer = Config.Shops[i]
    LoadModel(buyer.pedModel)

    local ped = CreatePed(1, GetHashKey(buyer.pedModel), buyer.location.x, buyer.location.y, buyer.location.z - 1.0, buyer.location.w, false, true)
    SetEntityHeading(ped, buyer.location.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)

    exports.ox_target:addLocalEntity(ped, {
        label = buyer.label,
        name = buyer.name,
        icon = 'fas fa-comment-dollar',
        iconColor = 'green',
        distance = 2.0,
        onSelect = function()
            OpenBuyMenu(buyer)
        end,
        
    })
end