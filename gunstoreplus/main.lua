config = {
    gunStores = {
        {
            name = "Sandy Ammu-Nation",
            position = vector3(1693.71, 3760.54, 34.71),
        },
    },
	menuPosition = "center",
	menuWidth = 80,
    Style = 'Default',

    weapons = {
        Handguns = {
            pistols_1 = {"Pistol", "weapon_pistol", 699, "Most reliable and dependable sidearm for law-enforcement, military and personal defense.", 500},
            pistols_2 = {"Combat Pistol", "weapon_combatpistol", 549, "Short recoil-operated, semi-automatic pistol designed and produced by Hawk & Little.", 500},
            pistols_3 = {"AP Pistol", "weapon_appistol", 6100, "High-penetration, fully-automatic pistol. Holds 18 rounds in the magazine.", 500},
            pistols_4 = {"Pistol .50", "weapon_pistol50", 2550, "High-impact pistol that delivers immense power but with extremely strong recoil.", 500},
            pistols_5 = {"SNS Pistol", "weapon_snspistol", 300, "Like condoms or hairspray, this fits in your pocket for a night on the town.", 500},
            pistols_6 = {"Heavy Pistol", "weapon_heavypistol", 1100, "The heavyweight champion. Delivers accuracy and a serious forearm workout every time.", 500},
            pistols_7 = {"Heavy Revolver", "weapon_revolver", 5900, "A handgun with enough stopping power to drop a crazed rhino.", 500},
            pistols_8 = {"Double Action Revolver", "weapon_doubleaction", 279, "Sometimes revenge is a dish best served six times, in quick succession, right between the eyes.", 500}
        },
        SubmachineGuns = {
            submachineGuns_1 = {"Micro SMG", "weapon_microsmg", 2400, "Combines compact design with a high rate of fire at approximately 700-900 rounds per minute.", 500},
            submachineGuns_2 = {"SMG", "weapon_smg", 2150, "This is known as a good all-around submachine gun. Lightweight with an accurate sight.", 500},
            submachineGuns_3 = {"Assault SMG", "weapon_assaultsmg", 1480, "A high-capacity submachine gun that is both compact and lightweight. Holds up to 30 bullets.", 500},
            submachineGuns_4 = {"Combat PDW", "weapon_combatpdw", 1799, "Who said personal weaponry couldn't be worthy of military personnel? Integral suppressor.", 500},
            submachineGuns_5 = {"Machine Pistol", "weapon_machinepistol", 1100, "The snare drum to your twin-engine V8 bass: no drive-by sounds quite right without it.", 500},
            submachineGuns_6 = {"Mini SMG", "weapon_minismg", 1240, "Increasingly popular since marketing team started caring about little guys in low income areas.", 500}
        },
        Shotguns = {
            shotguns_1 = {"Pump Shotgun", "weapon_pumpshotgun", 800, "Standard shotgun ideal for short-range combat. High-projectile spread, lower accuracy at long range.", 500},
            shotguns_2 = {"Sawed-Off Shotgun", "weapon_sawnoffshotgun", 450, "Single-barrel, sawed-off shotgun. Low range and ammo capacity but devastating in close combat.", 500},
            shotguns_3 = {"Musket", "weapon_musket", 1600, "Armed with nothing but muskets and a superiority complex, the Brits took over half the world.", 500},
            shotguns_4 = {"Double Barrel Shotgun", "weapon_dbshotgun", 300, "Who needs a high fire rate when your first shot turns the other guy into a fine mist?", 500},
            shotguns_5 = {"Sweeper Shotgun", "weapon_autoshotgun", 995, "How many effective tools for riot control can you tuck into your pants?", 500},
            shotguns_6 = {"Combat Shotgun", "weapon_combatshotgun", 1200, "There's only one semi-automatic shotgun with a fire rate that sets the LSFD alarm ringing.", 500}
        },
        AssaultRifles = {
            assaultRifles_1 = {"Assault Rifle", "weapon_assaultrifle", 8280, "This standard assault rifle boasts a large capacity magazine and long distance accuracy.", 500},
            assaultRifles_2 = {"Carbine Rifle", "weapon_carbinerifle", 9700, "Combining long distance accuracy with a high capacity magazine, make the hit.", 500},
            assaultRifles_3 = {"Advanced Rifle", "weapon_advancedrifle", 8800, "The most lightweight and compact of all rifles, without compromising accuracy and fire rate.", 500},
            assaultRifles_4 = {"Special Carbine", "weapon_specialcarbine", 7200, "Combining accuracy, maneuverability, firepower and low recoil, this is extremely versatile.", 500},
            assaultRifles_5 = {"Bullpup Rifle", "weapon_bullpuprifle", 1750, "The latest Chinese import taking America by storm, this rifle is known for balanced handling.", 500},
            assaultRifles_6 = {"Compact Rifle", "weapon_compactrifle", 2390, "Half the size, all the power, double the recoil: no riskier way to say \"I'm compensating\".", 500}
        },
        LightMachineGuns = {
            lightMachineGuns_1 = {"MG", "weapon_mg", 8500, "General purpose machine. Long range penetrative power. Very effective against large groups.", 500},
            lightMachineGuns_2 = {"Combat MG", "weapon_combatmg", 9530, "Lightweight and excellent maneuverability with a high rate of fire to devastating effect.", 500},
            lightMachineGuns_3 = {"Gusenberg Sweeper", "weapon_gusenberg", 2800, "Looks great sticking out the window of a Roosevelt or paired with a pinstripe suit.", 500}
        },
  

    }
}
local function CreateMenu1()
    local Gunshop = UIMenu.New("", "Gunstore", 50, 50, true, "shopui_title_gunclub", "shopui_title_gunclub", true) 
    Gunshop:BuildingAnimation(MenuBuildingAnimation.LEFT_RIGHT)
    Gunshop:AnimationType(MenuAnimationType.CUBIC_INOUT)
    Gunshop:ScrollingType(MenuScrollingType.CLASSIC)
    Gunshop:CounterColor(SColor.HUD_Blue)
    if not Gunshop:Visible() then return end
    for categoryIndex = 1, #config.weapons do
    local category = config.weapons[categoryIndex]
    local categorySubMenu = UIMenu.New("", category, 0, 0, true,  "shopui_title_gunclub",  "shopui_title_gunclub")

    local weapons = config.weapons[category]
    for weaponIndex = 1, #weapons do
        local weaponData = weapons[weaponIndex]
        local weaponName, weaponHash, weaponPrice, weaponDesc, _ = table.unpack(weaponData)
        local menuItem = UIMenuItem.New(weaponName, string.format("Buy %s for $%d", weaponName, weaponPrice))
        categorySubMenu:AddItem(menuItem)

        menuItem.Activated = function(menu)
            print(weaponData)
            TriggerServerEvent('zaps:purchaseWeapon', weaponHash, weaponName, weaponPrice)
        end
      end
    end
        local categoryItem = UIMenuItem.New(category, "Select a weapon from this category.")
        Gunshop:AddItem(categoryItem)
        categoryItem.Activated = function(menu)
            currentCategoryMenu = categorySubMenu
            Gunshop:SwitchTo(currentCategoryMenu, 1, true)
        end
    end
    Gunshop:Visible(true)
end
RegisterCommand('gunstore', function(source)
    if MenuHandler:IsAnyMenuOpen() then  return end
    local playerCoords = GetEntityCoords(cache.ped or PlayerPedid())
    for i = 1, #config.gunStores do
    local store = config.gunStores[i]
    if #(playerCoords - store.position) < 10.0 then 
        CreateMenu1()
        return
    end
end
end)
RegisterKeyMapping('gunstore', 'Opens Gun Store', 'keyboard', 'e')  
Citizen.CreateThread(function()
  for i = 1, #config.gunStores do
    local store = config.gunStores[i]
    local blip = AddBlipForCoord(store.position.x, store.position.y, store.position.z)
    SetBlipSprite(blip, 110) 
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7) 
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 1) 
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(store.name)
    EndTextCommandSetBlipName(blip)
  end
end)
