--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

waffenladen = {
	{"Desert Eagle",250,0,42},
	{"Mp5",500,5,120},
	{"M4",1000,8,200},
	{"AK-47",1200,9,150},
	{"County Rifle",1500,10,75},
	{"Sniper",3000,14,35},}
	
addEvent("waffenladen.open",true)
addEventHandler("waffenladen.open",root,function()
	if(GUIEditor.isWindow())then
        GUIEditor.window[1] = guiCreateWindow(0.29, 0.23, 0.30, 0.35, language[language.get()][3][1], true)
		
        GUIEditor.button[2] = guiCreateButton(0.02, 0.89, 0.95, 0.08, language[language.get()][4][1], true, GUIEditor.window[1])
        GUIEditor.button[3] = guiCreateButton(0.02, 0.78, 0.95, 0.08, language[language.get()][4][4], true, GUIEditor.window[1])
		
        GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.11, 0.95, 0.64, true, GUIEditor.window[1])
		waffe = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get(localPlayer)][4][6], 0.3)
        preis = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get(localPlayer)][4][3], 0.2)
        level = guiGridListAddColumn(GUIEditor.gridlist[1], "Level", 0.2)
		munition  = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get(localPlayer)][4][7] ,0.2)
		
		GUIEditor.set("set");
		
		for key,_ in pairs(waffenladen)do
			row = guiGridListAddRow(GUIEditor.gridlist[1])
			guiGridListSetItemText(GUIEditor.gridlist[1],row,waffe,waffenladen[key][1],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,preis,waffenladen[key][2].."$",false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,level,waffenladen[key][3],false,false)
			guiGridListSetItemText(GUIEditor.gridlist[1],row,munition,waffenladen[key][4],false,false)
		end
		
		addEventHandler("onClientGUIClick",GUIEditor.button[3],function()
			local selectedText = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					
			if(not(selectedText == ""))then
				triggerServerEvent("waffenladen.buy",localPlayer,selectedText);
			else infobox.create(language[language.get(localPlayer)][7][1],"error")end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			GUIEditor.set("reset");
		end,false)
	end
end)