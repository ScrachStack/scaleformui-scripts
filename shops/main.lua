configs = {
    Stores = {
        {
            name = "Grove Store",
            position = vector3(-47.8585, -1757.2069, 29.4210),
            items = {
                { label = "ammo", value = "ammo", price = 5 },
                { label = "armor", value = "armor", price = 3 },
		{ label = "chip", value = "chip", price = 2 }
            }
        },
    },
}
CreateThread(function()
	for i = 1, #configs.Stores do
		local store = configs.Stores[i]
		local blip = AddBlipForCoord(store.position.x, store.position.y, store.position.z)
		SetBlipSprite(blip, 52)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)
		SetBlipColour(blip, 2)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(store.name)
		EndTextCommandSetBlipName(blip)
	end
end)
local function CreateMenu()
local ShopMenu = UIMenu.New("", "Shop", 50, 50, true, "shopui_title_conveniencestore", "shopui_title_conveniencestore", true) 
ShopMenu:MaxItemsOnScreen(7)
    ShopMenu:BuildingAnimation(MenuBuildingAnimation.LEFT_RIGHT)
    ShopMenu:AnimationType(MenuAnimationType.CUBIC_INOUT)
	ShopMenu:ScrollingType(MenuScrollingType.CLASSIC)
	ShopMenu:CounterColor(SColor.HUD_Blue)
	for i = 1, #configs.Stores do
		local store = configs.Stores[i]
		for j = 1, #store.items do
			local item = store.items[j]
			local menuItem = UIMenuItem.New(item.label, string.format("Buy %s for $%d", item.label, item.price))
			ShopMenu:AddItem(menuItem)
			menuItem.Activated = function(menu)
				print(item)
				TriggerServerEvent('zaps:purchaseItem', item.label, item.price)
			end
		end
	end	
    ShopMenu:Visible(true)
end
RegisterCommand('openshop', function()
    local playerCoords = GetEntityCoords(cache.ped or PlayerPedId())
    for _, store in pairs(configs.Stores) do
        if #(playerCoords - store.position) < 5.0 then 
    	CreateMenu()
        end 
    end
end, false)
RegisterKeyMapping('openshop', 'Opens Store', 'keyboard', 'e') 
