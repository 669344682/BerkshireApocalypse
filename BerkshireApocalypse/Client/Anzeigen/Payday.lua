--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

payday = {state = false}

function payday.render()
	if(GUIEditor.isWindow())then
		dxDrawRectangle(10*(x/1440), 314*(y/900), 212*(x/1440), 272*(y/900), tocolor(0, 0, 0, 175), false)
		dxDrawLine(10*(x/1440), 336*(y/900), 222*(x/1440), 336*(y/900), tocolor(255, 255, 255, 255), 1, false)
		dxDrawText("Payday", 10*(x/1440), 314*(y/900), 222*(x/1440), 336*(y/900), tocolor(0, 255, 0, 175), 1.00, "default-bold", "center", "center", false, false, false, false, false)
		dxDrawText("+ "..payday.money.."$\n\n+ "..payday.erfahrungspunkte.." "..language[language.get()][18][1].."\n\n+ "..payday.coins.." Coins", 10*(x/1440), 346*(y/900), 222*(x/1440), 518*(y/900), tocolor(255, 255, 255, 200), 1.00, "default-bold", "center", "top", false, false, false, false, false)
		dxDrawText(language[language.get()][18][2], 10*(x/1440), 564*(y/900), 222*(x/1440), 586*(y/900), tocolor(0, 255, 0, 175), 1.00, "default-bold", "center", "center", false, false, false, false, false)
		dxDrawLine(10*(x/1440), 557*(y/900), 222*(x/1440), 557*(y/900), tocolor(255, 255, 255, 255), 1, false)
	end
end

addEvent("payday.render",true)
addEventHandler("payday.render",root,function(money,erfahrungspunkte,coin)
	payday.money = money;
	payday.erfahrungspunkte = erfahrungspunkte;
	payday.coins = coin;
	
	if(payday.state == true)then
		removeEventHandler("onClientRender",root,payday.render);
	else
		if(GUIEditor.isWindow())then
			payday.state = true;
			addEventHandler("onClientRender",root,payday.render);
			bindKey("space","down",function()
				removeEventHandler("onClientRender",root,payday.render);
				unbindKey("space","down");
				payday.state = false;
			end)
		else
			outputChatBox("_____| Payday |_____",125,125,0);
			outputChatBox("+ "..payday.money.."$",0,125,0);
			outputChatBox("+ "..payday.erfahrungspunkte.." "..language[language.get()][18][1],0,125,0);
			outputChatBox("+ "..payday.coins.." Coins",0,125,0);
		end
	end
end)