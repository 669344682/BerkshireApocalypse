--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

language = {
	[0] = {
		[1] = {"Dein Name ist bereits vergeben, bitte wähle einen anderen!","Du hast bereits einen Account bei uns!","Das angegebene Passwort ist nicht korrekt!","Du hast dich erfolgreich registriert.","Du hast dich erfolgreich eingeloggt."},
		[2] = {"Du bist ein Level aufgestiegen und bist nun Level "," Für das nächste Level benötigst du "," Erfahrungspunkte!"},
		[3] = {"Du benötigst mindestens Level "," für dieses Fahrzeug!"},
		[4] = {"Du hast dir den Skin gekauft.","Du hast nicht genug Bonuspunkte!"},
		[5] = {"Dein Leben wurde erhöht."},
		[6] = {"Du hast dir ein(e) "," mit "," Schuss gekauft.", "Du hast nicht genug Geld bei dir!"," für diese Waffe!"},
		[7] = {"Der angegebene Name ist bereits vergeben!","Du bist bereits in einem Team!","Du hast nicht genug Geld bei dir!","Das Team wurde erfolgreich erstellt. Die Teamverwaltung findest du unter F2.","Der Spieler ist bereits in einem Team!","Der Spieler konnte nicht gefunden werden oder ist nicht eingeloggt!"," hat dich in sein Team aufgenommen.","Du hast "," in dein Team aufgenommen."," hat dich aus seinem Team entfernt!","Du hast "," aus deinem Team entfernt.","Du bist nicht befugt, diese Funktion zu benutzen!","Du hast "," befördert."," degradiert.","Du wurdest von ","Der Spieler hat bereits den höchsten Rang!","Der Spieler hat bereits den niedrigsten Rang!","Du hast nicht genug Geld bei dir!","Es befindet sich nicht genug Geld in eurer Kasse!","Dein Team wurde gelöscht!"},
		[8] = {"Du hast die wöchentliche Gratis-Kiste erhalten."},
		[9] = {"Du hast dir für 14 Tage (336 Std.) Premium gekauft.","Du hast bereits Premium!","Dein Premium ist noch für "," Stunden aktiv.","Dein Premium ist nun nicht mehr aktiv.","Warte, bis deine noch offene Spende bearbeitet wurde!","Deine Spende wurde eingereicht.","Du hast dir Premium gekauft."},
		[10] = {"Du hast bereits ein Waffenlager!","Du hast nicht genug Coins!","Du hast dir ein Waffenlager gekauft, welches du unter F3 nutzen kannst.","Du hast nicht genug Bonuspunkte!","Du hast "," Bonuspunkte gegen "," Coin(s) getauscht.","Du hast bereits einen Zombieskin!","Du hast dir einen Zombieskin gekauft, welchen du im Inventar auswählen kannst."},
		[11] = {"Der Spieler existiert nicht!"," hat dir "," Coins gegeben.","Du hast "," Coins.","Der Spieler ist bereits gebannt!","Der Spieler konnte nicht gefunden werden oder ist nicht eingeloggt!","Du bist nicht befugt, diese Funktion zu nutzen!","Nicht möglich, da der Spieler dasselbe oder ein höheres Adminlevel als du hat!"," wurde von "," gekickt! Grund: ","Du hast "," gebannt! Grund: ","Du wurdest permanent gebannt! Grund: "," wurde permanent gebannt! Grund: ", "wurde für "," Stunden gebannt! Grund: ","Du wurdest für "," Stunden gebannt! Grund: ","Dieser Account ist permanent gebannt!","Dieser Account ist noch für "," Stunden gebannt! Grund: "},},
	[1] = {
		[1] = {"Your name is already taken, please choose another!","You already have an account on our server!","The specified password is not correct!","You have registered successfully.","You have successfully logged in."},
		[2] = {"You reached a new level and are now level "," For the next level you need "," Experience-Points."},
		[3] = {"You need at least Level "," for this vehicle!"},
		[4] = {"You bought the skin.","You don't have enough Bonuspoints!"},
		[5] = {"Your life has been increased."},
		[6] = {"You bought a "," with "," shot.","You don't have enough money with you!"," for this weapon!"},
		[7] = {"The teamname is already taken!","You are already in a team!","You don't have enough money with you!","The team has been created. You can find the teampanel under F2.","The player is already in a team!","The player could not found or is not loggedin!"," added you to his team."," you invited "," into your team.","removed you from his team!","You removed "," from your team.","You are not authorized to use this function!","You have "," promoted."," demoted.","You wast from ","The player already has the highest rank!","The player already has the lowest rank!","You don't have enough money with you!","There is not enough money in your cash register!","Your team has been deleted."},
		[8] = {"You have received the weekly free chest."},
		[9] = {"You bought Premium for 14 days (336 hours).","You already have Premium!","Your premium is still active for "," hours.","Your premium is no longer active.","Wait until your current donation has been processed!","Your donation has been submitted.","You bought Premium."},
		[10] = {"You already have a Weapon Depot!","You don't have enough coins!","You bought a Weapon Depot, which you can use under F6.","You don't have enough bonuspoints!","You have exchanged "," bonuspoints for "," coin(s).","You already have a Zombieskin!","You bought a Zombieskin, which you can select in the inventory."},
		[11] = {"The player doesn't exist!"," gave you "," Coins.","You gave "," Coins.","The player is already banned!","The player could not be found or is not logged in!","You are not authorized to use this function!","Not possible because the player has the same or a higher adminlevel than you!"," was kicked by ","! Reason: ","You banished ","! Reason: ","You were banned permanently! Reason: "," was banned permanently! Reason: "," was banned for "," hours! Reason: ","You were banned for "," hours! Reason: ","This account is permanently banned!","This account is still banned for "," hours! Reason: "},},}

function language.get(player)
	return getElementData(player,"language")
end