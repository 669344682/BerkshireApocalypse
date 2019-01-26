--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

skinshop = {price = 500}

addEvent("skinshop.buy",true)
addEventHandler("skinshop.buy",root,function(skin)
	if(tonumber(getElementData(client,"bonuspoints")) >= skinshop.price)then
		setElementData(client,"bonuspoints",getElementData(client,"bonuspoints")-skinshop.price);
		infobox.create(client,language[language.get(client)][4][1],"info");
		setElementModel(client,tonumber(skin));
	else infobox.create(client,language[language.get(client)][4][2].." (500 BP)","error")end
end)

addEvent("skinshop.spawn",true)
addEventHandler("skinshop.spawn",root,function()
	setElementPosition(client,-1968.7969970703,162.5545501709,27.6875);
	setPedRotation(client,180);
end)