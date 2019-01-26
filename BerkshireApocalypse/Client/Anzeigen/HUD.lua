--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

hud = {pointsprolevel = 250,
	["components"] = {"ammo","armour","breath","clock","health","money","weapon","wanted"},}

addEventHandler("onClientRender",root,function()
	if(GUIEditor.isWindow())then
		local level = getElementData(localPlayer,"level")+1
		local erfahrungspunkte = getElementData(localPlayer,"erfahrungspunkte");
		
		local time = getRealTime()
		local hours = time.hour
		local minute = time.minute
		local day = time.monthday
		local month = time.month+1
		local year = time.year+1900
	
        dxDrawRectangle(1161*(x/1440), 10*(y/900), 269*(x/1440), 159*(y/900), tocolor(0,0,0, 225), false)
        dxDrawImage(1076*(x/1440), 10*(y/900), 75*(x/1440), 69*(y/900), "Files/Images/Weapons/"..tostring(getPedWeapon(localPlayer))..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(getPedAmmoInClip(localPlayer).." | "..getPedTotalAmmo(localPlayer) - getPedAmmoInClip(localPlayer), 1076*(x/1440), 89*(y/900), 1151*(x/1440), 114*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawImage(1171*(x/1440), 20*(y/900), 35*(x/1440), 28*(y/900), "Files/Images/Inventar/heart.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1171*(x/1440), 58*(y/900), 35*(x/1440), 28*(y/900), "Files/Images/HUD/armor.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1171*(x/1440), 96*(y/900), 35*(x/1440), 28*(y/900), "Files/Images/HUD/xp.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(day.."."..month.."."..year.." - "..hours..":"..minute.." Uhr - "..getPlayerMoney(localPlayer).."$", 1171*(x/1440), 134*(y/900), 1420*(x/1440), 159*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawRectangle(1216*(x/1440), 20*(y/900), 204*(x/1440), 28*(y/900), tocolor(254, 37, 37, 225), false)
        dxDrawRectangle(1216*(x/1440), 58*(y/900), 204*(x/1440), 28*(y/900), tocolor(3, 94, 197, 225), false)
        dxDrawRectangle(1216*(x/1440), 96*(y/900), 204*(x/1440), 28*(y/900), tocolor(241, 254, 40, 225), false)
        dxDrawRectangle(1216*(x/1440), 34*(y/900), 204*(x/1440), 14*(y/900), tocolor(201, 0, 0, 225), false)
        dxDrawRectangle(1216*(x/1440), 72*(y/900), 204*(x/1440), 14*(y/900), tocolor(19, 68, 180, 225), false)
        dxDrawRectangle(1216*(x/1440), 110*(y/900), 204*(x/1440), 14*(y/900), tocolor(144, 162, 18, 225), false)
        dxDrawText(math.floor(getElementHealth(localPlayer)).."%", 1216*(x/1440), 20*(y/900), 1420*(x/1440), 48*(y/900), tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(math.floor(getPedArmor(localPlayer)).."%", 1216*(x/1440), 58*(y/900), 1420*(x/1440), 86*(y/900), tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(erfahrungspunkte.."/"..level*hud.pointsprolevel, 1216*(x/1440), 96*(y/900), 1420*(x/1440), 124*(y/900), tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
end)

function hud.visible()
	for i = 1,#hud["components"]do
		setPlayerHudComponentVisible(hud["components"][i],false);
	end
end