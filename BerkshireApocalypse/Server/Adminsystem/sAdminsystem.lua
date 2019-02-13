--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	sAdminsystem
	Last Edit: 13.02.2019

]]--

function sendAdminMessage(text)
	for _,v in pairs(getElementsByType("player"))do
		if(getElementData(v,"loggedin") == 1)then
			if(getElementData(v,"Adminlevel") >= 1)then
				outputChatBox("[Admin-MSG]: "..text,v,255,255,0);
			end
		end
	end
end

--// Give adminlevel
addEvent("Adminsystem.givePlayerAdminlevel",true)
addEventHandler("Adminsystem.givePlayerAdminlevel",root,function(target,adminlevel)
	local adminlevel = tonumber(adminlevel);
	local target = getPlayerFromName(target);
	
	if(getElementData(client,"Adminlevel") >= 4)then
		if(existPlayer(client,target))then
			if(adminlevel >= 0 and adminlevel <= #Adminsystem["Names"])then
				setElementData(target,"Adminlevel",adminlevel);
				infobox(target,getPlayerName(client).." gave you adminlevel "..adminlevel..". ("..Adminsystem["Names"][adminlevel]..")",0,255,0);
				infobox(client,"You gave "..getPlayerName(target).." adminlevel "..adminlevel..". ("..Adminsystem["Names"][adminlevel]..")",0,255,0);
			else infobox(client,"The adminlevel you stated doesn't exist!",255,0,0)end
		end
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Give Berkshire-Coins
addEvent("Adminsystem.giveBerkshireCoins",true)
addEventHandler("Adminsystem.giveBerkshireCoins",root,function(target,amount)
	local target = getPlayerFromName(target);
	local amount = tonumber(amount);
	
	if(getElementData(client,"Adminlevel") >= 4)then
		if(existPlayer(client,target))then
			setElementData(target,"BerkshireCoins",getElementData(target,"BerkshireCoins")+amount);
			infobox(target,getPlayerName(client).." gave you "..amount.." Berkshire-Coins.",0,255,0);
			infobox(client,"You gave "..getPlayerName(target).." "..amount.." Berkshire-Coins.",0,255,0);
		end
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Kick player
addEvent("Adminsystem.kickPlayer",true)
addEventHandler("Adminsystem.kickPlayer",root,function(target,reason)
	local target = getPlayerFromName(target);
	
	if(getElementData(client,"Adminlevel") >= 1)then
		if(existPlayer(client,target))then
			outputChatBox(getPlayerName(target).." was kicked by "..getPlayerName(client).."! Reason: "..reason,root,125,0,0);
			infobox(client,"You kicked "..getPlayerName(target)..".",0,255,0);
			kickPlayer(target,client,reason);
		end
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Ban player
addEvent("Adminsystem.banPlayer",true)
addEventHandler("Adminsystem.banPlayer",root,function(target,reason,banTime)
	if(banTime and banTime ~= 0)then banTime = getSecTime(tonumber(banTime))end
	local target = getPlayerFromName(target);
	
	if(getElementData(client,"Adminlevel") >= 2)then
		if(banTime == 0)then
			dbExec(handler,"INSERT INTO bans (Username,Reason) VALUES ('"..getPlayerName(target).."','"..reason.."')");
			outputChatBox(getPlayerName(target).." was banned permanently by "..getPlayerName(client).."! Reason: "..reason,root,125,0,0);
		else
			dbExec(handler,"INSERT INTO bans (Username,Reason,STime) VALUES ('"..getPlayerName(target).."','"..reason.."','"..time.."')");
			outputChatBox(getPlayerName(target).." was banned for "..time.." hours by "..getPlayerName(client).."! Reason: "..reason,root,125,0,0);
		end
		kickPlayer(target,player,"You was banned from the server. Reason: "..reason);
		infobox(client,"You banished "..getPlayerName(target)..".",0,255,0);
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Give presents
addEvent("Adminsystem.givePresents",true)
addEventHandler("Adminsystem.givePresents",root,function(target,amount)
	local target = getPlayerFromName(target);
	local amount = tonumber(amount);
	
	if(getElementData(client,"Adminlevel") >= 4)then
		if(existPlayer(client,target))then
			setElementData(target,"Presents",getElementData(target,"Presents")+amount);
			infobox(target,getPlayerName(client).." gave you "..amount.." presents.",0,255,0);
			infobox(client,"You gave "..getPlayerName(target).." "..amount.." presents.",0,255,0);
		end
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Show player infos
addEvent("Adminsystem.showPlayerInfos",true)
addEventHandler("Adminsystem.showPlayerInfos",root,function(target)
	local target = getPlayerFromName(target);
	
	if(getElementData(client,"Adminlevel") >= 4)then
		if(existPlayer(client,target))then
			--//
		end
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Teleport to zone
addEvent("Adminsystem.teleportToZone",true)
addEventHandler("Adminsystem.teleportToZone",root,function(zone)
	if(getElementData(client,"Adminlevel") >= 1 or isPremium(client))then
		if(Adminsystem["Savezones"][zone])then
			local x,y,z = Adminsystem["Savezones"][zone][1],Adminsystem["Savezones"][zone][2],Adminsystem["Savezones"][zone][3];
			setElementPosition(client,x,y,z);
			sendAdminMessage(getPlayerName(client).." has teleported to the save zone '"..zone.."'.");
		end
	else infobox(client,"You are not authorized to use this function!",255,0,0)end
end)

--// Check ban
function Adminsystem.checkBan(player)
	local result = dbPoll(dbQuery(handler,"SELECT STime FROM ?? WHERE Username = ?","bans",getPlayerName(player)),-1);
	if(result and result[1])then
		for i = 1,#result do
			if(result[i]["STime"] ~= 0 and result[i]["Stime"] - getSecTime(0) <= 0)then
				dbExec(handler,"DELETE * FROM bans WHERE Username = '"..getPlayerName(player).."'");
				return true
			else
				local var = math.floor(((result[i]["STime"] - getSecTime(0))/60)*100)/100;
				if(var >= 0)then
					infobox(player,"You are still banned for "..var.." hours!",255,0,0);
				else
					infobox(player,"You are banned permanently! Reason: "..getPlayerData("bans","Username",getPlayerName(player),"Reason"),255,0,0);
				end
				return false
			end
		end
	else
		return true
	end
end