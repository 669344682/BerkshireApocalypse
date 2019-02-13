--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	cSkinshop
	Last Edit: 11.02.2019
	
]]--

Skinshop = {
	["Skins"] = {
		1,2,7,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
	},
};

function Skinshop.rotate()
	setPedRotation(Skinshop.ped,getPedRotation(Skinshop.ped)+1);
end

addEvent("Skinshop.createWindow",true)
addEventHandler("Skinshop.createWindow",root,function()
	if(isWindowOpen())then
		setCameraMatrix(-1967.2114257813,155.61239624023,28.535299301147,-1966.6033935547,156.40293884277,28.462062835693);
		Skinshop.ped = createPed(0,-1963.2409667969,160.98368835449,27.6875,180);
		addEventHandler("onClientRender",root,Skinshop.rotate);
		
		--// GUI-Elements
        BerkshireApocalypse.window[1] = guiCreateWindow(10, 293, 275, 314, "Skinshop", false)

        BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 26, 255, 239, false, BerkshireApocalypse.window[1])
        skinGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Skin", 0.5)
		priceGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Price", 0.5)
        BerkshireApocalypse.button[1] = guiCreateButton(62, 275, 150, 29, "Buy", false, BerkshireApocalypse.window[1])
        guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
		setWindowDatas("set",true,true);

		for _,v in pairs(Skinshop["Skins"])do
			local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,skinGridlist,v,false,false);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,priceGridlist,"500 BP",false,false);
		end
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
			local skin = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(not(skin == ""))then
				triggerServerEvent("Skinshop.buy",localPlayer,skin);
			end
		end,false)
		
		addEventHandler("onClientGUIClick",BerkshireApocalypse.gridlist[1],function()
			local skin = getItemFromGridlist(BerkshireApocalypse.gridlist[1],1);
			if(not(skin == ""))then
				setElementModel(Skinshop.ped,skin);
			end
		end,false)
	end
end)

function Skinshop.destroy()
	if(isElement(Skinshop.ped))then
		destroyElement(Skinshop.ped);
		removeEventHandler("onClientRender",root,Skinshop.rotate);
		setCameraTarget(localPlayer);
	end
end