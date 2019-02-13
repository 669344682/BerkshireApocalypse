--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden

	cWeapondepot
	Last Edit: 10.02.2019
	
]]--

Weapondepot = {
	["IDs"] = {
		["Colt 45"] = 22,
		["Silenced"] = 23,
		["Desert Eagle"] = 24,
		["Shotgun"] = 25,
		["Sawed-off"] = 26,
		["Combat Shotgun"] = 27,
		["Uzi"] = 28,
		["Mp5"] = 29,
		["Tec-9"] = 32,
		["AK-47"] = 30,
		["M4"] = 31,
		["Country Rifle"] = 33,
		["Sniper"] = 34,
		["Rocket Launcher"] = 35,
		["Rocket Launcher HS"] = 36,
		["Flamethrower"] = 37,
		["Minigun"] = 38,
		["Grenade"] = 16,
		["Molotov"] = 18,
		["Satchel"] = 39
	},
};

bindKey("f6","down",function()
	if(getElementData(localPlayer,"loggedin") == 1)then
		if(getElementData(localPlayer,"Weapondepot") == 1)then
			if(isWindowOpen())then
				--// GUI-Elements
				BerkshireApocalypse.window[1] = guiCreateWindow(468, 252, 471, 433, "Weapon Depot", false)

				BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 61, 451, 141, false, BerkshireApocalypse.window[1])
				depotID = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "ID", 0.3)
				depotWeapon = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Weapon", 0.3)
				depotAmmo = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Ammo", 0.3)
				BerkshireApocalypse.label[1] = guiCreateLabel(10, 27, 451, 24, "Weapons in your depot:", false, BerkshireApocalypse.window[1])
				guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
				guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", false)
				guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
				BerkshireApocalypse.label[2] = guiCreateLabel(10, 212, 451, 24, "Weapons on your hand:", false, BerkshireApocalypse.window[1])
				guiSetFont(BerkshireApocalypse.label[2], "default-bold-small")
				guiLabelSetHorizontalAlign(BerkshireApocalypse.label[2], "center", false)
				guiLabelSetVerticalAlign(BerkshireApocalypse.label[2], "center")
				BerkshireApocalypse.gridlist[2] = guiCreateGridList(10, 246, 451, 141, false, BerkshireApocalypse.window[1])
				handWeapon = guiGridListAddColumn(BerkshireApocalypse.gridlist[2], "Weapon", 0.5)
				handAmmo = guiGridListAddColumn(BerkshireApocalypse.gridlist[2], "Ammo", 0.5)
				BerkshireApocalypse.button[1] = guiCreateButton(10, 397, 219, 26, "Store", false, BerkshireApocalypse.window[1])
				guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
				BerkshireApocalypse.button[2] = guiCreateButton(242, 397, 219, 26, "Outsource", false, BerkshireApocalypse.window[1])
				guiSetProperty(BerkshireApocalypse.button[2], "NormalTextColour", "FFAAAAAA")
				setWindowDatas("set");
				
				triggerServerEvent("Weapondepot.getWeapons",localPlayer);
				
				addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
					local weapon = getItemFromGridlist(BerkshireApocalypse.gridlist[2],1);
					outputChatBox("hja")
					if(not(weapon == ""))then
						local weaponID = Weapondepot["IDs"][weapon];
						triggerServerEvent("Weapondepot.store",localPlayer,weaponID);
						triggerServerEvent("Weapondepot.getWeapons",localPlayer);
					end
				end,false)
				
				addEventHandler("onClientGUIClick",BerkshireApocalypse.button[2],function()
					local weapon = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
					if(not(weapon == ""))then
						triggerServerEvent("Weapondepot.outsource",localPlayer,weapon);
						triggerServerEvent("Weapondepot.getWeapons",localPlayer);
					end
				end,false)
			end
		end
	end
end)

addEvent("Weapondepot.refresh",true)
addEventHandler("Weapondepot.refresh",root,function(handweapons,depotweapons)
	guiGridListClear(BerkshireApocalypse.gridlist[1]);
	guiGridListClear(BerkshireApocalypse.gridlist[2]);
	
	if(#depotweapons >= 1)then
		for _,v in pairs(depotweapons)do
			local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1])
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,depotID,v[1],false,false);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,depotWeapon,v[2],false,false);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,depotAmmo,v[3],false,false);
		end
	end
	
	if(#handweapons >= 1)then
		for _,v in pairs(handweapons)do
			local row = guiGridListAddRow(BerkshireApocalypse.gridlist[2])
			guiGridListSetItemText(BerkshireApocalypse.gridlist[2],row,handWeapon,v[1],false,false);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[2],row,handAmmo,v[2],false,false);
		end
	end
end)