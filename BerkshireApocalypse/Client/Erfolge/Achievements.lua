--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

Achievements = {open = false,
	["Infos"] = {
		[0] = {
			["Zombie-Killer #1"] = "Töte 10.000 Zombies.",
			["Zombie-Killer #2"] = "Töte 50.000 Zombies.",
			["Zombie-Killer #3"] = "Töte 125.000 Zombies.",
			["Zombie-Killer #4"] = "Töte 250.000 Zombies.",
			["Zombie-Killer #5"] = "Töte 500.000 Zombies.",
			["Zombie-Killer #6"] = "Töte 1.000.000 Zombies.",
			["Level-Experte #1"] = "Steige ein Level auf.",
			["Level-Experte #2"] = "Erreiche Level 10.",
			["Level-Experte #3"] = "Erreiche Level 25.",
			["Level-Experte #4"] = "Erreiche Level 50.",
			["Level-Experte #5"] = "Erreiche Level 100.",
			["Level-Experte #6"] = "Erreiche Level 250.",
			["Waffennarr"] = "Kauf eine Waffe.",
			["Bonze"] = "Krieg einen Payday.",
			["Kenny #1"] = "Stirb.",
			["Kenny #2"] = "Stirb 10 Mal.",
			["Kenny #3"] = "Stirb 25 Mal.",
			["Kenny #4"] = "Stirb 50 Mal."},
		[1] = {
			["Zombie-Killer #1"] = "Kill 10.000 Zombies.",
			["Zombie-Killer #2"] = "Kill 50.000 Zombies.",
			["Zombie-Killer #3"] = "Kill 125.000 Zombies.",
			["Zombie-Killer #4"] = "Kill 250.000 Zombies.",
			["Zombie-Killer #5"] = "Kill 500.000 Zombies.",
			["Zombie-Killer #6"] = "Kill 1.000.000 Zombies.",
			["Level-Expert #1"] = "Reach a New Level.",
			["Level-Expert #2"] = "Reach Level 10.",
			["Level-Expert #3"] = "Reach Level 25.",
			["Level-Expert #4"] = "Reach Level 50.",
			["Level-Expert #5"] = "Reach Level 100.",
			["Level-Expert #6"] = "Reach Level 250.",
			["Weapon lover"] = "Buy a gun.",
			["Rich boy"] = "Get a Payday.",
			["Kenny #1"] = "Die.",
			["Kenny #2"] = "Die 10 times.",
			["Kenny #3"] = "Die 25 times.",
			["Kenny #4"] = "Die 50 times."},},}

function Achievements.render()
	if(GUIEditor.isWindow())then
		dxDrawImage(0*(x/1440), 0*(y/900), 1440*(x/1440), 900*(y/900), "Files/Balken.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawText(language[language.get()][19][1].."\n"..Achievements.text.."\n"..language[language.get()][19][2], 0*(x/1440), -9*(y/900), 1440*(x/1440), 891*(y/900), tocolor(0, 200, 0, 255), 1.50, "pricedown", "center", "center", false, true, false, false, false)
	end
end

addEvent("Achievements.show",true)
addEventHandler("Achievements.show",root,function(text)
	Achievements.text = text;
	
	if(GUIEditor.isWindow())then
		addEventHandler("onClientRender",root,Achievements.render);
		setTimer(function()
			removeEventHandler("onClientRender",root,Achievements.render);
		end,7500,1)
	else outputChatBox("#0040FF[INFO] #FFFFFF"..language[language.get()][19][1]..": "..text.." / "..language[language.get()][19][2]..".",255,255,255,true)end
end)

bindKey("f5","down",function()
	if(Achievements.open == true)then
		GUIEditor.set("reset");
		Achievements.open = false;
	else
		if(GUIEditor.isWindow())then
			Achievements.open = true;
			GUIEditor.window[1] = guiCreateWindow(0.40, 0.36, 0.28, 0.36, "Achievements", true)
			
			GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.11, 0.95, 0.62, true, GUIEditor.window[1])
			achievementColumn = guiGridListAddColumn(GUIEditor.gridlist[1], "Achievement", 0.7)
			erreichtColumn = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get()][22][2], 0.2)
			GUIEditor.label[1] = guiCreateLabel(0.03, 0.76, 0.95, 0.21, language[language.get()][22][1], true, GUIEditor.window[1])
			GUIEditor.label[2] = guiCreateLabel(0.00, 0.00, 1.00, 0.08, "Achievements", true, GUIEditor.window[1])
			
			GUIEditor.set("set",2);
					
			Achievements.state();
					
			addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
				local achievement = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
				
				if(not(achievement == ""))then
					guiSetText(GUIEditor.label[1],Achievements["Infos"][language.get()][achievement]);
				end
			end,false)
		end
	end
end)

function Achievements.state(achievement,state)
	if(achievement and state)then
		row = guiGridListAddRow(GUIEditor.gridlist[1]);
		guiGridListSetItemText(GUIEditor.gridlist[1],row,achievementColumn,achievement,false,false)
		guiGridListSetItemText(GUIEditor.gridlist[1],row,erreichtColumn,state,false,false);
	else
		for i = 1,18 do
			triggerServerEvent("Achievements.state",localPlayer,i);
		end
	end
end
addEvent("Achievements.state",true)
addEventHandler("Achievements.state",root,Achievements.state)