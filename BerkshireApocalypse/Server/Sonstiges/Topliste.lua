Topliste = {}

addEvent("Topliste.get",true)
addEventHandler("Topliste.get",root,function(typ,limit)
	limit = tonumber(limit)
	local sql = dbQuery(handler,"SELECT username,?? FROM userdata ORDER BY ?? DESC LIMIT ?",typ,typ,limit)
	if(sql)then
		local rows = dbPoll(sql,-1);
		--//sort
		local playerData = {}
		local name = nil
		local dataValue = nil
		local x = 0
		
		for _,v in pairs(rows)do
			for index,value in pairs(v)do
				if(index == "username")then
					name = value
				elseif(index == typ)then
					dataValue = value
				end
				if(name and dataValue)then
					x = x + 1
					playerData[x] = {name,dataValue}
					name = nil
					dataValue = nil
				end
			end
		end
		triggerClientEvent(client,"Topliste.set",client,playerData);
	end
end)