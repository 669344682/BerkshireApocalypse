--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden

	sMain
	Last Edit: 11.02.2019
	
]]--
	
Main = {ZombieMoney = 25, ZombieExperience = 5};

handler = dbConnect("mysql","dbname=berkshireapocalypse;host=127.0.0.1","root","");
Serverinfos = {name = "Berkshire Apocalypse", version = "v.1.0.2"};

setFPSLimit(60)
setGameType(Serverinfos.name.." "..Serverinfos.version);

local realtime = getRealTime();
setTime(realtime.hour,realtime.minute);
setMinuteDuration(60000);

function getPlayerData(from,where,name,data)
	local sql = dbQuery(handler,"SELECT * FROM "..from.." WHERE "..where.." = '"..name.."'");
	if(sql)then
		local rows = dbPoll(sql,-1);
		for _,v in pairs(rows)do
			return v[data];
		end
	end
end

function isLoggedIn(player)
	if(getElementData(player,"loggedin") == 1)then
		return true
	else
		return false
	end
end

function getSecTime(duration)
	local time = getRealTime();
	local year = time.year;
	local day = time.yearday;
	local hour = time.hour;
	local minute = time.minute;
	
	return year * 365 * 24 * 60 + day * 24 * 60 + (hour + duration) * 60 + minute;
end

--// Infobox
function infobox(player,text,r,g,b)
	triggerClientEvent(player,"infobox",player,text,r,g,b);
end

function existPlayer(player,target)
	if(isElement(target))then
		return true
	else
		infobox(player,"cant find the player!",255,0,0);
		return false
	end
end

--// Player wasted
addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"setWindowDatas",source,"reset");
	setElementData(source,"Deaths",getElementData(source,"Deaths")+1);
	dbExec(handler,"UPDATE userdata SET Posx = '-1963.5256347656', Posy = '127.15285491943', Posz = '27.6875' WHERE Username = '"..getPlayerName(source).."'");
	
	setTimer(function(source)
		if(source)then
			fadeCamera(source,true);
			RegisterLogin.spawnPlayer(source);
		end
	end,3000,1,source)
end)

--// Ped wasted
addEventHandler("onPedWasted",root,function(ammo,attacker,weapon,bodypart)
	if(getElementData(source,"zombie") and getElementData(source,"zombie") == true)then
		if(attacker and getElementData(attacker,"Zombiekills"))then
			local x,y,z = getElementPosition(source);
			setElementData(attacker,"Zombiekills",getElementData(attacker,"Zombiekills")+1);
			
			if(isPremium(attacker))then
				Levelsystem.giveExperiencePoints(attacker,Main.ZombieExperience*2);
				setElementData(attacker,"Money",getElementData(attacker,"Money")+Main.ZombieMoney*2);
			else
				Levelsystem.giveExperiencePoints(attacker,Main.ZombieExperience);
				setElementData(attacker,"Money",getElementData(attacker,"Money")+Main.ZombieMoney);
			end
			Levelsystem.nearbyTeammates(attacker);
			if(math.random(1,10) == 5)then
				local bonuspoint = createPickup(x,y,z,3,3082,50);
				addEventHandler("onPickupHit",bonuspoint,function(player)
					if(not(isPedInVehicle(player)))then
						destroyElement(source);
						setElementData(player,"Bonuspoints",getElementData(player,"Bonuspoints")+1);
					end
				end)
			end
			
			--// Fireman explosion
			if(getPedSkin(source) == 277)then createExplosion(x,y,z,3) end
			
			--// Army
			if(getPedSkin(source) == 287)then
				if(math.random(1,3) == 2)then
					local number = math.random(1,999);
					if(number >= 1 and number <= 750)then
						weaponID = 31;
						weaponAmmo = 300;
						weaponPickupID = 356;
					elseif(number >= 751 and number <= 950)then
						weaponID = 36;
						weaponAmmo = 10;
						weaponPickupID = 360;
					elseif(number >= 951 and number <= 999)then
						weaponID = 38;
						weaponAmmo = 250;
						weaponPickupID = 362;
					end
					local pickup = createPickup(x,y,z,3,weaponPickupID,50);
					setElementData(pickup,"weaponID",weaponID);
					setElementData(pickup,"weaponAmmo",weaponAmmo);
					
					addEventHandler("onPickupHit",pickup,function(player)
						if(not(isPedInVehicle(player)))then
							local weapon,ammo = getElementData(source,"weaponID"),getElementData(source,"weaponAmmo");
							if(isPremium(player))then ammo = ammo*2 end
							giveWeapon(player,weapon,ammo,true);
							destroyElement(source);
						end
					end)
				end
			end
			
			--// Doctor
			if(getPedSkin(source) == 70)then
				local pickup = createPickup(x,y,z,3,1240,50);
				addEventHandler("onPickupHit",pickup,function(player)
					if(not(isPedInVehicle(player)))then
						setElementData(player,"Hearts",getElementData(player,"Hearts")+1);
						destroyElement(source);
					end
				end)
			end
			
			if(getElementData(attacker,"Zombiekills") >= 1      )then setPlayerAchievement(attacker,2)end
			if(getElementData(attacker,"Zombiekills") >= 1000   )then setPlayerAchievement(attacker,5)end
			if(getElementData(attacker,"Zombiekills") >= 10000  )then setPlayerAchievement(attacker,6)end
			if(getElementData(attacker,"Zombiekills") >= 100000 )then setPlayerAchievement(attacker,7)end
			if(getElementData(attacker,"Zombiekills") >= 1000000)then setPlayerAchievement(attacker,8)end
		end
	end
end)