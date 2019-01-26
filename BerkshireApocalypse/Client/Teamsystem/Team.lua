--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

team = {state = false, blips = {}, id = 0, nr = 0}

addEvent("team.create",true)
addEventHandler("team.create",root,function()
	if(GUIEditor.isWindow())then
        GUIEditor.window[1] = guiCreateWindow(0.37, 0.30, 0.29, 0.24, "Team", true)
		
        GUIEditor.label[1] = guiCreateLabel(0.02, 0.15, 0.95, 0.26, language[language.get(localPlayer)][8][1], true, GUIEditor.window[1])
        GUIEditor.label[2] = guiCreateLabel(0.00, 0.00, 1.00, 0.11, "Team", true, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(0.02, 0.46, 0.41, 0.11, "Teamname:", true, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(0.02, 0.85, 0.96, 0.11, language[language.get(localPlayer)][4][1], true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.02, 0.69, 0.96, 0.11, language[language.get(localPlayer)][8][2], true, GUIEditor.window[1])
		
        GUIEditor.edit[1] = guiCreateEdit(0.46, 0.46, 0.52, 0.11, "", true, GUIEditor.window[1])    
		
		GUIEditor.set("set",3);
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			local name = guiGetText(GUIEditor.edit[1]);
			if(#name >= 1)then
				triggerServerEvent("team.create",localPlayer,name);
			else infobox.create(language[language.get(localPlayer)][8][3],"error")end
		end,false)

		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			GUIEditor.set("reset");
		end,false)
	end
end)

addEvent("team.open",true)
addEventHandler("team.open",root,function(name)
	if(team.state == true)then
		team.state = false
		GUIEditor.set("reset");
	else
		if(GUIEditor.isWindow())then
			team.state = true
			
			GUIEditor.window[1] = guiCreateWindow(0.20, 0.26, 0.38, 0.36, "Team: "..name, true)
			
			GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.11, 0.67, 0.64, true, GUIEditor.window[1])
			spieler = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get(localPlayer)][9][1], 0.3)
			rang = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get(localPlayer)][9][2], 0.3)
			status = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get(localPlayer)][9][3], 0.3)
			
			GUIEditor.edit[1] = guiCreateEdit(0.32, 0.78, 0.37, 0.08, "", true, GUIEditor.window[1])
			GUIEditor.edit[2] = guiCreateEdit(0.70, 0.45, 0.28, 0.08, language[language.get()][9][4], true, GUIEditor.window[1])
			
			GUIEditor.label[1] = guiCreateLabel(0.00, 0.00, 1.00, 0.08, "Team: "..name, true, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(0.02, 0.78, 0.28, 0.08, language[language.get(localPlayer)][9][1]..":", true, GUIEditor.window[1])
			GUIEditor.label[3] = guiCreateLabel(0.32, 0.89, 0.37, 0.08, "Kasse: 100.000$", true, GUIEditor.window[1])
			
			GUIEditor.button[1] = guiCreateButton(0.70, 0.11, 0.28, 0.08, "Rang Up", true, GUIEditor.window[1])
			GUIEditor.button[2] = guiCreateButton(0.70, 0.22, 0.28, 0.08, "Rang Down", true, GUIEditor.window[1])
			GUIEditor.button[3] = guiCreateButton(0.70, 0.33, 0.28, 0.08, language[language.get(localPlayer)][9][6], true, GUIEditor.window[1])
			GUIEditor.button[4] = guiCreateButton(0.02, 0.89, 0.28, 0.08, language[language.get(localPlayer)][9][5], true, GUIEditor.window[1])
			GUIEditor.button[5] = guiCreateButton(0.70, 0.56, 0.28, 0.08, language[language.get(localPlayer)][9][7], true, GUIEditor.window[1])
			GUIEditor.button[6] = guiCreateButton(0.70, 0.67, 0.28, 0.08, language[language.get(localPlayer)][9][8], true, GUIEditor.window[1])
			
			GUIEditor.set("set",3);
			
			addEventHandler("onClientGUIClick",GUIEditor.button[5],function()
				local edit = guiGetText(GUIEditor.edit[2])
				if(tonumber(#edit) >= 1)then
					if(checkSonderzeichen(edit))then
						triggerServerEvent("team.kasse",localPlayer,edit,"einzahlen");
					end
				else infobox.create(language[language.get(localPlayer)][8][4],"error")end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[6],function()
				local edit = guiGetText(GUIEditor.edit[2])
				if(tonumber(#edit) >= 1)then
					if(checkSonderzeichen(edit))then
						triggerServerEvent("team.kasse",localPlayer,edit,"auszahlen");
					end
				else infobox.create(language[language.get(localPlayer)][8][4],"error")end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
				local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(not(player == ""))then
					triggerServerEvent("team.rang",localPlayer,player,"up");
				else infobox.create(language[language.get(localPlayer)][8][3],"error")end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
				local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(not(player == ""))then
					triggerServerEvent("team.rang",localPlayer,player,"down");
				else infobox.create(language[language.get(localPlayer)][8][3],"error")end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
				local player = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				if(not(player == ""))then
					triggerServerEvent("team.uninvite",localPlayer,player);
				else infobox.create(language[language.get(localPlayer)][8][3],"error")end
			end,false)
			
			addEventHandler("onClientGUIClick",GUIEditor.button[4],function()
				local edit = guiGetText(GUIEditor.edit[1])
				if(#edit >= 1)then
					triggerServerEvent("team.invite",localPlayer,edit);
				else infobox.create(language[language.get(localPlayer)][8][3],"error")end
			end,false)	
		end
	end
end)

addEvent("team.update",true)
addEventHandler("team.update",root,function(mitglieder,kasse)
	if(team.state == true)then
		guiGridListClear(GUIEditor.gridlist[1]);
		if(#mitglieder >= 1)then
			for _,v in pairs(mitglieder) do
				local row = guiGridListAddRow(GUIEditor.gridlist[1]);
				guiGridListSetItemText(GUIEditor.gridlist[1],row,spieler,v[1],false,false);
				guiGridListSetItemText(GUIEditor.gridlist[1],row,rang,v[2],false,false);
				guiGridListSetItemText(GUIEditor.gridlist[1],row,status,v[3],false,false);
			end
		end
		guiSetText(GUIEditor.label[3],language[language.get(localPlayer)][9][9].."\n"..kasse.."$");
	end
end)

addEvent("team.blips",true)
addEventHandler("team.blips",root,function()
	for i = 1,team.id do
		if(isElement(team.blips[i]))then
			destroyElement(team.blips[i]);
		end
	end
	team.id = 0
	for _,v in ipairs(getElementsByType("player"))do
		if(getElementData(v,"team") == getElementData(localPlayer,"team"))then
			if(getPlayerName(v) ~= getPlayerName(localPlayer))then
				createBlipAttachedTo(v,0,2,0,255,0);
			end
		end
	end
end)