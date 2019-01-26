--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

inventar = {saveskin = {}}

addEvent("inventar.use",true)
addEventHandler("inventar.use",root,function(item)
	if(item == "heart")then
		if(getElementHealth(client) < 100)then
			setElementData(client,item,getElementData(client,item)-1);
			setElementHealth(client,100);
			infobox.create(client,language[language.get(client)][5][1],"info");
		end
	elseif(item == "zombieskin")then
		if(getElementData(client,"zombieskinuse") ~= true)then
			inventar.saveskin[client] = getElementModel(client);
			setElementData(client,"zombieskinuse",true);
			setElementModel(client,229);
		else
			setElementData(client,"zombieskinuse",false);
			setElementModel(client,inventar.saveskin[client]);
		end
	end
	triggerClientEvent(client,"inventar.refresh",client);
end)