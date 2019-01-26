--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

skinshop = {1,2,7,9,10,11,12,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40}

function skinshop.rotate()
	setPedRotation(skinshop.ped,getPedRotation(skinshop.ped)+1);
end

addEvent("skinshop.open",true)
addEventHandler("skinshop.open",root,function()
	if(GUIEditor.isWindow())then
		setCameraMatrix(217.30323791504,-102.14064025879,1006.2123413086,217.81326293945,-4.0360698699951,986.84143066406);
		skinshop.ped = createPed(0,217.56520080566,-98.42569732666,1005.2578125,180);
		setElementInterior(skinshop.ped,15);
		setElementInterior(localPlayer,15)
		addEventHandler("onClientRender",root,skinshop.rotate);
		
		GUIEditor.window[1] = guiCreateWindow(0.20, 0.26, 0.20, 0.36, "Skinshop", true)
		guiWindowSetSizable(GUIEditor.window[1],false);
		guiWindowSetMovable(GUIEditor.window[1],false);
		
		GUIEditor.gridlist[1] = guiCreateGridList(0.03, 0.11, 0.94, 0.64, true, GUIEditor.window[1])
		skin = guiGridListAddColumn(GUIEditor.gridlist[1],language[language.get(localPlayer)][4][2], 0.5)
		price = guiGridListAddColumn(GUIEditor.gridlist[1],language[language.get(localPlayer)][4][3], 0.5)
		
		GUIEditor.button[1] = guiCreateButton(0.04, 0.78, 0.92, 0.08, language[language.get(localPlayer)][4][4], true, GUIEditor.window[1])
		GUIEditor.button[2] = guiCreateButton(0.04, 0.89, 0.92, 0.08, language[language.get(localPlayer)][4][1], true, GUIEditor.window[1])
			
		GUIEditor.set("set","none","blur");
		
		for _,v in ipairs(skinshop)do
			row = guiGridListAddRow(GUIEditor.gridlist[1]);
			guiGridListSetItemText(GUIEditor.gridlist[1],row,skin,v,false,false);
			guiGridListSetItemText(GUIEditor.gridlist[1],row,price,"500 BP",false,false);
		end
			
		addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
			local ID = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			setElementModel(skinshop.ped,ID);
		end,false)
			
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local ID = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
			if(not(ID == ""))then
				triggerServerEvent("skinshop.buy",localPlayer,ID);
			else infobox.create(language[language.get(localPlayer)][4][5],"error")end
		end,false)
			
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			GUIEditor.set("reset");
			removeEventHandler("onClientRender",root,skinshop.rotate);
			destroyElement(skinshop.ped);
			setCameraTarget(localPlayer);
			setElementInterior(localPlayer,0);
			triggerServerEvent("skinshop.spawn",localPlayer);
		end,false)
	end
end)