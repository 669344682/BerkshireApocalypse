--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	sWeather
	Last Edit: 10.02.2019

]]--

Weather = {id = nil};

function Weather.change()
	local weather = math.random(0,18);
	setWeather(weather);
	Weather.id = weather;
	setTimer(Weather.change,3600000,1);
end
Weather.change()

function Weather.set(player)
	triggerClientEvent(player,"Weather.set",player,Weather.id);
end