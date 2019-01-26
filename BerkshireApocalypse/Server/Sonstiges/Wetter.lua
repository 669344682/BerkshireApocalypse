--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

wetter = {id = nil}

function wetter.change()
	local weather = math.random(0,18);
	setWeather(weather);
	wetter.id = weather;
	setTimer(wetter.change,3600000,1);
end
wetter.change()

function wetter.set(player)
	triggerClientEvent(player,"wetter.set",player,wetter.id);
end