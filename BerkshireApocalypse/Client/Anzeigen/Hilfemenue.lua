--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

hilfemenue = {state = false,
	["Kategorien"] = {
		[0] = {"Klicksystem","Bonuspunkte","Spenden","Schutzzonen","Waffenläden","Updates","Sprachensystem","Zombies","Levelsystem","Team","Premium","Achievements","Waffenlager"},
		[1] = {"Clicksystem","Bonuspoints","Donations","Protection Zones","Weapon Stores","Updates","Languagesystem","Zombies","Levelsystem","Team","Premium","Achievements","Weapon Depot"},},
	["Texte"] = {
		[0] = {
			["Klicksystem"] = "Mit der Taste 'M' kann man den Cursor ein- und wieder ausblenden lassen. Mit dem Cursor lassen sich Peds anklicken.",
			["Bonuspunkte"] = "Wenn man einen Zombie eliminiert, besteht die Möglichkeit (1:10), dass dieser einen Bonuspunkt dropt. Diesen kann man einsammeln und anschließend für Skins und Coins ausgeben. Wie viele Bonuspunkte man bereits hat, kann man in seinem Inventar unter 'I' einsehen.",
			["Spenden"] = "Sollte man Interesse daran haben, dieses Projekt zu unterstützen, besteht die Möglichkeit uns eine Spende zu geben. Dies ist am Bahnhof beim Spenden-Ped möglich. Als Zeichen unserer Dankbarkeit erhält man pro Euro einen Berkshire-Coin. Mit Coins kann man sich exklusive Artikel im Coinshop kaufen.",
			["Schutzzonen"] = "Die auf der Karte und dem Radar zu sehenden grünen Zonen sind Schutzzonen, in denen man sicher vor dem Ansturm der Zombies ist. Außerdem findet man in allen Schutzzonen Fahrzeuge und einen Waffenladen. In der Hauptschutzzone am Bahnhof befinden sich noch diverse Peds, an denen man Informationen und Shops findet.",
			["Waffenläden"] = "In jeder Schutzzone befindet sich jeweils ein Waffenladen, bei welchem man eine große Auswahl von Waffen hat. Allerdings hat man nicht direkt Zugriff auf alle Waffen. Mit dem Erreichen bestimmter Level, schalten sich weitere Waffen frei.",
			["Updates"] = "Der Berkshire Apocalypse Gamemode wird regelmäßig weiterentwickelt, um Dauerhaften Spaß zu garantieren. Zu Festtagen wie z.B. Halloween oder Ostern finden zudem Events statt, bei denen man exklusive Artikel erwerben kann.",
			["Sprachensystem"] = "Auf unserem Server hat man die Möglichkeit, zwischen den Sprachen Deutsch und Englisch zu wählen. Die deutsche Übersetzung sollte einwandfrei sein, bei der englischen Übersetzung könnte sich Fehler eingeschlichen haben. Sollte man Fehler finden, kann man uns diese mit unserem Reportsystem unter F4 mitteilen.",
			["Zombies"] = "In der Nähe eines Spielers können bis zu 100 Zombies spawnen, welche man töten sollte, wenn man nicht sterben möchte. Durch das erledigen eines Zombies erhält man 25$ und fünf Erfahrungspunkte.",
			["Levelsystem"] = "Mit dem erledigen eines Zombies erhält man fünf Erfahrungspunkte. Sobald man genug Erfahrungspunkte gesammelt hat, steigt man ein Level auf. Wie viele Erfahrungspunkte man zurzeit hat und wie viele man noch bis zum nächsten Level braucht, sieht man oben rechts in seinem HUD. Man benötigt sein eigenes Level + 1 * 250 Erfahrungspunkte für einen Levelaufstieg.",
			["Team"] = "In der Hauptschutzzone am Bahnhof hat man die Möglichkeit, für 50.000$ ein eigenes Team zu grünen, wodurch man sich einige Vorteile verschaffen kann. Mit einem Team hat man die Möglichkeit, seine eine kleine Base wie auch Teamfahrzeuge zu kaufen. Außerdem erhält man zwei Erfahrungspunkte, wenn ein Teamkamerad in der Nähe einen Zombie erschießt.",
			["Premium"] = "Premium kann in unserem Coinshop erworben werden. Mit einem aktiven Premium-Status hat man folgende Vorteile:\n\n- Für das Töten eines Zombies erhältst du nun 10 statt 5 Erfahrungspunkte.\nFür das Töten eines Zombies erhältst du nun 50 stat 25$.\n- Zu jeder vollen Stunde erhältst du einen Payday, bei welchem du Geld und Erfahrungspunkte bekommst. Außerdem besteht eine geringe Chance, dass du einen Berkshire-Coin erhältst.\n- Jede Waffe die du aufsammelst, hat die doppelte Anzahl von Munition.\n- Deine Waffen speichern, wenn du den Server verlässt.\n- Du skillst deine Waffen schneller.",
			["Achievements"] = "Unter F5 befindet sich das Achievements-Panel, in welchem man alle verfügbaren Achievements und die dazugehörigen Aufgaben einsehen kann. Pro erreichtes Achievement erhält man einen Pokal, durch welchen man 25 Erfahrungspunkte am Payday erhält.",
			["Waffenlager"] = "Das Waffenlager, welches im Coinshop erworben werden kann, ermöglicht es einem, überall Waffen ein- und auszulagern."},
		[1] = {
			["Clicksystem"] = "With the key 'M' you can switch the cursor on and off again. You can use the cursor to click on Peds.",
			["Bonuspoints"] = "If you eliminate a zombie, there is the possibility (1:10) that he drop a bonuspoint. You can collect them and spent them on skins an Coins. How many bonuspoints you already have, you can see in your inventory under 'I'.",
			["Donations"] = "If you are interested in supporting this project, you have the opportunity to donate. This is possible at the station at the Donation-Ped. As a token of our gratitude you get a Coin per Euro. With Coins you can buy exclusive items in the Coinshop.",
			["Protection Zones"] = "The green zones visible on the map and radar are protected areas where you are safe from the onslaught of zombies. In addition, there are vehicles and a weapons shop in all protected areas. In the main protection zone at the station are still several Peds, where one finds information and shops.",
			["Weapon Stores"] = "In each protection zone there is a weapon shop with a large selection of weapons. However, one does not have direct access to all weapons. When certain levels are reached, more weapons are unlocked.",
			["Updates"] = "The Berkshire Apocalypse Gamemode is regularly evolving to ensure lasting fun. For festive days such as Halloween or Easter also hosts events where you can buy exclusive items.",
			["Languagesystem"] = "On our server you have the possibility to choose between the languages German and English. The German translation should be flawless, in the English translation could have crept errors. If you find errors, you can tell us with our report system under F4.",
			["Zombies"] = "Near a player can spawn up to 100 zombies, which should be killed if you do not want to die. By killing a zombie you get 25$ and five experience points.",
			["Levelsystem"] = "By Killing a zombie you get five experience points. As soon as you have gained enough experience points, you get a higher level. How many experience points you currently have and how many you still need to the next level, you can see in the top right of your HUD. You need your own level + 1 * 250 experience points for a level up.",
			["Team"] = "In the main protection zone at the station, you have the opportunity to green your own team for 50.000$, which gives you some advantages. With a team you have the opportunity to buy his a small base as well as team vehicles. In addition, you get two experience points when a teammate shoots a zombie nearby.",
			["Premium"] = "Premium can be purchased in our Coinshop. With an active premium-status you will get the following benefits:\n\n- You get 10 instead 5 experience points for killing a zombie.\n- You get 50$ instead 25$ for killing a zombie.\n-Every full hour you get a payday, where you get money and experience points. There's also a little chance that you getting a coin.\n- Each weapon you collect has twice that amount of ammo.\n- Your weapons will be saved, when you leave the server.\n- You skill your weapons faster.",
			["Achievements"] = "Under F5 you can open the Achievement-Panel, where you find all available achievements and there tasks. For each achievement you get a trophy, which gives you 25 experience points on payday.",
			["Weapon Depot"] = "The weapon store, which can be purchased in the Coinshop, makes it possible to store and retrieve weapons anywhere."},},}

bindKey("f1","down",function()
	if(hilfemenue.state == false)then
		if(GUIEditor.isWindow())then
			hilfemenue.state = true
	
			GUIEditor.window[1] = guiCreateWindow(0.34, 0.23, 0.35, 0.43, language[language.get()][6][1], true)
			
			GUIEditor.gridlist[1] = guiCreateGridList(0.02, 0.09, 0.41, 0.89, true, GUIEditor.window[1])
			kategorie = guiGridListAddColumn(GUIEditor.gridlist[1], language[language.get()][6][3], 0.9)
			
			GUIEditor.memo[1] = guiCreateMemo(0.45, 0.09, 0.53, 0.71, language[language.get()][6][2], true, GUIEditor.window[1])
			
			GUIEditor.set("set");
			
			for key,_ in pairs(hilfemenue["Kategorien"][language.get()])do
				row = guiGridListAddRow(GUIEditor.gridlist[1])
				guiGridListSetItemText(GUIEditor.gridlist[1],row,kategorie,hilfemenue["Kategorien"][language.get()][key],false,false)
			end
			
			addEventHandler("onClientGUIClick",GUIEditor.gridlist[1],function()
				local kategorie = guiGridListGetItemText(GUIEditor.gridlist[1],guiGridListGetSelectedItem(GUIEditor.gridlist[1]),1)
					
				if(not(kategorie == ""))then
					guiSetText(GUIEditor.memo[1],hilfemenue["Texte"][language.get()][kategorie]);
				end
			end,false)
		end
	else
		hilfemenue.state = false
		GUIEditor.set("reset");
	end
end)
