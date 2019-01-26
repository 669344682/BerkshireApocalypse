--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

updates = {}

addEvent("updates.create",true)
addEventHandler("updates.create",root,function()
	if(GUIEditor.isWindow())then
        GUIEditor.window[1] = guiCreateWindow(0.37, 0.27, 0.26, 0.44, "Updates", true)

        GUIEditor.memo[1] = guiCreateMemo(0.03, 0.07, 0.95, 0.80, "Version 1.3 (15.05.2018)\n- Kategorie 'Klicksystem' ins Hilfemenü integriert und die Kategorien 'Achievements' und 'Waffenlager' aktualisiert.\n\nVersion 1.2 (25.04.2018)\n\n- Im Coinshop erhält man nun eine kleine Information, wenn man einen Artikel anklickt.\n- Man kann sich im Coinshop nun einen Zombieskinkaufen, durch welchen man nicht mehr von Zombies angegriffen wird.\n- Premium Spieler werden nun in der Spielerliste hervorgehoben.\n- Im Coinshop kann man sich nun ein Waffenlager kaufen.\n- Man kann sich nun, neben 14 Tage Premium, auch Lifetime Premium kaufen.\n- Bug beim Teamsystem behoben.\n- Man bekommt nun 0.2 statt 0.1 pro Schuss bei den Waffenskills dazu.\n- Mit einem aktiven Premiumstatus bekommt man nun 0.5 statt 0.2 pro Schuss bei den Waffenskills dazu.\n\nVersion 1.1 (10.04.2018)\n\n- Ein Achievementsystem wurde implementiert (F5).\n- Am Bahnhof gibt es nun eine Topliste\n- Waffen speichern nun beim offline gehen, wenn man einen aktiven Premiumstatus hat.\n- Die Teamverwaltung aktualisiert nun korrekt.\n\nVersion 1.0 (09.04.2018)\n\n- Der Anmeldebereich wurde komplett überarbeitet.\n- Peds können nun angeklickt werden.\n- Ein Coinshop wurde implementiert.\n- Es gibt nur noch eine begrenzte Anzahl von Skins für Bonuspunkte zu kaufen.\n- Das komplette Serverdesign wurde erneuert.\n- Implementierung eines Premiumsystems.\n- Das Zombie-Limit wurde auf 50 reduziert.\n- Wenn man sich im Anmeldebereich oder in einer Schutzzone befindet, wird man nicht mehr bei der Erstellung der Zombies berücksichtigt.\n- Es gibt nun ein Inventar, welches man unter 'I' findet. Mit einem Doppelklick auf das jeweilige Item, kann dies genutzt werden.\n- Ein Offline-Message-System wurde eingefügt.\n- Unter F4 gibt es nun ein adminsystem.\n- Bonuspunkte werden beim Kauf eines Skins nun richtig abgezogen.\n- Bei der Auswahl im Skinshop befindet man sich nun in einem Skinshop.", true, GUIEditor.window[1])
        guiMemoSetReadOnly(GUIEditor.memo[1], true)
		
        GUIEditor.button[1] = guiCreateButton(0.26, 0.89, 0.47, 0.08, language[language.get()][4][1], true, GUIEditor.window[1])
		
		GUIEditor.set("set");
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			GUIEditor.set("reset");
		end,false)
	end
end)