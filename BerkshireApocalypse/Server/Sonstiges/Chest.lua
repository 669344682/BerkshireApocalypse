--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

chest = {}
local daytable = {"So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"};

dbExec(handler,"UPDATE userdata SET weeklychest = '0'");

function chest.weeklyFree(player)
	--[[ local realtime = getRealTime()
	local day = daytable[realtime.weekday+1]

	if(day == "Fr")then
		if(getElementData(player,"weeklychest") == 0)then
			setElementData(player,"chest",getElementData(player,"chest")+1);
			infobox.create(player,language[language.get(player)][8][1],"info");
			setElementData(player,"weeklychest",1);
		end
	end ]]--
end
