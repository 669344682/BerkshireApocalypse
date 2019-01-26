--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

waffenskills = {
	["skills"] = {
		[22] = {"pistol",69},
		[23] = {"silenced",70},
		[24] = {"deagle",71},
		[25] = {"shotgun",72},
		[26] = {"sawnoff",73},
		[27] = {"spas12",74},
		[28] = {"uzi",75},
		[29] = {"mp5",76},
		[30] = {"ak47",77},
		[31] = {"m4",78},
		[32] = {"uzi",75},
		[33] = {"rifle",79},},
	["datas"] = {
		{"pistol",69},
		{"silenced",70},
		{"deagle",71},
		{"shotgun",72},
		{"sawnoff",73},
		{"spas12",74},
		{"uzi",75},
		{"mp5",76},
		{"ak47",77},
		{"m4",78},
		{"rifle",79},},}

function waffenskills.checkdatabase(player)
	local database = dbQuery(handler,"SELECT * FROM waffenskills WHERE username = '"..getPlayerName(player).."'")
	local result,num_rows = dbPoll(database,-1)
	
	if(num_rows == 0)then dbExec(handler,"INSERT INTO waffenskills (username) VALUES ('"..getPlayerName(player).."')")end
	
	for i = 1,#waffenskills["datas"] do
		setElementData(player,waffenskills["datas"][i][1],getPlayerAllData("waffenskills","username",getPlayerName(player),waffenskills["datas"][i][1]));
		setPedStat(player,waffenskills["datas"][i][2],getElementData(player,waffenskills["datas"][i][1]));
	end
end

function waffenskills.save(player)
	for i = 1,#waffenskills["datas"] do
		dbExec(handler,"UPDATE waffenskills SET "..waffenskills["datas"][i][1].." = "..getElementData(player,waffenskills["datas"][i][1]).." WHERE username = '"..getPlayerName(player).."'");
	end
end

addEventHandler("onPlayerWeaponFire",root,function()
	local weapon = getPedWeapon(source)
	if(waffenskills["skills"][weapon])then
		if(getElementData(source,waffenskills["skills"][weapon][1]) <= 1000)then
			if(isVip(source))then add = 0.5 else add = 0.2 end
			setElementData(source,waffenskills["skills"][weapon][1],getElementData(source,waffenskills["skills"][weapon][1])+add);
			setPedStat(source,waffenskills["skills"][weapon][2],getElementData(source,waffenskills["skills"][weapon][1]));
			triggerClientEvent(source,"waffenskills.create",source,waffenskills["skills"][weapon][1]);
		end
	end
end)