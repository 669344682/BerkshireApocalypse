--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

anmeldebereich = {timer = {},
	["datas"] = {"level","erfahrungspunkte","zombiekills","team","teamrang","deaths","playingtime","bonuspoints","adminlevel","chest","heart","weeklychest","waffenlager","coins","ostereier","pokale","lifetimevip","zombieskin"},}

addEvent("anmeldebereich.server",true)
addEventHandler("anmeldebereich.server",root,function(typ,passwort)
	if(typ == "Einloggen" or typ == "Login")then
		local database = dbQuery(handler,"SELECT * FROM userdata WHERE username = '"..getPlayerName(client).."' AND passwort = '"..md5(passwort).."'");
		local result,num_rows = dbPoll(database,-1);
		
		if(num_rows == 1)then
			if(adminsystem.banCheck(client))then
				anmeldebereich.setDatas(client);
				triggerClientEvent(client,"anmeldebereich.destroy",client);
				infobox.create(client,language[language.get(client)][1][5],"info");
			end
		else infobox.create(client,language[language.get(client)][1][3],"error")end
	elseif(typ == "Registrieren" or typ == "Register")then
		local database = dbQuery(handler,"SELECT * FROM userdata WHERE username = '"..getPlayerName(client).."'");
		local result,num_rows = dbPoll(database,-1);
		
		if(num_rows == 0)then
			local database = dbQuery(handler,"SELECT * FROM userdata WHERE serial = '"..getPlayerSerial(client).."'");
			local result,num_rows = dbPoll(database,-1);
			
			if(num_rows == 0)then
				dbExec(handler,"INSERT INTO userdata (username,passwort,serial) VALUES ('"..getPlayerName(client).."','"..md5(passwort).."','"..getPlayerSerial(client).."')");
				dbExec(handler,"INSERT INTO achievements (username) VALUES ('"..getPlayerName(client).."')");
				anmeldebereich.setDatas(client);
				triggerClientEvent(client,"anmeldebereich.destroy",client);
				infobox.create(client,language[language.get(client)][1][4],"info");
			else infobox.create(client,language[language.get(client)][1][2],"error")end
		else infobox.create(client,language[language.get(client)][1][1],"error")end
	end
end)
	
function anmeldebereich.setDatas(player)
	for i = 1,#anmeldebereich["datas"] do
		setElementData(player,anmeldebereich["datas"][i],getPlayerAllData("userdata","username",getPlayerName(player),anmeldebereich["datas"][i]));
	end
	setPlayerMoney(player,tonumber(getPlayerAllData("userdata","username",getPlayerName(player),"money")));
	setElementModel(player,getPlayerAllData("userdata","username",getPlayerName(player),"skinid"));
	
	setElementData(player,"loggedin",1);
	setElementData(player,"dangercount",0);
	setElementData(player,"alreadyspawned",true);

	setCameraTarget(player,player);
	
	anmeldebereich.timer[player] = setTimer(function(player)
		if(isElement(player))then
			vip.check(player);
			setElementData(player,"playingtime",getElementData(player,"playingtime")+1);
			
			if(isVip(player))then
				if(math.floor(getElementData(player,"playingtime")/60) == (getElementData(player,"playingtime")/60))then
					local money = getElementData(player,"level")*75
					local erfahrungspunkte = getElementData(player,"level")*25 + getElementData(player,"pokale")*25
					if(math.random(1,200) == 56)then coin = 1 else coin = 0 end
					
					givePlayerMoney(player,money);
					setElementData(player,"erfahrungspunkte",getElementData(player,"erfahrungspunkte")+erfahrungspunkte);
					setElementData(player,"coins",getElementData(player,"coins")+coin);
					
					triggerClientEvent(player,"payday.render",player,money,erfahrungspunkte,coin);
					Achievements.set(player,"ErsterPayday",14);
				end
			end
		end
	end,60000,0,player)
	
	waffenskills.checkdatabase(player);
	wetter.set(player);
	chest.weeklyFree(player);
	team.blips(player);
	anmeldebereich.spawn(player);
	vip.check(player);
	checkofflinemessages(player);
	Achievements.check(player);
	
	bindKey(player,"f2","down",team.open);
	
	triggerClientEvent(player,"removeCamHandler",player);
	giveWeapon(player,22,1500,true);
	
	local result = dbPoll(dbQuery(handler,"SELECT waffen FROM logout WHERE username = '"..getPlayerName(player).."'"),-1);
	if(result and result[1])then
		local weapons = result[1]["waffen"];
		dbExec(handler,"DELETE FROM logout WHERE username = '"..getPlayerName(player).."'");
		for i = 1,12 do
			local wstring = gettok(weapons,i,string.byte('|'));
			if(wstring and #wstring >= 3)then
				local weapon = tonumber(gettok(wstring,1,string.byte(',')));
				local ammo = tonumber(gettok(wstring,2,string.byte(',')));
				giveWeapon(player,weapon,ammo,true);
			end
		end
	end
end

function anmeldebereich.save(player)
	local x,y,z = getElementPosition(player);
	if(getElementData(player,"zombieskinuse") == true)then model = inventar.saveskin[player] else model = getElementModel(player)end
	dbExec(handler,"UPDATE userdata SET posx = '"..x.."', posy = '"..y.."', posz = '"..z.."', money = '"..getPlayerMoney(player).."', skinid = '"..model.."' WHERE username = '"..getPlayerName(player).."'");
	
	for i = 1,#anmeldebereich["datas"] do
		dbExec(handler,"UPDATE userdata SET "..anmeldebereich["datas"][i].." = "..getElementData(player,anmeldebereich["datas"][i]).." WHERE username = '"..getPlayerName(player).."'");
	end
	waffenskills.save(player);
	
	if(isVip(player))then
		local curWeaponsForSave = "|"
		for i = 1,11 do
			if i ~= 10 then
				local weapon = getPedWeapon(player,i);
				local ammo = getPedTotalAmmo(player,i);
				if(weapon and ammo)then
					if(weapon >= 1 and ammo >= 1)then
						if(#curWeaponsForSave <= 40)then
							curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|";
						end
					end
				end
			end
		end
		if(#curWeaponsForSave >= 5)then
			dbExec(handler,"INSERT INTO logout (username,waffen) VALUES ('"..getPlayerName(player).."','"..curWeaponsForSave.."')");
		end
	end
end

function anmeldebereich.spawn(player)
	local x = getPlayerAllData("userdata","username",getPlayerName(player),"posx");
	local y = getPlayerAllData("userdata","username",getPlayerName(player),"posy");
	local z = getPlayerAllData("userdata","username",getPlayerName(player),"posz");
	spawnPlayer(player,x,y,z);
end

addEventHandler("onPlayerQuit",root,function()
	if(getElementData(source,"loggedin") == 1)then
		anmeldebereich.save(source);
		if(isTimer(anmeldebereich.timer[source]))then killTimer(anmeldebereich.timer[source])end
		
		for _,v in ipairs(getElementsByType("player"))do
			team.blips(v);
		end
	end
end)
