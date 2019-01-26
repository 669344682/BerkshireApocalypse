--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

Waffenlager = {
	[24] = {"Desert Eagle",2},
	[29] = {"Mp5",4},
	[31] = {"M4",5},
	[30] = {"AK-47",5},
	[33] = {"County Rifle",6},
	[34] = {"Sniper",6},}

addEvent("Waffenlager.getWeapons",true)
addEventHandler("Waffenlager.getWeapons",root,function()
	Waffenlager.handWeapons = {}
	Waffenlager.depotWeapons = {}
	local result = dbPoll(dbQuery(handler,"SELECT * FROM waffenlager WHERE username = '"..getPlayerName(client).."'"),-1);
	
	for _,v in ipairs(result)do
		table.insert(Waffenlager.depotWeapons,{v["id"],Waffenlager[v["weaponid"]][1],v["weaponammo"]});
	end
	
	for i = 1,11 do
		if(i ~= 10)then
			local weapon = getPedWeapon(client,i);
			local ammo = getPedTotalAmmo(client,i);
			if(weapon and ammo)then
				if(weapon >= 1 and ammo >= 1)then
					table.insert(Waffenlager.handWeapons,{Waffenlager[weapon][1],ammo});
				end
			end
		end
	end
	
	triggerClientEvent(client,"Waffenlager.refresh",client,Waffenlager.handWeapons,Waffenlager.depotWeapons);
end)

addEvent("Waffenlager.einlagern",true)
addEventHandler("Waffenlager.einlagern",root,function(id)
	local result = dbPoll(dbQuery(handler,"SELECT * FROM waffenlager WHERE username = '"..getPlayerName(client).."'"),-1);
	if(#result < 15)then
		local weapon = getPedWeapon(client,Waffenlager[id][2]);
		local ammo = getPedTotalAmmo(client,Waffenlager[id][2]);
		dbExec(handler,"INSERT INTO waffenlager (username,weaponid,weaponammo) VALUES ('"..getPlayerName(client).."','"..id.."','"..ammo.."')");
		takeWeapon(client,weapon);
	end
end)

addEvent("Waffenlager.auslagern",true)
addEventHandler("Waffenlager.auslagern",root,function(id)
	local weapon = getPlayerAllData("waffenlager","id",id,"weaponid");
	local ammo = getPlayerAllData("waffenlager","id",id,"weaponammo");
	giveWeapon(client,weapon,ammo,true);
	dbExec(handler,"DELETE FROM waffenlager WHERE id = '"..id.."'");
end)