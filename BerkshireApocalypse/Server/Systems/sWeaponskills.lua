--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	sWeaponskills
	Last Edit: 13.02.2019

]]--

Weaponskills = {
	["Skills"] = {
		[22] = {"Pistol",69},
		[23] = {"Silenced",70},
		[24] = {"Deagle",71},
		[25] = {"Shotgun",72},
		[26] = {"Sawnoff",73},
		[27] = {"Spas12",74},
		[28] = {"Uzi",75},
		[29] = {"Mp5",76},
		[30] = {"AK-47",77},
		[31] = {"M4",78},
		[32] = {"Uzi",75,},
		[33] = {"Rifle",79},
	},
	["Datas"] = {
		{"Pistol",69},
		{"Silenced",70},
		{"Deagle",71},
		{"Shotgun",72},
		{"Sawnoff",73},
		{"Spas12",74},
		{"Uzi",75},
		{"Mp5",76},
		{"AK-47",77},
		{"M4",78},
		{"Rifle",79},
	},
};

function Weaponskills.save(player)
	for _,v in pairs(Weaponskills["Datas"])do
		dbExec(handler,"UPDATE weaponskills SET '"..v[1].."' = '"..getElementData(player,v[1]).."' WHERE Username = '"..getPlayerName(player).."'");
	end
end

function Weaponskills.setPedStat(player)
	for _,v in pairs(Weaponskills["Datas"])do
		setElementData(player,v[1],getPlayerData("weaponskills","Username",getPlayerName(player),v[1]));
		setPedStat(player,v[2],getElementData(player,v[1]));
	end
end

addEventHandler("onPlayerWeaponFire",root,function()
	local weapon = getPedWeapon(source);
	if(Weaponskills["Skills"][weapon])then
		if(tonumber(getElementData(source,Weaponskills["Skills"][weapon][1])) <= 1000)then
			if(isPremium(source))then add = 0.5 else add = 0.2 end
			setElementData(source,Weaponskills["Skills"][weapon][1],getElementData(source,Weaponskills["Skills"][weapon][1]) + add);
			triggerClientEvent(source,"Weaponskills.dxDraw",source,Weaponskills["Skills"][weapon][1]);
			setPedStat(source,Weaponskills["Skills"][weapon][2],getElementData(source,Weaponskills["Skills"][weapon][1]));
		end
	end
end)