--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

	cWeather
	Last Edit: 10.02.2019
	
]]--

addEvent("Weather.set",true)
addEventHandler("Weather.set",root,function(id)
	setWeather(tonumber(id));
end)