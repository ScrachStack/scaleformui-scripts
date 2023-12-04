RegisterServerEvent('zaps:purchaseWeapon')
AddEventHandler('zaps:purchaseWeapon', function(weaponName, weaponLabel, weaponPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerMoney = xPlayer.getMoney()
    
    if playerMoney >= weaponPrice then
        xPlayer.removeMoney(weaponPrice)
        xPlayer.addWeapon(weaponName, 50)  
        TriggerClientEvent('esx:showNotification', source, 'You purchased a ' .. weaponLabel)
    else
        TriggerClientEvent('esx:showNotification', source, 'Not enough money')
    end
end)
