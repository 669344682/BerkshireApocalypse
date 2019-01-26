--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

vip = {info = {}}

function isVip(player)
	if(getElementData(player,"vip") == 1 or getElementData(player,"lifetimevip") == 1)then
		return true
	else
		return false
	end
end

function vip.buy(player)
	if(not(isVip(player)))then
		local sec = getSecTime(336);
		local datum = getTime();
		local datum = datum[3].."."..datum[4].."."..datum[5]..", "..datum[1]..":"..datum[2]
		
		dbExec(handler,"INSERT INTO vip (username,datum,stime) VALUES ('"..getPlayerName(player).."','"..datum.."','"..sec.."')");
		setElementData(player,"vip",1);
		infobox.create(player,language[language.get(player)][9][1],"info");
		setElementData(player,"coins",getElementData(player,"coins")-5);
		vip.info[player] = true;
	else infobox.create(player,language[language.get(player)][9][2],"error")end
end

function vip.buylifetime(player)
	if(not(isVip(player)))then
		setElementData(player,"lifetimevip",1);
		infobox.create(player,language[language.get(player)][9][8],"info");
		setElementData(player,"coins",getElementData(player,"coins")-50);
	else infobox.create(player,language[language.get(player)][9][2],"error")end
end

function vip.check(player)
	local result = dbPoll(dbQuery(handler,"SELECT stime FROM ?? WHERE username = ?","vip",getPlayerName(player)),-1);
	
	if(result and result[1])then
		for i = 1,#result do
			if(result[i]["stime"] ~= 0 and result[i]["stime"] - getSecTime(0) <= 0)then
				infobox.create(player,language[language.get(player)][9][5],"error");
				dbExec(handler,"DELETE FROM vip WHERE username = '"..getPlayerName(player).."'");
			else
				if(vip.info[player] ~= true)then
					vip.info[player] = true;
					setElementData(player,"vip",1);
					local diff = math.floor(((result[i]["stime"] - getSecTime(0))/60)*100)/100;
					if(diff >= 0)then
						outputChatBox(language[language.get(player)][9][3]..diff..language[language.get(player)][9][4],player,0,125,0);
					end
				end
			end
		end
	end
end