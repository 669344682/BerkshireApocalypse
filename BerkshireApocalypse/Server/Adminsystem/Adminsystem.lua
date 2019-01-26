--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

function adminsystem.message(text)
	for _,v in ipairs(getElementsByType("player"))do
		if(getElementData(v,"adminlevel") >= 1)then
			outputChatBox("[Admin]: "..text,v,255,255,255);
		end
	end
end

function adminsystem.text(textger,texteng)
	for _,v in ipairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(getElementData(v,"language") == 0)then
				outputChatBox(textger,v,255,0,0);
			elseif(getElementData(v,"language") == 1)then
				outputChatBox(texteng,v,255,0,0);
			end
		end
	end
end

function adminsystem.banCheck(player)
	local result = dbPoll(dbQuery(handler,"SELECT stime FROM ?? WHERE username = ?","bans",getPlayerName(player)),-1);
		
	if(result and result[1])then
		for i = 1,#result do
			if(result[i]["stime"] ~= 0 and result[i]["stime"] - getSecTime(0) <= 0)then
				dbExec(handler,"DELETE FROM bans WHERE username = '"..getPlayerName(player).."'");
				return true
			else
				local diff = math.floor(((result[i]["stime"] - getSecTime(0))/60)*100)/100;
				if(diff >= 0)then
					infobox.create(player,language[language.get(player)][11][21]..diff..language[language.get(player)][11][22]..getPlayerAllData("bans","username",getPlayerName(player),"grund"),"error");
				else
					infobox.create(player,language[language.get(player)][11][20]..getPlayerAllData("bans","username",getPlayerName(player),"grund"),"error");
				end
				return false
			end
		end
	else
		return true
	end
end

addEvent("adminsystem.coins",true)
addEventHandler("adminsystem.coins",root,function(player,anzahl,offlineplayer)
	local player = getPlayerFromName(player);
	
	if(isElement(player) and getElementData(player,"loggedin") == 1)then
		setElementData(player,"coins",getElementData(player,"coins")+tonumber(anzahl));
		infobox.create(client,language[language.get(client)][11][4]..getPlayerName(player)..anzahl..language[language.get(client)][11][5],"info");
		infobox.create(player,getPlayerName(client)..language[language.get(client)][11][2]..anzahl..language[language.get(client)][11][3],"info");
	elseif(#offlineplayer >= 1)then
		if(isPlayerExist(offlineplayer))then
			local coins = getPlayerAllData("userdata","username",offlineplayer,"coins");
			dbExec(handler,"UPDATE userdata SET coins = '"..coins+tonumber(anzahl).."' WHERE username = '"..offlineplayer.."'");
			offlinemessage(offlineplayer,getPlayerName(client)..language[language.get(client)][11][2]..anzahl..language[language.get(client)][11][3]);
			infobox.create(client,language[language.get(client)][11][4]..offlineplayer.." "..anzahl..language[language.get(client)][11][5],"info");
		else infobox.create(client,language[language.get(client)][11][1],"error")end
	end
end)

function adminsystem.spenden()
	local spenden = {}
	local database = dbPoll(dbQuery(handler,"SELECT * FROM premium"),-1);
		
	for _,v in ipairs(database)do
		table.insert(spenden,{v["username"]});
	end
	return spenden
end

addEvent("adminsystem.spenden",true)
addEventHandler("adminsystem.spenden",root,function()
	if(getElementData(client,"adminlevel") >= 2)then
		triggerClientEvent(client,"adminsystem.spenden",client,adminsystem.spenden());
	else infobox.create(client,language[language.get(client)][11][8],"error")end
end)

addEvent("adminsystem.spendenInfos",true)
addEventHandler("adminsystem.spendenInfos",root,function(player)
	local code1 = getPlayerAllData("premium","username",player,"code1");
	local code2 = getPlayerAllData("premium","username",player,"code2");
	local code3 = getPlayerAllData("premium","username",player,"code3");
	triggerClientEvent(client,"adminsystem.showSpendenCodes",client,code1,code2,code3);
end)

addEvent("adminsystem.deleteSpende",true)
addEventHandler("adminsystem.deleteSpende",root,function(player)
	dbExec(handler,"DELETE FROM premium WHERE username = '"..player.."'");
	triggerClientEvent(client,"adminsystem.refreshSpendenGridlist",client,adminsystem.spenden());
	triggerClientEvent(client,"adminsystem.showSpendenCodes",client,"/","/","/");
end)

addEvent("adminsystem.timeban",true)
addEventHandler("adminsystem.timeban",root,function(player,grund,offlineplayer,time)
	local player = getPlayerFromName(player);
	local sectime = getSecTime(tonumber(time))
	local datum = getTime();
	local datum = datum[3].."."..datum[4].."."..datum[5]..", "..datum[1]..":"..datum[2]
	
	if(isElement(player) and getElementData(player,"loggedin") == 1)then
		if(getElementData(player,"adminlevel") < getElementData(client,"adminlevel"))then
			dbExec(handler,"INSERT INTO bans (username,datum,grund,stime) VALUES ('"..getPlayerName(player).."','"..datum.."','"..grund.."','"..sectime.."')");
			infobox.create(client,language[language.get(client)][11][12]..getPlayerName(player)..language[language.get(client)][11][13]..grund,"info");
			adminsystem.text(getPlayerName(player)..language[0][11][16]..time..language[0][11][17]..grund,getPlayerName(player)..language[1][11][16]..time..language[1][11][17]..grund)
			kickPlayer(player,getPlayerName(client),language[language.get(client)][11][17]..time..language[0][11][18]..grund);
		else infobox.create(client,language[language.get(client)][11][9],"error")end
	elseif(#offlineplayer >= 1)then
		if(isPlayerExist(offlineplayer))then
			local database = dbQuery(handler,"SELECT * FROM bans WHERE username = '"..offlineplayer.."'");
			local result,num_rows = dbPoll(database,-1);
			
			if(num_rows == 0)then
				dbExec(handler,"INSERT INTO bans (username,datum,grund,stime) VALUES ('"..offlineplayer.."','"..datum.."','"..grund.."','"..sectime.."')");
				infobox.create(client,language[language.get(client)][11][12]..offlineplayer..language[language.get(client)][11][13]..grund,"info");
				adminsystem.text(offlineplayer..language[0][11][16]..time..language[0][11][17]..grund,offlineplayer..language[1][11][16]..time..language[1][11][17]..grund)
			else infobox.create(client,language[language.get(client)][11][6],"error")end
		else infobox.create(client,language[language.get(client)][11][1],"error")end
	end
end)

addEvent("adminsystem.permaban",true)
addEventHandler("adminsystem.permaban",root,function(player,grund,offlineplayer)
	local player = getPlayerFromName(player);
	local datum = getTime();
	local datum = datum[3].."."..datum[4].."."..datum[5]..", "..datum[1]..":"..datum[2]
	
	if(isElement(player) and getElementData(player,"loggedin") == 1)then
		if(getElementData(player,"adminlevel") < getElementData(client,"adminlevel"))then
			dbExec(handler,"INSERT INTO bans (username,datum,grund) VALUES ('"..getPlayerName(player).."','"..datum.."','"..grund.."')");
			kickPlayer(player,getPlayerName(client),language[language.get(client)][11][14]..grund);
			adminsystem.text(getPlayerName(player)..language[0][11][15]..grund,getPlayerName(player)..language[1][11][15]..grund)
		else infobox.create(client,language[language.get(client)][11][9],"error")end
	elseif(#offlineplayer >= 1)then
		if(isPlayerExist(offlineplayer))then
			local database = dbQuery(handler,"SELECT * FROM bans WHERE username = '"..offlineplayer.."'");
			local result,num_rows = dbPoll(database,-1);
			
			if(num_rows == 0)then
				dbExec(handler,"INSERT INTO bans (username,datum,grund) VALUES ('"..offlineplayer.."','"..datum.."','"..grund.."')");
				adminsystem.text(offlineplayer..language[0][11][15]..grund,offlineplayer..language[1][11][15]..grund)
			else infobox.create(client,language[language.get(client)][11][6],"error")end
		else infobox.create(client,language[language.get(client)][11][1],"error")end
	end
end)

addEvent("adminsystem.kicken",true)
addEventHandler("adminsystem.kicken",root,function(player,grund)
	local player = getPlayerFromName(player);

	if(isElement(player))then
		if(getElementData(player,"adminlevel") < getElementData(client,"adminlevel"))then
			adminsystem.text(getPlayerName(player)..language[0][11][10]..getPlayerName(client)..language[0][11][11]..grund,getPlayerName(player)..language[1][11][10]..getPlayerName(client)..language[1][11][11]..grund);
			kickPlayer(player,getPlayerName(client),grund);
		else infobox.create(client,language[language.get(client)][11][9],"error")end
	else infobox.create(client,language[language.get(client)][11][7],"error")end
end)