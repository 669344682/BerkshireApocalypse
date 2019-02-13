--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	cAdminsystem
	Last Edit: 13.02.2019

]]--

bindKey("f4","down",function()
	if(isWindowOpen())then
		if(getElementData(localPlayer,"Adminlevel") >= 1)then
			--// GUI-Elements
			BerkshireApocalypse.window[1] = guiCreateWindow(364, 226, 655, 379, "Adminsystem", false)

			BerkshireApocalypse.label[1] = guiCreateLabel(10, 28, 160, 26, "All players:", false, BerkshireApocalypse.window[1])
			guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
			guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", false)
			guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
			BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 64, 160, 305, false, BerkshireApocalypse.window[1])
			playerGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Player", 0.9)
			BerkshireApocalypse.button[1] = guiCreateButton(180, 28, 160, 26, "Give adminlevel", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.button[2] = guiCreateButton(180, 64, 160, 26, "Give Berkshire-Coins", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[2], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.button[3] = guiCreateButton(180, 100, 160, 26, "Kick player", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[3], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.button[4] = guiCreateButton(180, 209, 160, 26, "Ban player", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[4], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.label[2] = guiCreateLabel(180, 136, 160, 63, "If you want that the player get a time-ban, enter the number of hours, otherwise he will get a permanent ban.", false, BerkshireApocalypse.window[1])
			guiSetFont(BerkshireApocalypse.label[2], "default-bold-small")
			guiLabelSetHorizontalAlign(BerkshireApocalypse.label[2], "center", true)
			guiLabelSetVerticalAlign(BerkshireApocalypse.label[2], "center")
			BerkshireApocalypse.button[5] = guiCreateButton(180, 245, 160, 26, "Give presents", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[5], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.button[6] = guiCreateButton(180, 281, 160, 26, "Show player infos", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[6], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.label[3] = guiCreateLabel(350, 28, 160, 26, "Reason / ID / Amount:", false, BerkshireApocalypse.window[1])
			guiSetFont(BerkshireApocalypse.label[3], "default-bold-small")
			guiLabelSetHorizontalAlign(BerkshireApocalypse.label[3], "center", false)
			guiLabelSetVerticalAlign(BerkshireApocalypse.label[3], "center")
			BerkshireApocalypse.edit[1] = guiCreateEdit(350, 64, 160, 26, "", false, BerkshireApocalypse.window[1])
			BerkshireApocalypse.label[4] = guiCreateLabel(350, 100, 160, 26, "Length of the ban in hours:", false, BerkshireApocalypse.window[1])
			guiSetFont(BerkshireApocalypse.label[4], "default-bold-small")
			guiLabelSetHorizontalAlign(BerkshireApocalypse.label[4], "center", false)
			guiLabelSetVerticalAlign(BerkshireApocalypse.label[4], "center")
			BerkshireApocalypse.edit[2] = guiCreateEdit(350, 136, 160, 26, "", false, BerkshireApocalypse.window[1])
			BerkshireApocalypse.gridlist[2] = guiCreateGridList(350, 172, 160, 135, false, BerkshireApocalypse.window[1])
			savezoneGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[2], "Savezone", 0.9)
			BerkshireApocalypse.button[7] = guiCreateButton(350, 317, 160, 26, "Teleport to zone", false, BerkshireApocalypse.window[1])
			guiSetProperty(BerkshireApocalypse.button[7], "NormalTextColour", "FFAAAAAA")
			--BerkshireApocalypse.button[8] = guiCreateButton(180, 317, 160, 26, "Teleport to zone", false, BerkshireApocalypse.window[1])
			--guiSetProperty(BerkshireApocalypse.button[8], "NormalTextColour", "FFAAAAAA")
			BerkshireApocalypse.label[5] = guiCreateLabel(520, 28, 125, 98, "Adminlevel:\n\n0. User\n1. Supporter\n2. Moderator\n3. Administrator\n4. Project Manager", false, BerkshireApocalypse.window[1])
			guiSetFont(BerkshireApocalypse.label[5], "default-bold-small")
			--BerkshireApocalypse.label[6] = guiCreateLabel(180, 353, 465, 16, "Berkshire County", false, BerkshireApocalypse.window[1])
			--guiSetFont(BerkshireApocalypse.label[6], "default-bold-small")
			--guiLabelSetHorizontalAlign(BerkshireApocalypse.label[6], "center", false)
			--guiLabelSetVerticalAlign(BerkshireApocalypse.label[6], "center")
			--BerkshireApocalypse.label[7] = guiCreateLabel(520, 136, 125, 207, "Factions:\n\n0. Civilian\n1. Police Department\n2. Rescue Team\n3. Zombie-Killer\n4. Underground-Dogs", false, BerkshireApocalypse.window[1])
			--guiSetFont(BerkshireApocalypse.label[7], "default-bold-small")
			setWindowDatas("set");
			
			--// Functions
			for _,v in pairs(getElementsByType("player"))do
				local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
				guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,playerGridlist,getPlayerName(v),false,false);
			end
			
			for _,v in pairs(Adminsystem["Savezones"])do
				local row = guiGridListAddRow(BerkshireApocalypse.gridlist[2]);
				guiGridListSetItemText(BerkshireApocalypse.gridlist[2],row,savezoneGridlist,v,false,false);
			end
			
			--// Give adminlevel
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
				local player = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				local adminlevel = guiGetText(BerkshireApocalypse.edit[1]);
				if(player ~= "" and #adminlevel >= 1 and tonumber(adminlevel))then
					triggerServerEvent("Adminsystem.givePlayerAdminlevel",localPlayer,player,adminlevel);
				end
			end,false)
			
			--// Give Berkshire-Coins
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[2],function()
				local player = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				local berkshirecoins = guiGetText(BerkshireApocalypse.edit[1]);
				if(player ~= "" and #berkshirecoins >= 1 and tonumber(berkshirecoins))then
					triggerServerEvent("Adminsystem.giveBerkshireCoins",localPlayer,player,berkshirecoins);
				end
			end,false)
			
			--// Kick player
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[3],function()
				local player = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				local reason = guiGetText(BerkshireApocalypse.edit[1]);
				if(player ~= "" and #reason >= 1)then
					triggerServerEvent("Adminsystem.kickPlayer",localPlayer,player,reason);
				end
			end,false)
			
			--// Ban player
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[4],function()
				local player  = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				local reason  = guiGetText(BerkshireApocalypse.edit[1]);
				local banTime = guiGetText(BerkshireApocalypse.edit[2]);
				if(player ~= "" and #reason >= 1)then
					if(#banTime >= 1 and tonumber(banTime))then banTime = banTime else banTime = 0 end
					triggerServerEvent("Adminsystem.banPlayer",localPlayer,player,reason,banTime);
				end
			end,false)
			
			--// Give presents
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[5],function()
				local player = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				local presents = guiGetText(BerkshireApocalypse.edit[1]);
				if(player ~= "" and #presents >= 1 and tonumber(presents))then
					triggerServerEvent("Adminsystem.givePresents",localPlayer,player,presents);
				end
			end,false)
			
			--// Show player infos
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[6],function()
				local player = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
				if(player ~= "")then
					triggerServerEvent("Adminsystem.showPlayerInfos",localPlayer,player);
				end
			end,false)
			
			--// Teleport to zone
			addEventHandler("onClientGUIClick",BerkshireApocalypse.button[7],function()
				local zone = getItemFromGridlist(BerkshireApocalypse.gridlist[2],1);
				if(zone ~= "")then
					triggerServerEvent("Adminsystem.teleportToZone",localPlayer,zone);
				end
			end,false)
		end
	end
end)

--// Function to get something easier and with fewer code from a gridlist
function getItemFromGridlist(gridlist,position)
	if(isElement(gridlist))then
		return guiGridListGetItemText(gridlist,guiGridListGetSelectedItem(gridlist),position);
	end
end