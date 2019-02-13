--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	cToplist
	Last Edit: 10.02.2019

]]--

Toplist = {"Level","Zombiekills","Bonuspoints","BerkshireCoins","Trophys","Money"};

addEvent("Toplist.createWindow",true)
addEventHandler("Toplist.createWindow",root,function()
	if(isWindowOpen())then
		--// GUI-Elements
		BerkshireApocalypse.window[1] = guiCreateWindow(490, 241, 395, 297, "Toplist", false)

		BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 27, 180, 260, false, BerkshireApocalypse.window[1])
		category = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Category", 0.9)
		BerkshireApocalypse.label[1] = guiCreateLabel(200, 27, 185, 260, "Choose a category.", false, BerkshireApocalypse.window[1])
		guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
		setWindowDatas("set");
		
		for _,v in pairs(Toplist)do
			local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,category,v,false,false);
		end
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.gridlist[1],function()
			local category = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(not(category == ""))then
				triggerServerEvent("Toplist.getDatas",localPlayer,category);
			end
		end,false)
	end
end)

addEvent("Toplist.setDatas",true)
addEventHandler("Toplist.setDatas",root,function(datas)
	if(#datas >= 1)then
		local text = "";
		for i = 1,#datas do
			text = text..i..". "..datas[i][1].." ("..datas[i][2]..")\n";
		end
		guiSetText(BerkshireApocalypse.label[1],text);
	end
end)