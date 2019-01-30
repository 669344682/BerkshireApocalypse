--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

waffenladen = {
	["Artikel"] = { -- Preis, Waffen-ID, Munition
		["Desert Eagle"] = {250,24,42,0},
		["Mp5"] = {500,29,120,5},
		["M4"] = {1000,31,200,8},
		["AK-47"] = {1200,30,150,9},
		["County Rifle"] = {1500,33,75,10},
		["Sniper"] = {3000,34,35,14},},
	["Blips"] = {
		{-1968.5,116.80000305176,26.700000762939+0.1},},}
		
function waffenladen.load()
	for _,v in ipairs(waffenladen["Blips"])do
		waffenladen.blip = createBlip(v[1],v[2],v[3],6,0,0,0,0,0,0,100);
	end
end
waffenladen.load()	
	
addEvent("waffenladen.buy",true)
addEventHandler("waffenladen.buy",root,function(weapon)
	if(tonumber(getElementData(client,"level")) >= tonumber(waffenladen["Artikel"][weapon][4]))then
		if(tonumber(getPlayerMoney(client)) >= tonumber(waffenladen["Artikel"][weapon][1]))then
			takePlayerMoney(client,waffenladen["Artikel"][weapon][1]);
			giveWeapon(client,waffenladen["Artikel"][weapon][2],waffenladen["Artikel"][weapon][3],true);
			infobox.create(client,language[language.get(client)][6][1]..weapon..language[language.get(client)][6][2]..waffenladen["Artikel"][weapon][3]..language[language.get(client)][6][3],"info");
			Achievements.set(client,"ErsteWaffeGekauft",13);
		else infobox.create(client,language[language.get(client)][6][4].." ("..waffenladen["Artikel"][weapon][1].."$)","error")end
	else infobox.create(client,language[language.get(client)][3][1]..waffenladen["Artikel"][weapon][4]..language[language.get(client)][6][5],"error")end
end)
