--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

levelsystem = {pointsprolevel = 250}

function levelsystem.giveExp(player,points)
	if(getElementData(player,"erfahrungspunkte"))then
		setElementData(player,"erfahrungspunkte",getElementData(player,"erfahrungspunkte")+points);
		local level = getElementData(player,"level")+1
		if(tonumber(getElementData(player,"erfahrungspunkte")) >= tonumber(level*levelsystem.pointsprolevel))then
			levelsystem.levelUp(player);
		end
	end
end

function levelsystem.teamCheck(player)
	for _,v in ipairs(getElementsByType("player"))do
		if(getPlayerName(v) ~= getPlayerName(player))then
			if(tonumber(getElementData(v,"team")) >= 1)then
				if(tonumber(getElementData(v,"team")) == tonumber(getElementData(player,"team")))then
					local x,y,z = getElementPosition(v)
					if(getDistanceBetweenPoints3D(x,y,z,getElementPosition(player)) <= 15)then
						levelsystem.giveExp(v,2);
					end
				end
			end
		end
	end
end

function levelsystem.levelUp(player)
	setElementData(player,"erfahrungspunkte",0);
	setElementData(player,"level",getElementData(player,"level")+1);
	local level = getElementData(player,"level")+1
	infobox.create(player,language[language.get(player)][2][1]..getElementData(player,"level").."!"..language[language.get(player)][2][2]..level*levelsystem.pointsprolevel..language[language.get(player)][2][3],"erfolg");
	
	Achievements.set(player,"ErsterLevelUp",7);
	
	if(getElementData(player,"level") >= 10)then Achievements.set(player,"LevelErreicht10",8)end
	if(getElementData(player,"level") >= 25)then Achievements.set(player,"LevelErreicht10",9)end
	if(getElementData(player,"level") >= 50)then Achievements.set(player,"LevelErreicht10",10)end
	if(getElementData(player,"level") >= 100)then Achievements.set(player,"LevelErreicht10",11)end
	if(getElementData(player,"level") >= 250)then Achievements.set(player,"LevelErreicht10",12)end
end