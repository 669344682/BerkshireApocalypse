--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

peds = {colsphere = {},
	-- ID, x, y, z, rotation, text
	{100,-1968.5,114.30000305176,27.700000762939,0,"waffenladen.open"}, -- Waffenladen am Bahnhof
	{248,-1974.9,162.60000610352,27.700000762939,180,"team.create"}, -- Team gründen
	{114,-1973.5,162.60000610352,27.700000762939,180,"updates.create"}, -- Updates
	{299,-1972.1,162.60000610352,27.700000762939,180,"skinshop.open"}, -- Skinshop
	{181,-1970.7,162.60000610352,27.700000762939,180,"spenden.window"}, -- Spenden
	{130,-1981.4000244141,109.59999847412,27.700000762939,90,"ostern.open"}, -- Event
	{141,-1962.1999511719,156.69999694824,27.700000762939,90,"coinshop.open"}, -- Coinshop
	{26,-1962.1999511719,155.29999694824,27.700000762939,90,"Topliste.window"},} -- Topliste
	
function peds.load()
	for _,v in ipairs(peds)do
		peds.ped = createPed(v[1],v[2],v[3],v[4],v[5]);
		setElementFrozen(peds.ped,true);
		setElementData(peds.ped,"event",v[6]);
		peds.colsphere = createColSphere(v[2],v[3],v[4],3.5);
		
		addEventHandler("onClientPedDamage",peds.ped,function()
			cancelEvent();
		end)
	end
	
	addEventHandler("onClientRender",root,function()
		if(getElementData(localPlayer,"loggedin") == 1)then
			for k,v in ipairs(peds)do
				px,py,pz = v[2],v[3],v[4]
				if(getDistanceBetweenPoints3D(px,py,pz,getElementPosition(localPlayer)) <= 10)then
					sx,sy = getScreenFromWorldPosition(px,py,pz+1.1,1000,true)
					if(sx and sy)then
						if(GUIEditor.isWindow())then
							dxDrawText(language[language.get()][3][k],sx,sy,sx,sy+25,tocolor(255,255,255),1,"default-bold","center","bottom",false,false,false,true);
						end
					end
				end
			end
		end
	end)
end
peds.load()

addEventHandler("onClientClick",root,function(button,state,absx,absy,wx,wy,wz,element)
	if(element and getElementType(element) == "ped" and state == "down")then
		local x,y,z = getElementPosition(localPlayer);
		if(getDistanceBetweenPoints3D(x,y,z,wx,wy,wz) <= 3)then
			if(getElementData(element,"event"))then
				triggerEvent(getElementData(element,"event"),localPlayer);
			end
		end
	end
end)