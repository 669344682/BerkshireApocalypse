--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

coinshop = {
	["Preise"] = {
		["Waffenlager"] = 10,
		["Weapon Depot"] = 10,
		["Premium (14 Tage)"] = 5,
		["Premium (14 days)"] = 5,
		["Lifetime Premium"] = 50,
		["Zombieskin"] = 25},}

addEvent("coinshop.tauschen",true)
addEventHandler("coinshop.tauschen",root,function(menge)
	local menge = tonumber(menge);
	
	if(getElementData(client,"bonuspoints") >= menge*1000)then
		setElementData(client,"bonuspoints",getElementData(client,"bonuspoints")-menge*1000);
		setElementData(client,"coins",getElementData(client,"coins")+menge);
		infobox.create(client,language[language.get(client)][10][5]..menge*1000 ..language[language.get(client)][10][6]..menge..language[language.get(client)][10][7],"info");
	else infobox.create(client,language[language.get(client)][10][4].." ("..menge*1000 ..")","error")end
end)

addEvent("coinshop.buy",true)
addEventHandler("coinshop.buy",root,function(artikel)
	local preis = coinshop["Preise"][artikel]
	
	if(getElementData(client,"coins") >= tonumber(preis))then
		if(artikel == "Waffenlager" or artikel == "Weapon Depot")then
			if(getElementData(client,"waffenlager") == 0)then
				setElementData(client,"waffenlager",1);
				setElementData(client,"coins",getElementData(client,"coins")-tonumber(preis));
				infobox.create(client,language[language.get(client)][10][3],"info");
			else infobox.create(client,language[language.get(client)][10][1],"error")end
		elseif(artikel == "Premium (14 Tage)" or artikel == "Premium (14 days)")then
			vip.buy(client);
		elseif(artikel == "Lifetime Premium")then
			vip.buylifetime(client);
		elseif(artikel == "Zombieskin")then
			if(getElementData(client,"zombieskin") == 0)then
				setElementData(client,"zombieskin",1);
				setElementData(client,"coins",getElementData(client,"coins")-tonumber(preis));
				infobox.create(client,language[language.get(client)][10][9],"info");
			else infobox.create(client,language[language.get(client)][10][8],"error")end
		end
	else infobox.create(client,language[language.get(client)][10][2].." ("..preis..")","error")end
end)