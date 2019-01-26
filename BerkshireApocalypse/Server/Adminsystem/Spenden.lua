--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

addEvent("spenden.buy",true)
addEventHandler("spenden.buy",root,function(code1,code2,code3)
	local database = dbQuery(handler,"SELECT * FROM premium WHERE username = '"..getPlayerName(client).."'");
	local result,num_rows = dbPoll(database,-1);
	
	if(num_rows == 0)then
		dbExec(handler,"INSERT INTO premium (username,code1,code2,code3) VALUES ('"..getPlayerName(client).."','"..code1.."','"..code2.."','"..code3.."')");
		infobox.create(client,language[language.get(client)][9][7],"info");
		triggerClientEvent(client,"GUIEditor.set",client,"reset");
	else infobox.create(client,language[language.get(client)][9][6],"error")end
end)