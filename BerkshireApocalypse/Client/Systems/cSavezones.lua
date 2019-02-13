--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden

	cSavezone
	Last Edit: 13.02.2019
	
]]--

addEvent("Savezones.createWindow",true)
addEventHandler("Savezones.createWindow",root,function()
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Premium") == 1 or getElementData(localPlayer,"LifetimePremium") == 1)then
			--// GUI-Elements
			BerkshireApocalypse.window[1] = guiCreateWindow(10, 293, 275, 314, "Savezones", false)

			BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 26, 255, 239, false, BerkshireApocalypse.window[1])
			savezoneGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Savezone", 0.9)
			BerkshireApocalypse.button[1] = guiCreateButton(62, 275, 150, 29, "Teleport", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
			setWindowDatas("set");

			for _,v in pairs(Adminsystem["Savezones"])do
				local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
				guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,savezoneGridlist,v,false,false);
			end
			
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
				local savezone = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				if(savezone ~= "")then
					triggerServerEvent("Adminsystem.teleportToZone",localPlayer,savezone);
				end
			end,false)
		else infobox("Only for premium members!",255,0,0)end
	end
end)