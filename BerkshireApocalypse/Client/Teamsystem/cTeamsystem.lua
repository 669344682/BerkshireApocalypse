--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	cTeamsystem
	Last Edit: 11.02.2019

]]--

Teamsystem = {blips = {}};

addEvent("Teamsystem.createTeam",true)
addEventHandler("Teamsystem.createTeam",root,function()
	if(isWindowOpen())then
        BerkshireApocalypse.window[1] = guiCreateWindow(343, 270, 345, 167, "Team", false)

        BerkshireApocalypse.label[1] = guiCreateLabel(10, 28, 325, 60, "Here you can create a team for $50.000!", false, BerkshireApocalypse.window[1])
        guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
        guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", true)
        guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
        BerkshireApocalypse.label[2] = guiCreateLabel(10, 98, 154, 23, "Name:", false, BerkshireApocalypse.window[1])
        guiSetFont(BerkshireApocalypse.label[2], "default-bold-small")
        guiLabelSetHorizontalAlign(BerkshireApocalypse.label[2], "center", true)
        guiLabelSetVerticalAlign(BerkshireApocalypse.label[2], "center")
        BerkshireApocalypse.button[1] = guiCreateButton(10, 131, 325, 26, "Create", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
        BerkshireApocalypse.edit[1] = guiCreateEdit(174, 98, 161, 23, "", false, BerkshireApocalypse.window[1])
		setWindowDatas("set");
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
			local name = guiGetText(BerkshireApocalypse.edit[1]);
			if(#name >= 1)then
				triggerServerEvent("Teamsystem.createTeam",localPlayer,name);
			end
		end,false)
	end
end)

addEvent("Teamsystem.openTeampanel",true)
addEventHandler("Teamsystem.openTeampanel",root,function(name)
	if(isWindowOpen())then
        BerkshireApocalypse.window[1] = guiCreateWindow(343, 270, 494, 281, "Team", false)

        BerkshireApocalypse.label[1] = guiCreateLabel(275, 134, 209, 23, "Name / Amount:", false, BerkshireApocalypse.window[1])
        guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
        guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", true)
        guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
        BerkshireApocalypse.button[1] = guiCreateButton(275, 26, 209, 26, "Rang-Up", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
        BerkshireApocalypse.edit[1] = guiCreateEdit(275, 167, 209, 26, "", false, BerkshireApocalypse.window[1])
        BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 26, 255, 245, false, BerkshireApocalypse.window[1])
        playerGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Player", 0.4)
        rangGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Rang", 0.2)
        stateGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "State", 0.3)
        BerkshireApocalypse.button[2] = guiCreateButton(275, 62, 209, 26, "Rang-Down", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[2], "NormalTextColour", "FFAAAAAA")
        BerkshireApocalypse.button[3] = guiCreateButton(275, 98, 209, 26, "Uninvite", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[3], "NormalTextColour", "FFAAAAAA")
        BerkshireApocalypse.button[4] = guiCreateButton(275, 203, 209, 26, "Invite", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[4], "NormalTextColour", "FFAAAAAA")
        BerkshireApocalypse.button[5] = guiCreateButton(275, 239, 100, 32, "Pay off", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[5], "NormalTextColour", "FFAAAAAA")
        BerkshireApocalypse.button[6] = guiCreateButton(384, 239, 100, 32, "Deposit", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[6], "NormalTextColour", "FFAAAAAA")
		setWindowDatas("set");
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[2],function()
			local target = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(target ~= "")then
				triggerServerEvent("Teamsystem.changeRang",localPlayer,target,"Rang-Down");
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
			local target = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(target ~= "")then
				triggerServerEvent("Teamsystem.changeRang",localPlayer,target,"Rang-Up");
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[3],function()
			local target = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(target ~= "")then
				triggerServerEvent("Teamsystem.inviteUninvite",localPlayer,target,"Uninvite");
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[4],function()
			local target = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(target ~= "")then
				triggerServerEvent("Teamsystem.inviteUninvite",localPlayer,target,"Invite");
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[5],function()
			local amount = guiGetText(BerkshireApocalypse.edit[1]);
			if(#amount >= 1 and tonumber(amount))then
				triggerServerEvent("Teamsystem.cashRegister",localPlayer,amount,"Pay off");
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[6],function()
			local amount = guiGetText(BerkshireApocalypse.edit[1]);
			if(#amount >= 1 and tonumber(amount))then
				triggerServerEvent("Teamsystem.cashRegister",localPlayer,amount,"Deposit");
			end
		end,false)
	end
end)

addEvent("Teamsystem.updateTeampanel",true)
addEventHandler("Teamsystem.updateTeampanel",root,function(members,cash,name)
	if(isElement(BerkshireApocalypse.window[1]))then
		guiGridListClear(BerkshireApocalypse.gridlist[1]);
		if(#members >= 1)then
			for _,v in pairs(members)do
				local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
				guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,playerGridlist,v[1],false,false);
				guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,rangGridlist,v[2],false,false);
				guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,stateGridlist,v[3],false,false);
			end
		end
	end
end)

addEvent("Teamsystem.createBlips",true)
addEventHandler("Teamsystem.createBlips",root,function()
	for i = 1,#Teamsystem.blips do
		if(isElement(Teamsystem.blips[i]))then
			destroyElement(Teamsystem.blips[i]);
		end
	end
	
	local counter = 0;
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"Team") == getElementData(localPlayer,"Team"))then
			if(getPlayerName(v) ~= getPlayerName(localPlayer))then
				counter = counter + 1;
				Teamsystem.blips[counter] = createBlipAttachedTo(v,0,2,0,255,0);
			end
		end
	end
end)