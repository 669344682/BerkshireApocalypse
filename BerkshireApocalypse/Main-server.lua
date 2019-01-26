--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

handler = dbConnect("mysql","dbname=berkshireapocalypse;host=127.0.0.1","root","");

Serverinfos = {name = "Berkshire Apocalypse", version = "v.1.3"}

setFPSLimit(60)
setGameType(Serverinfos.name.." "..Serverinfos.version);

main = {pickups = {}, marker = {}, id = 0, zombiemoney = 25, zombieexp = 5,
	["Peds"] = {[70] = true,[287] = true},}
	
function main.load()
	local realtime = getRealTime();
	setTime(realtime.hour,realtime.minute);
	setMinuteDuration(60000);
end
main.load()

function getPlayerAllData(from,where,name,data)
	sql = dbQuery(handler,"SELECT * FROM "..from.." WHERE "..where.." = '"..name.."'");
	
	if(sql)then
		rows = dbPoll(sql,-1)
		
		for k, v in pairs(rows)do
			return v[data]
		end
	end
end

function getSecTime(duration)
	local time = getRealTime()
	local year = time.year
	local day = time.yearday
	local hour = time.hour
	local minute = time.minute
	
	local total = year * 365 * 24 * 60 + day * 24 * 60 + ( hour + duration ) * 60 + minute
	
	return total
end

function getTime()
	local time = getRealTime()
	local hours = time.hour
	local minute = time.minute
	local day = time.monthday
	local month = time.month
	local year = time.year+1900
	
	return {hours,minute,day,month,year}
end

function isPlayerExist(player)
	local database = dbQuery(handler,"SELECT * FROM userdata WHERE username = '"..player.."'");
	local result,num_rows = dbPoll(database,-1);
	
	if(num_rows == 1)then
		return true
	else
		return false
	end
end

addEventHandler("onPlayerWasted",root,function()
	triggerClientEvent(source,"GUIEditor.set",source,"reset");
	fadeCamera(source,false);
	
	setElementData(source,"deaths",getElementData(source,"deaths")+1);
	dbExec(handler,"UPDATE userdata SET posx = '-1963.5256347656', posy = '127.15285491943', posz = '27.6875' WHERE username = '"..getPlayerName(source).."'");
	
	setTimer(function(source)
		if(isElement(source))then
			fadeCamera(source,true);
			anmeldebereich.spawn(source)
			Achievements.set(source,"ErstesMalGestorben",15);
			if(getElementData(source,"deaths") >= 10)then Achievements.set(source,"Gestorben10Mal",16)end
			if(getElementData(source,"deaths") >= 25)then Achievements.set(source,"Gestorben10Mal",17)end
			if(getElementData(source,"deaths") >= 50)then Achievements.set(source,"Gestorben10Mal",18)end
		end
	end,3000,1,source)
end)

addEventHandler("onPedWasted",root,function(ammo,attacker,weapon,bodypart)
	if(getElementData(source,"zombie") and getElementData(source,"zombie") == true)then
		if(attacker and getElementData(attacker,"zombiekills"))then
			local x,y,z = getElementPosition(source)
			local bonuspoint = math.random(1,10)
			setElementData(attacker,"zombiekills",getElementData(attacker,"zombiekills")+1);
			
			if(getElementData(attacker,"zombiekills") >= 10000)then Achievements.set(attacker,"ZombieKills10000",1)end
			if(getElementData(attacker,"zombiekills") >= 50000)then Achievements.set(attacker,"ZombieKills10000",2)end
			if(getElementData(attacker,"zombiekills") >= 125000)then Achievements.set(attacker,"ZombieKills10000",3)end
			if(getElementData(attacker,"zombiekills") >= 250000)then Achievements.set(attacker,"ZombieKills10000",4)end
			if(getElementData(attacker,"zombiekills") >= 500000)then Achievements.set(attacker,"ZombieKills10000",5)end
			if(getElementData(attacker,"zombiekills") >= 1000000)then Achievements.set(attacker,"ZombieKills10000",6)end
			
			if(isVip(attacker))then
				levelsystem.giveExp(attacker,main.zombieexp*2);
				givePlayerMoney(attacker,main.zombiemoney*2);
			else
				levelsystem.giveExp(attacker,main.zombieexp);
				givePlayerMoney(attacker,main.zombiemoney);
			end
			
			levelsystem.teamCheck(attacker);
			
			if(bonuspoint == 5)then
				main.id = main.id + 1
				main.pickups[main.id] = createPickup(x,y,z,3,3082,50)
				addEventHandler("onPickupHit",main.pickups[main.id],function(player)
					destroyElement(source);
					setElementData(player,"bonuspoints",getElementData(player,"bonuspoints")+1);
				end)
			end
			
			if(ostern == true)then
				if(math.random(1,10) == 7)then
					main.id = main.id + 1
					main.pickups[main.id] = createPickup(x,y,z,3,2114,50);
					main.marker[main.id] = createMarker(x,y,z,"corona",1.5,math.random(0,255),math.random(0,255),math.random(0,255),125);
					addEventHandler("onPickupHit",main.pickups[main.id],function(player)
						destroyElement(source);
						setElementData(player,"ostereier",getElementData(player,"ostereier")+1);
					end)
					addEventHandler("onMarkerHit",main.marker[main.id],function(player)
						if(getElementType(player) == "player")then
							destroyElement(source)
						end
					end)
				end
			end

			if(getPedSkin(source) == 277)then -- Feuerwehrmann
				createExplosion(x,y,z,3);
			end
			
			if(main["Peds"][getPedSkin(source)] == true)then
				main.id = main.id + 1
				if(getPedSkin(source) == 70)then -- Arzt
					main.pickups[main.id] = createPickup(x,y,z,3,1240,50);
					addEventHandler("onPickupHit",main.pickups[main.id],function(player)
						setElementData(player,"heart",getElementData(player,"heart")+1);
						destroyElement(source);
					end)
				end
				if(getPedSkin(source) == 287)then -- Army
					local number = math.random(1,3)
					if(number == 2)then
						local number = math.random(1,999)
						if(number >= 1 and number <= 750)then
							weaponID = 31
							weaponMunition = 300
							weaponPickupID = 356
						elseif(number >= 741 and number <= 950)then
							weaponID = 36
							weaponPickupID = 360
							weaponMunition = 10
						elseif(number >= 951 and number <= 999)then
							weaponID = 38
							weaponMunition = 250
							weaponPickupID = 362
						end
						main.pickups[main.id] = createPickup(x,y,z,3,weaponPickupID,50);
						setElementData(main.pickups[main.id],"weaponID",weaponID);
						setElementData(main.pickups[main.id],"weaponMunition",weaponMunition);
						addEventHandler("onPickupHit",main.pickups[main.id],function(player)
							local waffe,munition = getElementData(source,"weaponID"),getElementData(source,"weaponMunition");
							if(isVip(player))then munition = munition*2 else munition = munition end
							
							giveWeapon(player,waffe,munition,true);
							destroyElement(source);
						end)
					end
				end
			end
		end
	end
end)