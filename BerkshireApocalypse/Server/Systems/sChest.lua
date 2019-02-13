--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	sChests
	Last Edit: 10.02.2019

]]--

Chest = {};
local daytable = {"So","Mo","Di","Mi","Do","Fr","Sa"};

dbExec(handler,"UPDATE userdata SET Weeklychest = '0'");

function Chest.givePlayerFreeChest(player)
	local realtime = getRealTime();
	local day = daytable[realtime.weekday + 1];
	
	if(day == "Fr")then
		if(getElementData(player,"Weeklychest") == 0)then
			setElementData(player,"Chests",getElementData(player,"Chests")+1);
			setElementData(player,"Weeklychest",1);
			infobox(player,"You have received your weekly free chest.",0,255,0);
		end
	end
end