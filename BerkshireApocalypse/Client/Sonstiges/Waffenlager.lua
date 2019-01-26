--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

Waffenlager = {state = false,
	["IDS"] = {
		["Desert Eagle"] = 24,
		["Mp5"] = 29,
		["M4"] = 31,
		["AK-47"] = 30,
		["County Rifle"] = 33,
		["Sniper"] = 34},}

bindKey("f6","down",function()
	if(getElementData(localPlayer,"waffenlager") == 1)then
		if(Waffenlager.state == true)then
			Waffenlager.state = false;
			GUIEditor.set("reset");
		else
			if(GUIEditor.isWindow())then
				Waffenlager.state = true;
				GUIEditor.window[1] = guiCreateWindow(0.22, 0.17, 0.33, 0.32,language[language.get()][23][3], true)
				
				GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.25, 0.37, 0.57, true, GUIEditor.window[1])
				weapon1 = guiGridListAddColumn(GUIEditor.gridlist[1], "Weapon", 0.5)
				ammo1 = guiGridListAddColumn(GUIEditor.gridlist[1], "Ammo", 0.5)

				GUIEditor.gridlist[2] = guiCreateGridList(0.41, 0.25, 0.57, 0.57, true, GUIEditor.window[1])
				id = guiGridListAddColumn(GUIEditor.gridlist[2], "ID", 0.3)
				weapon2 = guiGridListAddColumn(GUIEditor.gridlist[2], "Weapon", 0.3)
				ammo2 = guiGridListAddColumn(GUIEditor.gridlist[2], "Ammo", 0.3)
				
				GUIEditor.label[1] = guiCreateLabel(0.02, 0.11, 0.37, 0.10, language[language.get()][23][1], true, GUIEditor.window[1])
				GUIEditor.label[2] = guiCreateLabel(0.41, 0.11, 0.57, 0.10, language[language.get()][23][2], true, GUIEditor.window[1])

				GUIEditor.button[1] = guiCreateButton(0.02, 0.86, 0.37, 0.10, language[language.get()][23][4], true, GUIEditor.window[1])
				GUIEditor.button[2] = guiCreateButton(0.41, 0.86, 0.57, 0.10, language[language.get()][23][5], true, GUIEditor.window[1])
				
				GUIEditor.set("set",2);
				
				triggerServerEvent("Waffenlager.getWeapons",localPlayer);
				
				addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
					local waffe = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					
					if(not(waffe == ""))then
						local weaponid = Waffenlager["IDS"][waffe];
						triggerServerEvent("Waffenlager.einlagern",localPlayer,weaponid);
						triggerServerEvent("Waffenlager.getWeapons",localPlayer);
					else infobox.create(language[language.get()][23][6],"error")end
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
					local waffe = guiGridListGetItemText(GUIEditor.gridlist[2],guiGridListGetSelectedItem(GUIEditor.gridlist[2]),1)
					
					if(not(waffe == ""))then
						triggerServerEvent("Waffenlager.auslagern",localPlayer,waffe);
						triggerServerEvent("Waffenlager.getWeapons",localPlayer);
					else infobox.create(language[language.get()][23][6],"error")end
				end,false)
			end
		end
	end
end)

addEvent("Waffenlager.refresh",true)
addEventHandler("Waffenlager.refresh",root,function(handweapons,depotweapons)
	guiGridListClear(GUIEditor.gridlist[1]);
	guiGridListClear(GUIEditor.gridlist[2]);
	
	if(#handweapons >= 1)then
		for _,v in ipairs(handweapons)do
			row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,weapon1,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,ammo1,v[2],false,false)
		end
	end
	
	if(#depotweapons >= 1)then
		for _,v in ipairs(depotweapons)do
			row = guiGridListAddRow(GUIEditor.gridlist[2])
			guiGridListSetItemText(GUIEditor.gridlist[2],row,id,v[1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,weapon2,v[2],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[2],row,ammo2,v[3],false,false)
		end
	end
end)