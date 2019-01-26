--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

addEvent("wetter.set",true)
addEventHandler("wetter.set",root,function(id)
	setWeather(tonumber(id));
end)