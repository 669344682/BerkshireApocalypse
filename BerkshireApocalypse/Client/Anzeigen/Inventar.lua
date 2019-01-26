--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

inventar = {open = false, colors = {},
	["Fields"] = {
        [1] = {485*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [2] = {545*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [3] = {605*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [4] = {665*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [5] = {725*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [6] = {785*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [7] = {845*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [8] = {905*(x/1440), 340*(y/900), 50*(x/1440), 41*(y/900)},
        [9] = {485*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [10] = {485*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [11] = {485*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [12] = {545*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [13] = {545*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [14] = {545*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [15] = {605*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [16] = {665*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [17] = {725*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [18] = {785*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [19] = {845*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [20] = {905*(x/1440), 493*(y/900), 50*(x/1440), 41*(y/900)},
        [21] = {605*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [22] = {605*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [23] = {665*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [24] = {665*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [25] = {725*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [26] = {725*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [27] = {785*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [28] = {785*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [29] = {845*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [30] = {845*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [31] = {905*(x/1440), 442*(y/900), 50*(x/1440), 41*(y/900)},
        [32] = {905*(x/1440), 391*(y/900), 50*(x/1440), 41*(y/900)},
        [33] = {485*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [34] = {545*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [35] = {605*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [36] = {665*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [37] = {725*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [38] = {785*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [39] = {845*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},
        [40] = {905*(x/1440), 544*(y/900), 50*(x/1440), 41*(y/900)},},
	["Items"] = {"bonuspoints","chest","heart","coins","pokale","zombieskin"},
	["Names"] = {["bonuspoints"] = 1,["chest"] = 2,["heart"] = 3,["coins"] = 4,["pokale"] = 5,["zombieskin"] = 6},
	}
	
function inventar.render()
	dxDrawRectangle(475*(x/1440), 304*(y/900), 490*(x/1440), 291*(y/900), tocolor(0, 0, 0, 225), false)
	dxDrawText("Inventar", 475*(x/1440), 304*(y/900), 965*(x/1440), 330*(y/900), tocolor(255,255,255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
			
	for i = 1,40 do
		dxDrawRectangle(inventar["Fields"][i][1],inventar["Fields"][i][2],inventar["Fields"][i][3],inventar["Fields"][i][4],tocolor(inventar.colors[i][1],inventar.colors[i][2],inventar.colors[i][3],255),false);
				
		if(isCursorOnElement(inventar["Fields"][i][1],inventar["Fields"][i][2],inventar["Fields"][i][3],inventar["Fields"][i][4]))then
			inventar.colors[i] = {255,255,0};
				
			for _,v in ipairs(inventar.itemTable)do
				if(isCursorOnElement(v[4],v[5],v[6],v[7]))then
					dxDrawText(language[language.get()][17][inventar["Names"][v[1]]].." ("..v[2].."x)", 475*(x/1440), 593*(y/900), 964*(x/1440), 628*(y/900), tocolor(0,255,0, 255), 1.20, "default-bold", "center", "center", false, true, false, false, false)
				end
			end
		else
			inventar.colors[i] = {255,255,255};
		end
	end
			
	for _,v in ipairs(inventar.itemTable)do
		dxDrawImage(inventar["Fields"][v[3]][1],inventar["Fields"][v[3]][2],inventar["Fields"][v[3]][3],inventar["Fields"][v[3]][4],"Files/Images/Inventar/"..v[1]..".png",0,0,0,tocolor(255,255,255,255),false)
	end
end

addEventHandler("onClientDoubleClick",root,function()
	if(inventar.open == true)then
		for _,v in ipairs(inventar.itemTable)do
			if(isCursorOnElement(v[4],v[5],v[6],v[7]))then
				triggerServerEvent("inventar.use",localPlayer,v[1]);
			end
		end
	end
end)

bindKey("i","down",function()
	if(inventar.open ~= true)then
		if(GUIEditor.isWindow())then
			inventar.refresh()
			GUIEditor.set("set");
			addEventHandler("onClientRender",root,inventar.render);
			inventar.open = true
			
			for i = 1,40 do
				inventar.colors[i] = {255,255,255}
			end
		end
	else
		removeEventHandler("onClientRender",root,inventar.render);
		inventar.open = false
		GUIEditor.set("reset");
		inventar.id = 0
	end
end)

function inventar.refresh()
	inventar.id = 0
	inventar.itemTable = {}
	for i = 1,#inventar["Items"] do
		if(tonumber(getElementData(localPlayer,inventar["Items"][i])) >= 1)then
			inventar.id = inventar.id + 1
			table.insert(inventar.itemTable,{inventar["Items"][i],tonumber(getElementData(localPlayer,inventar["Items"][i])),inventar.id,inventar["Fields"][inventar.id][1],inventar["Fields"][inventar.id][2],inventar["Fields"][inventar.id][3],inventar["Fields"][inventar.id][4]});
		end
	end
end
addEvent("inventar.refresh",true)
addEventHandler("inventar.refresh",root,inventar.refresh)