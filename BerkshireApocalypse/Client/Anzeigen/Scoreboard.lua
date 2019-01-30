--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

scoreboard = {scroll = 0, scoreboard = false}

bindKey("tab","down",function()
	if(getElementData(localPlayer,"loggedin") == 1)then
		if(GUIEditor.isWindow())then
			scoreboard.scoreboard = true
			GUIEditor.set("set");
			addEventHandler("onClientRender",root,scoreboard.render);
			scoreboard.update()
			showCursor(false);
			
			if(isTimer(scoreboard.updateTimer))then
				killTimer(scoreboard.updateTimer);
			end
			
			scoreboard.updateTimer = setTimer(scoreboard.update,10000,0);
			
			bindKey("mouse_wheel_down","down",scoreboard.scrollDown);
			bindKey("mouse_wheel_up","down",scoreboard.scrollUp);
			
			toggleControl("next_weapon",false)
			toggleControl("previous_weapon",false)
			toggleControl("fire",false)
		end
	end
end)

bindKey("tab","up",function()
	if(scoreboard.scoreboard == true)then
		scoreboard.scoreboard = false
		GUIEditor.set("reset");
		removeEventHandler("onClientRender",root,scoreboard.render);
		unbindKey("mouse_wheel_down","down",scoreboard.scrollDown);
		unbindKey("mouse_wheel_up","down",scoreboard.scrollUp);
		
		toggleControl("next_weapon",true)
		toggleControl("previous_weapon",true)
		toggleControl("fire",true)
	end
end)

function scoreboard.scrollDown()
	if(#getElementsByType("player")-scoreboard.scroll <= 2)then
		scoreboard.scroll = #getElementsByType("player")
	else
		scoreboard.scroll = scoreboard.scroll + 2
	end
end

function scoreboard.scrollUp()
	if(scoreboard.scroll <= 2)then
		scoreboard.scroll = 0
	else
		scoreboard.scroll = scoreboard.scroll - 2
	end
end

function scoreboard.formString(text)
	if(string.len(text) == 1)then
		text = "0"..text
	end
	return text
end

function scoreboard.update()
	pl = {}
	local i = 1
	
	for _,v in pairs(getElementsByType("player"))do
		Name = getPlayerName(v)
		Zombiekills = "-"
		Deaths = "-"
		Spielstunden = "-"
		Level = "-"
		Information = "-"
		Ping = getPlayerPing(v)
		
		if(getElementData(v,"loggedin") == 1)then
			Playingtime = getElementData(v,"playingtime")
			Hour = math.floor(Playingtime/60)
			Minute = Playingtime-Hour*60
			Spielstunden = scoreboard.formString(Hour)..":"..scoreboard.formString(Minute)
		
			Zombiekills = getElementData(v,"zombiekills")
			Deaths = getElementData(v,"deaths")
			Level = getElementData(v,"level")
			Information = adminsystem["Names"][language.get()][getElementData(v,"adminlevel")]
		end
		
		pl[i] = {}
		pl[i].Name = Name
		pl[i].Zombiekills = Zombiekills
		pl[i].Deaths = Deaths
		pl[i].Spielstunden = Spielstunden
		pl[i].Level = Level
		pl[i].Information = Information
		pl[i].Ping = Ping
		pl[i].Color = {255,255,255}
		
		if(getElementData(v,"vip") == 1 or getElementData(v,"lifetimevip") == 1)then pl[i].Color = {239,189,40} end

		i = i + 1
	end
end

function scoreboard.render()
    dxDrawRectangle(358*(x/1440), 255*(y/900), 724*(x/1440), 389*(y/900), tocolor(0,0,0, 225), false)
    dxDrawRectangle(358*(x/1440), 255*(y/900), 724*(x/1440), 22*(y/900), tocolor(255,255,255, 255), false)
    dxDrawText(language[language.get(localPlayer)][5][1], 358*(x/1440), 255*(y/900), 1082*(x/1440), 277*(y/900), tocolor(0,0,0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText(language[language.get(localPlayer)][5][2], 368*(x/1440), 287*(y/900), 478*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(487*(x/1440), 276*(y/900), 487*(x/1440), 643*(y/900), tocolor(255, 255, 255, 255), 2, false)
    dxDrawText(language[language.get(localPlayer)][5][3], 497*(x/1440), 287*(y/900), 583*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(593*(x/1440), 277*(y/900), 593*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
    dxDrawText(language[language.get(localPlayer)][5][4], 603*(x/1440), 287*(y/900), 684*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(694*(x/1440), 277*(y/900), 694*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
    dxDrawText(language[language.get(localPlayer)][5][5], 704*(x/1440), 287*(y/900), 814*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(824*(x/1440), 277*(y/900), 824*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
    dxDrawText(language[language.get(localPlayer)][5][6], 834*(x/1440), 287*(y/900), 915*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(925*(x/1440), 277*(y/900), 925*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
    dxDrawText(language[language.get(localPlayer)][5][7], 935*(x/1440), 287*(y/900), 1017*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(1027*(x/1440), 277*(y/900), 1027*(x/1440), 644*(y/900), tocolor(255, 255, 255, 255), 2, false)
    dxDrawText(language[language.get(localPlayer)][5][8], 1037*(x/1440), 287*(y/900), 1072*(x/1440), 308*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawLine(359*(x/1440), 312*(y/900), 1081*(x/1440), 312*(y/900), tocolor(255, 255, 255, 255), 2, false)
	
	di = 0
	for i = 1+scoreboard.scroll,12+scoreboard.scroll do
		if(pl[i])then
			dxDrawText(pl[i].Name, 368*(x/1440), 322*(y/900)+(17*di)+13, 478*(x/1440), 343*(y/900)+(17*di)+13, tocolor(pl[i].Color[1],pl[i].Color[2],pl[i].Color[3], 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(pl[i].Zombiekills, 497*(x/1440), 322*(y/900)+(17*di)+13, 583*(x/1440), 343*(y/900)+(17*di)+13, tocolor(255,255,255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(pl[i].Deaths, 603*(x/1440), 322*(y/900)+(17*di)+13, 684*(x/1440), 343*(y/900)+(17*di)+13, tocolor(255,255,255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(pl[i].Spielstunden, 704*(x/1440), 322*(y/900)+(17*di)+13, 814*(x/1440), 343*(y/900)+(17*di)+13, tocolor(255,255,255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(pl[i].Level, 834*(x/1440), 322*(y/900)+(17*di)+13, 915*(x/1440), 343*(y/900)+(17*di)+13, tocolor(255,255,255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(pl[i].Information, 935*(x/1440), 322*(y/900)+(17*di)+13, 1017*(x/1440), 343*(y/900)+(17*di)+13, tocolor(255,255,255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText(pl[i].Ping, 1037*(x/1440), 322*(y/900)+(17*di)+13, 1072*(x/1440), 343*(y/900)+(17*di)+13, tocolor(255,255,255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			di = di + 1
		end
	end
end
