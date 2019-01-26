--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

infobox = {}

function infobox.create(player,text,typ)
	triggerClientEvent(player,"infobox.create",player,text,typ);
end