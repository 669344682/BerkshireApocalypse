--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

coinshop = {
	["Artikel"] = {
		[0] = {
			{"Waffenlager",10},
			{"Premium (14 Tage)",5},
			{"Lifetime Premium",50},
			{"Zombieskin",25},},
		[1] = {
			{"Weapon Depot",10},
			{"Premium (14 days)",5},
			{"Lifetime Premium",50},
			{"Zombieskin",25},},},
	["Infos"] = {
		[0] = {
			["Waffenlager"] = "Das Waffenlager ermöglicht es dir, bis zu 15 Waffen einzulagern, auf welche du anschließend von überall aus zugreifen kannst.",
			["Premium (14 Tage)"] = "Ein aktiver Premium-Status verschafft dir einige Vorteile. Welche genau das sind, erfährst du im Hilfemenü unter F1.",
			["Lifetime Premium"] = "Ein aktiver Premium-Status verschafft dir einige Vorteile. Welche genau das sind, erfährst du im Hilfemenü unter F1.",
			["Zombieskin"] = "Wenn du den Zombieskin trägst, greifen die Zombies dich nicht mehr an."},
		[1] = {
			["Weapon Depot"] = "The Weapon Depot allows you to store up to 15 weapons, which you can then access from anywhere.",
			["Premium (14 days)"] = "A active premium-status give you some advantages. You can find out exactly what these are from the help menu under F1.",
			["Lifetime Premium"] = "A active premium-status give you some advantages. You can find out exactly what these are from the help menu under F1.",
			["Zombieskin"] = "If you wear the Zombieskin, the zombies will not attack you anymore."},},}
		
addEvent("coinshop.open",true)
addEventHandler("coinshop.open",root,function()
	if(GUIEditor.isWindow())then
        GUIEditor.window[1] = guiCreateWindow(0.27, 0.28, 0.33, 0.36, "Coinshop", true)

        GUIEditor.label[1] = guiCreateLabel(0.02, 0.10, 0.96, 0.25, language[language.get()][15][1], true, GUIEditor.window[1])
		
        GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.38, 0.57, 0.59, true, GUIEditor.window[1])
        artikel = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get()][15][4], 0.5)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get()][4][3], 0.5)
        GUIEditor.label[2] = guiCreateLabel(286, 123, 173, 26, language[language.get()][15][2]..getElementData(localPlayer,"coins"), false, GUIEditor.window[1])

		GUIEditor.button[1] = guiCreateButton(0.61, 0.89, 0.37, 0.08, language[language.get()][4][1], true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.61, 0.78, 0.37, 0.08, language[language.get()][15][3], true, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(0.61, 0.67, 0.37, 0.08, language[language.get()][4][4], true, GUIEditor.window[1])  
		
		GUIEditor.set("set",2);
		
		for key,_ in pairs(coinshop["Artikel"][language.get()])do
			row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,artikel,coinshop["Artikel"][language.get()][key][1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,coinshop["Artikel"][language.get()][key][2].." Coins",false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			GUIEditor.set("reset");
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			coinshop.tauschen();
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local selectedItem = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			
			if(not(selectedItem == ""))then
				guiSetText(GUIEditor.label[1],coinshop["Infos"][language.get()][selectedItem]);
			else infobox.create(language[language.get()][15][9],"error")end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			local selectedItem = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			
			if(not(selectedItem == ""))then
				triggerServerEvent("coinshop.buy",localPlayer,selectedItem);
			else infobox.create(language[language.get()][15][9],"error")end
		end,false)
    end
end)

function coinshop.tauschen()
	if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end

    GUIEditor.window[1] = guiCreateWindow(0.34, 0.33, 0.26, 0.22, language[language.get()][15][5], true)

    GUIEditor.label[1] = guiCreateLabel(0.03, 0.14, 0.95, 0.45, language[language.get()][15][8], true, GUIEditor.window[1])

    GUIEditor.edit[1] = guiCreateEdit(0.03, 0.64, 0.95, 0.14, "", true, GUIEditor.window[1])
		
    GUIEditor.button[1] = guiCreateButton(0.03, 0.83, 0.46, 0.12, language[language.get()][15][6], true, GUIEditor.window[1])
    GUIEditor.button[2] = guiCreateButton(0.52, 0.83, 0.46, 0.12, language[language.get()][4][1], true, GUIEditor.window[1])
	
	GUIEditor.set("set",1);
	
	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local coins = guiGetText(GUIEditor.edit[1]);
		
		if(#coins >= 1)then
			if(checkSonderzeichen(coins))then
				triggerServerEvent("coinshop.tauschen",localPlayer,coins);
			end
		else infobox.create(language[language.get()][15][7],"error")end
	end,false)
	
	addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
		GUIEditor.set("reset");
	end,false)
end