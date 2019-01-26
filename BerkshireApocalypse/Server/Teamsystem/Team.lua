--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

team = {kosten = 50000, id = 0}

function team.load()
	local database = dbPoll(dbQuery(handler,"SELECT * FROM teams"),-1);
	
	for _,v in ipairs(database)do
		team.id = team.id + 1
	end
end
team.load()

function team.getMember(team)
	teamTable = {}
	teamDatabase = dbPoll(dbQuery(handler,"SELECT * FROM userdata"),-1);
	
	for _,v in ipairs(teamDatabase)do
		if(v["team"] == team)then
			local target = getPlayerFromName(v["username"])
			if(isElement(target))then status = "Online" else status = "Offline" end
			table.insert(teamTable,{v["username"],v["teamrang"],status});
		end
	end
	return teamTable
end

addEvent("team.create",true)
addEventHandler("team.create",root,function(name)
	if(getPlayerMoney(client) >= team.kosten)then
		if(tonumber(getElementData(client,"team")) == 0)then
			local database = dbQuery(handler,"SELECT * FROM teams WHERE name = '"..name.."'")
			local result,num_rows = dbPoll(database, -1)
		
			if(num_rows == 0)then
				team.id = team.id + 1
				infobox.create(client,language[language.get(client)][7][4],"info");
				takePlayerMoney(client,team.kosten);
				dbExec(handler,"INSERT INTO teams (name,besitzer) VALUES ('"..name.."','"..getPlayerName(client).."')");
				setElementData(client,"team",team.id);
				setElementData(client,"teamrang",5);
				dbExec(handler,"UPDATE userdata SET team = '"..team.id.."', teamrang = '5' WHERE username = '"..getPlayerName(client).."'");
			else infobox.create(client,language[language.get(client)][7][1],"error")end
		else infobox.create(client,language[language.get(client)][7][2],"error")end
	else infobox.create(client,language[language.get(client)][7][3].."("..team.kosten.."$)","error")end
end)

addEvent("team.invite",true)
addEventHandler("team.invite",root,function(player)
	local player = getPlayerFromName(player)
	if(isElement(player) and getElementData(player,"loggedin") == 1)then
		if(tonumber(getElementData(player,"team")) == 0)then
			setElementData(player,"team",getElementData(client,"team"));
			infobox.create(player,getPlayerName(client)..language[language.get(client)][7][7],"info");
			infobox.create(client,language[language.get(client)][7][8]..getPlayerName(player)..language[language.get(client)][7][9],"info");
			dbExec(handler,"UPDATE userdata SET team = '"..getElementData(player,"team").."' WHERE username = '"..getPlayerName(player).."'");
			team.refresh(client);
		else infobox.create(client,language[language.get(client)][7][5],"error")end
	else infobox.create(client,language[language.get(client)][7][6],"error")end
end)

addEvent("team.uninvite",true)
addEventHandler("team.uninvite",root,function(player)
	local player = getPlayerFromName(player)
	if(isElement(player) and getElementData(player,"loggedin") == 1)then
		setElementData(player,"team",0);
		setElementData(player,"teamrang",0);
		infobox.create(player,getPlayerName(client)..language[language.get(client)][7][10],"info");
		infobox.create(client,language[language.get(client)][7][11]..getPlayerName(player)..language[language.get(client)][7][12],"info");
		dbExec(handler,"UPDATE userdata SET team = '"..getElementData(player,"team").."' WHERE username = '"..getPlayerName(player).."'");
		team.refresh(client);
	else infobox.create(client,language[language.get(client)][7][6],"error")end
end)

addEvent("team.rang",true)
addEventHandler("team.rang",root,function(player,typ)
	local player = getPlayerFromName(player)
	if(isElement(player) and getElementData(player,"loggedin") == 1)then
		if(tonumber(getElementData(client,"teamrang") ) >= 5)then
			if(typ == "down")then
				if(tonumber(getElementData(player,"teamrang")) > 0)then
					setElementData(player,"teamrang",getElementData(player,"teamrang")-1);
					infobox.create(client,language[language.get(client)][7][14]..getPlayerName(player)..language[language.get(client)][7][16],"info");
					infobox.create(player,language[language.get(client)][7][17]..getPlayerName(client)..language[language.get(client)][7][16],"info");
				else infobox.create(client,language[language.get(client)][7][19],"error")end
			elseif(typ == "up")then
				if(tonumber(getElementData(player,"teamrang")) < 5)then
					setElementData(player,"teamrang",getElementData(player,"teamrang")+1);
					infobox.create(client,language[language.get(client)][7][14]..getPlayerName(player)..language[language.get(client)][7][15],"info");
					infobox.create(player,language[language.get(client)][7][17]..getPlayerName(client)..language[language.get(client)][7][15],"info");
				else infobox.create(client,language[language.get(client)][7][18],"error")end
			end
			dbExec(handler,"UPDATE userdata SET teamrang = '"..getElementData(player,"teamrang").."' WHERE username = '"..getPlayerName(player).."'");
			team.refresh(client);
		else infobox.create(client,language[language.get(client)][7][13],"error")end
	else infobox.create(client,language[language.get(client)][7][6],"error")end
end)

addEvent("team.kasse",true)
addEventHandler("team.kasse",root,function(summe,typ)
	local kasse = tonumber(getPlayerAllData("teams","id",getElementData(client,"team"),"kasse"))
	local summe = tonumber(summe)
	
	if(tonumber(getElementData(client,"teamrang") ) >= 5)then
		if(typ == "einzahlen")then
			if(getPlayerMoney(client) >= summe)then
				newsumme = kasse + summe
				dbExec(handler,"UPDATE teams SET kasse = '"..newsumme.."' WHERE id = '"..getElementData(client,"team").."'");
			else infobox.create(client,language[language.get(client)][7][20].." ("..summe.."$)","error")end
		elseif(typ == "auszahlen")then
			if(kasse >= summe)then
				newsumme = kasse - summe
				dbExec(handler,"UPDATE teams SET kasse = '"..newsumme.."' WHERE id = '"..getElementData(client,"team").."'");
			else infobox.create(client,language[language.get(client)][7][21].." ("..summe.."$)","error")end
		end
		team.refresh(client);
	else infobox.create(client,language[language.get(client)][7][13],"error")end
end)

addEvent("team.delete",true)
addEventHandler("team.delete",root,function()
	if(getElementData(client,"teamrang") >= 5)then
		teamDatabase = dbPoll(dbQuery(handler,"SELECT * FROM userdata"),-1);
	
		dbExec(handler,"DELETE * FROM teams WHERE id = '"..getElementData(client,"team").."'");
		infobox.create(client,language[language.get(client)][7][22],"info");
	
		for _,v in ipairs(teamDatabase)do
			if(v["team"] == getElementData(client,"team"))then
				local target = getPlayerFromName(v["username"])
				if(isElement(target))then
					setElementData(target,"team",0);
					setElementData(target,"teamrang",0);
				else
					dbExec(handler,"UPDATE userdata SET team = '0', teamrang = '0' WHERE username = '"..v["username"].."'");
				end
			end
		end
	else infobox.create(client,language[language.get(client)][7][13],"error")end
end)

function team.open(player)
	if(tonumber(getElementData(player,"team")) >= 1)then
		local name = getPlayerAllData("teams","id",getElementData(player,"team"),"name")
		triggerClientEvent(player,"team.open",player,name);
		team.refresh(player);
	end
end

function team.refresh(player)
	team.blips(player);
	local kasse = getPlayerAllData("teams","id",getElementData(player,"team"),"kasse")
	triggerClientEvent(player,"team.update",player,team.getMember(getPlayerAllData("userdata","username",getPlayerName(player),"team")),kasse);
end

function team.blips(player)
	for _,v in ipairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(tonumber(getElementData(v,"team")) >= 1)then
				if(tonumber(getElementData(v,"team")) == tonumber(getElementData(player,"team")))then
					if(getPlayerName(v) ~= getPlayerName(player))then
						triggerClientEvent(v,"team.blips",v);
					end
				end
			end
		end
	end
end