--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

bindKey("f4","down",function()
	if(adminsystem.open == true)then
		adminsystem.open = false;
		GUIEditor.set("reset");
	else
		if(GUIEditor.isWindow())then
			if(getElementData(localPlayer,"adminlevel") >= 1)then
				adminsystem.open = true;
				GUIEditor.window[1] = guiCreateWindow(0.34, 0.30, 0.38, 0.36, "adminsystem", true)

				GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.09, 0.39, 0.88, true, GUIEditor.window[1])
				playerGridlist = guiGridListAddColumn(GUIEditor.gridlist[1], "Spieler", 0.9)
				GUIEditor.button[1] = guiCreateButton(0.42, 0.30, 0.27, 0.09, "Coins geben", true, GUIEditor.window[1])
				GUIEditor.button[2] = guiCreateButton(0.71, 0.30, 0.27, 0.09, "Bannen", true, GUIEditor.window[1])
				GUIEditor.label[1] = guiCreateLabel(0.42, 0.09, 0.27, 0.08, "Coins:", true, GUIEditor.window[1])
				GUIEditor.label[2] = guiCreateLabel(0.71, 0.09, 0.27, 0.08, "Stunden:", true, GUIEditor.window[1])
				GUIEditor.edit[1] = guiCreateEdit(0.42, 0.20, 0.27, 0.08, "", true, GUIEditor.window[1])
				GUIEditor.edit[2] = guiCreateEdit(0.71, 0.20, 0.27, 0.08, "", true, GUIEditor.window[1])
				GUIEditor.button[3] = guiCreateButton(0.42, 0.42, 0.27, 0.09, "Spenden anzeigen", true, GUIEditor.window[1])
				GUIEditor.button[4] = guiCreateButton(0.71, 0.42, 0.27, 0.09, "Permanent bannen", true, GUIEditor.window[1])

				GUIEditor.label[3] = guiCreateLabel(0.42, 0.55, 0.27, 0.08, "Grund:", true, GUIEditor.window[1])

				GUIEditor.edit[3] = guiCreateEdit(0.42, 0.66, 0.27, 0.08, "", true, GUIEditor.window[1])
				GUIEditor.button[5] = guiCreateButton(0.42, 0.76, 0.27, 0.09, "Kicken", true, GUIEditor.window[1])

				GUIEditor.edit[4] = guiCreateEdit(0.71, 0.66, 0.27, 0.08, "", true, GUIEditor.window[1])
				GUIEditor.label[4] = guiCreateLabel(0.71, 0.55, 0.27, 0.08, "Spieler:", true, GUIEditor.window[1])

				GUIEditor.button[6] = guiCreateButton(0.42, 0.88, 0.27, 0.09, "/", true, GUIEditor.window[1])
				GUIEditor.button[7] = guiCreateButton(0.71, 0.76, 0.27, 0.09, "/", true, GUIEditor.window[1])
				GUIEditor.button[8] = guiCreateButton(0.71, 0.88, 0.27, 0.09, "/", true, GUIEditor.window[1])
				
				GUIEditor.set("set",4);
				
				for _,v in ipairs(getElementsByType("player"))do
					row = guiGridListAddRow(GUIEditor.gridlist[1])
					guiGridListSetItemText(GUIEditor.gridlist[1],row,playerGridlist,getPlayerName(v),false,false)
				end
				
				addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
					local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					local menge = guiGetText(GUIEditor.edit[1]);
					local offlineplayer = guiGetText(GUIEditor.edit[4]);
					
					if(player ~= "" or offlineplayer ~= "" and #menge >= 1)then
						if(checkSonderzeichen(menge))then
							triggerServerEvent("adminsystem.coins",localPlayer,player,menge,offlineplayer);
						end
					else infobox.create(language[language.get()][16][2],"error")end
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
					local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					local stunden = guiGetText(GUIEditor.edit[2]);
					local reason = guiGetText(GUIEditor.edit[3]);
					local offlineplayer = guiGetText(GUIEditor.edit[4]);
					
					if(player ~= "" or offlineplayer ~= "")then
						if(#reason >= 1 and #stunden >= 1)then
							if(checkSonderzeichen(stunden))then
								triggerServerEvent("adminsystem.timeban",localPlayer,player,reason,offlineplayer,stunden);
							end
						else infobox.create(language[language.get()][16][1],"error")end
					else infobox.create(language[language.get()][16][1],"error")end
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
					local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					local reason = guiGetText(GUIEditor.edit[3]);
					local offlineplayer = guiGetText(GUIEditor.edit[4]);

					if(player ~= "" or offlineplayer ~= "")then
						if(#reason >= 1)then
							triggerServerEvent("adminsystem.permaban",localPlayer,player,reason,offlineplayer);
						else infobox.create(language[language.get()][16][1],"error")end
					else infobox.create(language[language.get()][16][1],"error")end
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[5],function()
					local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					local reason = guiGetText(GUIEditor.edit[3]);
					
					if(not(player == "") and #reason >= 1)then
						triggerServerEvent("adminsystem.kicken",localPlayer,player,reason);
					else infobox.create(language[language.get()][16][1],"error")end
				end,false)
				
				addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
					triggerServerEvent("adminsystem.spenden",localPlayer);
				end,false)
			end
		end
	end
end)

addEvent("adminsystem.spenden",true)
addEventHandler("adminsystem.spenden",root,function(spenden)
	if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
	
    GUIEditor.window[1] = guiCreateWindow(0.25, 0.27, 0.36, 0.39, "Spenden", true)

    GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.07, 0.46, 0.90, true, GUIEditor.window[1])
    player = guiGridListAddColumn(GUIEditor.gridlist[1], "Spieler", 0.9)
		
    GUIEditor.label[1] = guiCreateLabel(0.50, 0.07, 0.48, 0.08, "Code 1: /", true, GUIEditor.window[1])
    GUIEditor.label[2] = guiCreateLabel(0.50, 0.18, 0.48, 0.08, "Code 2: /", true, GUIEditor.window[1])
    GUIEditor.label[3] = guiCreateLabel(0.50, 0.29, 0.48, 0.08, "Code 3: /", true, GUIEditor.window[1])
		
    GUIEditor.button[1] = guiCreateButton(0.50, 0.89, 0.48, 0.08, "Schließen", true, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(0.50, 0.78, 0.48, 0.08, "Löschen", true, GUIEditor.window[1])
	
	GUIEditor.set("set",3);
	
	for _,v in ipairs(spenden)do
		row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,player,v[1],false,false)
	end
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		GUIEditor.set("reset");
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(not(player == ""))then
			triggerServerEvent("adminsystem.deleteSpende",localPlayer,player);
		else infobox.create(language[language.get()][8][4],"error")end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
		local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
		if(not(player == ""))then
			triggerServerEvent("adminsystem.spendenInfos",localPlayer,player);
		else infobox.create(language[language.get()][8][4],"error")end
	end,false)
end)

addEvent("adminsystem.refreshSpendenGridlist",true)
addEventHandler("adminsystem.refreshSpendenGridlist",root,function(spenden)
	guiGridListClear(GUIEditor.gridlist[1]);
	
	for _,v in ipairs(spenden)do
		row = guiGridListAddRow(GUIEditor.gridlist[1])
		guiGridListSetItemText(GUIEditor.gridlist[1],row,player,v[1],false,false)
	end
end)

addEvent("adminsystem.showSpendenCodes",true)
addEventHandler("adminsystem.showSpendenCodes",root,function(code1,code2,code3)
	guiSetText(GUIEditor.label[1],"Code 1: "..code1);
	guiSetText(GUIEditor.label[2],"Code 2: "..code2);
	guiSetText(GUIEditor.label[3],"Code 3: "..code3);
end)