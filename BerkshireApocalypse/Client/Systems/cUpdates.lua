--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	cUpdates
	Last Edit: 13.02.2019

]]--

addEvent("Updates.createWindow",true)
addEventHandler("Updates.createWindow",root,function()
	if(isWindowOpen())then
        BerkshireApocalypse.window[1] = guiCreateWindow(655, 317, 334, 337, "Updates", false)

        BerkshireApocalypse.memo[1] = guiCreateMemo(10, 29, 314, 298, "v.1.0.2 (13.02.2019)\n\n- Neue Infobox.\n- Neue GUI-Klasse\n- Allgemeines Design von Fenstern verbessert.\n- Weitere Waffen im Waffenladen.\n- Das komplette Spendensystem wurde entfernt.\n-Die Sprache Deutsch wurde entfernt - Das Script ist nun komplett auf Englisch.\n- Gedroppte Sachen können nicht mehr in einem Fahrzeug eingesammelt werden.\n- Die Schutzzone 'Chicken Valley' wurde hinzugefügt.\n- Mit einem aktiven Premiumstatus kann man sich nun in andere Schutzzonen teleportieren.\nNeues Nametag für Peds.\n- Einige kleinere Fehler wurden behoben.\n- Spieler mit einem aktiven Premiumstatus werden im Scoreboard nun hervorgehoben.\n- Neues Scoreboard.\n- Neues Inventar - Nun mit Scrollfunktion, damit unbegrenzt neue Items hinzugefügt werden können.\n- Verbesserung des Achievementsystem und einige neue Achievements.", false, BerkshireApocalypse.window[1])
        guiMemoSetReadOnly(BerkshireApocalypse.memo[1], true)
		setWindowDatas("set");
	end
end)