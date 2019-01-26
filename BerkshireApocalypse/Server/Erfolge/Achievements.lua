--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

Achievements = {
	["Infos"] = {
		{"ZombieKills10000","Zombie-Killer #1","Zombie-Killer #1"},
		{"ZombieKills50000","Zombie-Killer #2","Zombie-Killer #2"},
		{"ZombieKills125000","Zombie-Killer #3","Zombie-Killer #3"},
		{"ZombieKills250000","Zombie-Killer #4","Zombie-Killer #4"},
		{"ZombieKills500000","Zombie-Killer #5","Zombie-Killer #5"},
		{"ZombieKills1000000","Zombie-Killer #6","Zombie-Killer #6"},
		{"ErsterLevelUp","Level-Experte #1","Level-Expert #1"},
		{"LevelErreicht10","Level-Experte #2","Level-Expert #2"},
		{"LevelErreicht25","Level-Experte #3","Level-Expert #3"},
		{"LevelErreicht50","Level-Experte #4","Level-Expert #4"},
		{"LevelErreicht100","Level-Experte #5","Level-Expert #5"},
		{"LevelErreicht250","Level-Experte #6","Level-Expert #6"},
		{"ErsteWaffeGekauft","Waffennarr","Weapon lover"},
		{"ErsterPayday","Bonze","Rich boy"},
		{"ErstesMalGestorben","Kenny #1","Kenny #1"},
		{"Gestorben10Mal","Kenny #2","Kenny #2"},
		{"Gestorben25Mal","Kenny #3","Kenny #3"},
		{"Gestorben50Mal","Kenny #4","Kenny #4"},},
	["Texts"] = {
		[0] = {
			{"Zombie-Killer #1"},
			{"Zombie-Killer #2"},
			{"Zombie-Killer #3"},
			{"Zombie-Killer #4"},
			{"Zombie-Killer #5"},
			{"Zombie-Killer #6"},
			{"Level-Experte #1"},
			{"Level-Experte #2"},
			{"Level-Experte #3"},
			{"Level-Experte #4"},
			{"Level-Experte #5"},
			{"Level-Experte #6"},
			{"Waffennarr"},
			{"Bonze"},
			{"Kenny #1"},
			{"Kenny #2"},
			{"Kenny #3"},
			{"Kenny #4"},},
		[1] = {
			{"Zombie-Killer #1"},
			{"Zombie-Killer #2"},
			{"Zombie-Killer #3"},
			{"Zombie-Killer #4"},
			{"Zombie-Killer #5"},
			{"Zombie-Killer #6"},
			{"Level-Expert #1"},
			{"Level-Expert #2"},
			{"Level-Expert #3"},
			{"Level-Expert #4"},
			{"Level-Expert #5"},
			{"Level-Expert #6"},
			{"Weapon lover"},
			{"Rick boy"},
			{"Kenny #1"},
			{"Kenny #2"},
			{"Kenny #3"},
			{"Kenny #4"},},},}
		
function Achievements.check(player)
	local database = dbQuery(handler,"SELECT * FROM achievements WHERE username = '"..getPlayerName(player).."'");
	local result,num_rows = dbPoll(database,-1);
	
	if(num_rows == 0)then
		dbExec(handler,"INSERT INTO achievements (username) VALUES ('"..getPlayerName(player).."')");
	end
end
		
function Achievements.set(player,achievement,text)
	local achievementCheck = getPlayerAllData("achievements","username",getPlayerName(player),achievement);
	
	if(achievementCheck == 0)then
		dbExec(handler,"UPDATE achievements SET "..achievement.." = ? WHERE username = ?","1",getPlayerName(player));
		givePlayerMoney(player,1500);
		setElementData(player,"pokale",getElementData(player,"pokale")+1);
		triggerClientEvent(player,"Achievements.show",player,Achievements["Texts"][language.get(player)][text][1]);
	end
end

addEvent("Achievements.state",true)
addEventHandler("Achievements.state",root,function(id)
	Achievements.state = getPlayerAllData("achievements","username",getPlayerName(client),Achievements["Infos"][id][1]);
	if(Achievements.state == 0)then state = "✘" else state = "✔" end
	if(getElementData(client,"language") == 0)then text = Achievements["Infos"][id][2] else text = Achievements["Infos"][id][3] end
	triggerClientEvent(client,"Achievements.state",client,text,state);
end)