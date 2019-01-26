--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

Topliste = {
	["Names"] = {
		["Level"] = "level",
		["Zombiekills"] = "zombiekills",
		["Tode"] = "deaths",
		["Deaths"] = "deaths",
		["Bonuspunkte"] = "bonuspoints",
		["Bonuspoints"] = "bonuspoints",
		["Coins"] = "coins",
		["Pokale"] = "pokale",
		["Trophys"] = "pokale",
		["Geld"] = "money",
		["Money"] = "money"},}

addEvent("Topliste.window",true)
addEventHandler("Topliste.window",root,function()
	if(GUIEditor.isWindow())then
        GUIEditor.window[1] = guiCreateWindow(0.50, 0.23, 0.37, 0.39, language[language.get()][21][1], true)

        GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.10, 0.39, 0.77, true, GUIEditor.window[1])
        kategorie = guiGridListAddColumn(GUIEditor.gridlist[1], "Kategorie", 0.9)
        GUIEditor.label[1] = guiCreateLabel(0.43, 0.10, 0.56, 0.76, language[language.get()][21][3], true, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(0.02, 0.90, 0.47, 0.08, language[language.get()][21][2], true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.51, 0.90, 0.47, 0.08, language[language.get(localPlayer)][4][1], true, GUIEditor.window[1])
		
		GUIEditor.set("set",1);
		
		for key,_ in pairs(language[language.get()][20])do
			row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,kategorie,language[language.get()][20][key],false,false)
		end
		
		addEventHandler("onClientGUIDoubleClick",GUIEditor.gridlist[1],function()
			local kategorie = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(kategorie ~= "")then
				triggerServerEvent("Topliste.get",localPlayer,Topliste["Names"][kategorie],15);
			else cInfobox("Wähl eine Kategorie aus!",255,0,0)end
		end,false)

		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local kategorie = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(kategorie ~= "")then
				triggerServerEvent("Topliste.get",localPlayer,Topliste["Names"][kategorie],15);
			else cInfobox("Wähl eine Kategorie aus!",255,0,0)end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			GUIEditor.set("reset");
		end,false)
	end
end)

addEvent("Topliste.set",true)
addEventHandler("Topliste.set",root,function(currentTop)
	if(#currentTop >= 1)then
		local text = ""
		for i=1,#currentTop do
			text = text.." \n"..i..". "..currentTop[i][1].." ("..currentTop[i][2]..")"
		end
		guiSetText(GUIEditor.label[1],text);
	end
end)