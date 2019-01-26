--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

function offlinemessage(name,text)
	if(name and text)then
		dbExec(handler,"INSERT INTO offlinemessages (username,text) VALUES ('"..name.."','"..text.."')");
	end
end

function checkofflinemessages(player)
	local messages = dbPoll(dbQuery(handler,"SELECT * FROM offlinemessages"),-1);
	for _,v in pairs(messages)do
		if(v["username"] == getPlayerName(player))then
			outputChatBox("[Offline-MSG] "..v["text"],player,150,150,150);
			dbExec(handler,"DELETE FROM offlinemessages WHERE id = '"..v["id"].."'");
		end
	end
end