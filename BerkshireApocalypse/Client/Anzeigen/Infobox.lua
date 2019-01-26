--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

infobox = {state = false,
	["Infos"] = {
		["error"] = {255,0,0,"Files/Images/Error.png"},
		["erfolg"] = {0,255,0,"Files/Images/Erfolg.png"},
		["info"] = {0,255,0,"Files/Images/Info.png"},},}

function infobox.create(text,typ)
	infobox.text = text;
	infobox.r = infobox["Infos"][typ][1];
	infobox.g = infobox["Infos"][typ][2];
	infobox.b = infobox["Infos"][typ][3];
	infobox.picture = infobox["Infos"][typ][4];
	
	if(infobox.state == false)then
		infobox.state = true;
		addEventHandler("onClientRender",root,infobox.render);
		
		setTimer(function()
			infobox.state = false;
			removeEventHandler("onClientRender",root,infobox.render);
		end,8000,1)
	end
end
addEvent("infobox.create",true)
addEventHandler("infobox.create",root,infobox.create)

function infobox.render()
    dxDrawRectangle(1033*(x/1440), 791*(y/900), 397*(x/1440), 99*(y/900), tocolor(0, 0, 0, 225), false)
    dxDrawText(infobox.text,1142*(x/1440), 801*(y/900), 1420*(x/1440), 880*(y/900), tocolor(infobox.r,infobox.g,infobox.b, 255), 1.00, "default-bold", "center", "center", false, true, false, false, false)
    dxDrawImage(1043*(x/1440), 801*(y/900), 89*(x/1440), 79*(y/900), infobox.picture, 0, 0, 0, tocolor(255, 255, 255, 255), false)
end