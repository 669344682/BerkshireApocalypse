--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

anmeldebereich = {wait = 7500, animation1 = -100, animation2 = -110, colors = {}, texts = {},
	["Cords"] = {
		{10*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900),10*(x/1440), 10*(y/900), 186*(x/1440), 56*(y/900)},
		{196*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900),196*(x/1440), 10*(y/900), 372*(x/1440), 56*(y/900)},
		{382*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900),382*(x/1440), 10*(y/900), 558*(x/1440), 56*(y/900)},
		{568*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900),568*(x/1440), 10*(y/900), 744*(x/1440), 56*(y/900)},},
	}
customFont = dxCreateFont("Files/Font.ttf",20);

function anmeldebereich.click(button,state)
	if(state == "down")then
		if(isCursorOnElement(10*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900)))then anmeldebereich.registerLogin("login")end
		if(isCursorOnElement(196*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900)))then anmeldebereich.registerLogin("register")end
		if(isCursorOnElement(382*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900)))then language.change()end
		if(isCursorOnElement(568*(x/1440), 10*(y/900), 176*(x/1440), 46*(y/900)))then teaminfo.open()end
	end
end

function anmeldebereich.lobby()
	GUIEditor.set("set");
	setWeather(9);
	fadeCamera(true);
	showCursor(true);
	setElementData(localPlayer,"loggedin",0);
	setElementData(localPlayer,"language",1);
	setElementData(localPlayer,"savezone",1);
	setElementDimension(localPlayer,1);
	setElementData(localPlayer,"vip",0);
	
	setCameraMatrix(-2005.4229736328,193.98599243164,46.244598388672,-2004.8247070313,193.29585266113,45.837471008301);
	
	smoothMoveCamera(-2005.4229736328,193.98599243164,46.244598388672,-2004.8247070313,193.29585266113,45.837471008301,-1992.9862060547,137.99920654297,33.469501495361,-1992.0090332031,137.99261474609,33.257274627686,anmeldebereich.wait);
	
	setTimer(function()
		for i = 1,4 do
			anmeldebereich.colors[i] = {255,255,255};
			anmeldebereich.texts[i] = language[language.get()][2][i];
		end
		addEventHandler("onClientClick",root,anmeldebereich.click);
		addEventHandler("onClientRender",root,anmeldebereich.render);
	end,anmeldebereich.wait,1)
		
	anmeldebereich.sound = playSound("Files/login.mp3");
end
anmeldebereich.lobby()

function anmeldebereich.render()
	if(anmeldebereich.animation1 < 10)then anmeldebereich.animation1 = anmeldebereich.animation1 + 2 end
	if(anmeldebereich.animation2 < 0 )then anmeldebereich.animation2 = anmeldebereich.animation2 + 2 end
	
	dxDrawRectangle(0*(x/1440), anmeldebereich.animation2*(y/900), 1440*(x/1440), 66*(y/900), tocolor(0, 0, 0, 255), false)
	
	for k,v in ipairs(anmeldebereich["Cords"])do
		dxDrawRectangle(v[1],v[2],v[3],v[4], tocolor(255,255,255, 0), false)
		dxDrawText(anmeldebereich.texts[k],v[5],anmeldebereich.animation1*(y/900),v[7],v[8], tocolor(anmeldebereich.colors[k][1],anmeldebereich.colors[k][2],anmeldebereich.colors[k][3], 255), 1.00, customFont, "center", "center", false, false, false, false, false)
		
		if(isCursorOnElement(v[1],v[2],v[3],v[4]))then
			anmeldebereich.colors[k] = {255,255,0};
		else
			anmeldebereich.colors[k] = {255,255,255};
		end
	end
end

function anmeldebereich.registerLogin(typ)
	if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end

    GUIEditor.window[1] = guiCreateWindow(0.28, 0.30, 0.44, 0.41, "Anmeldebereich", true)
	
    GUIEditor.tabpanel[1] = guiCreateTabPanel(0.02, 0.08, 0.97, 0.89, true, GUIEditor.window[1])
    GUIEditor.tab[1] = guiCreateTab(language[language.get()][1][2], GUIEditor.tabpanel[1])
    GUIEditor.label[1] = guiCreateLabel(0.02, 0.03, 0.97, 0.37, language[language.get()][1][1], true, GUIEditor.tab[1])
    GUIEditor.label[2] = guiCreateLabel(0.02, 0.43, 0.22, 0.10, "Username:", true, GUIEditor.tab[1])
    GUIEditor.edit[1] = guiCreateEdit(0.25, 0.43, 0.73, 0.10, getPlayerName(localPlayer), true, GUIEditor.tab[1])
	guiEditSetReadOnly(GUIEditor.edit[1],true);
    GUIEditor.label[3] = guiCreateLabel(0.02, 0.56, 0.22, 0.10, "Passwort:", true, GUIEditor.tab[1])
    GUIEditor.edit[2] = guiCreateEdit(0.25, 0.56, 0.73, 0.10, "", true, GUIEditor.tab[1])
	guiEditSetMasked(GUIEditor.edit[2],true);
    GUIEditor.button[1] = guiCreateButton(0.02, 0.86, 0.25, 0.10, language[language.get()][1][2], true, GUIEditor.tab[1])
	
	GUIEditor.set("set",3);

	if(typ == "login")then
		guiSetText(GUIEditor.label[1],language[language.get()][1][5]);
		guiSetText(GUIEditor.button[1],language[language.get()][1][3]);
		guiSetText(GUIEditor.tab[1],language[language.get()][1][3]);
	end

	addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
		local passwort = guiGetText(GUIEditor.edit[2]);
		
		if(#passwort >= 1)then
			triggerServerEvent("anmeldebereich.server",localPlayer,guiGetText(GUIEditor.button[1]),passwort);
		end
	end,false)
end

addEvent("anmeldebereich.destroy",true)
addEventHandler("anmeldebereich.destroy",root,function()
	hud.visible()
	removeEventHandler("onClientRender",root,anmeldebereich.render);
	removeEventHandler("onClientClick",root,anmeldebereich.click);
	GUIEditor.set("reset");
	if(isElement(anmeldebereich.sound))then destroyElement(anmeldebereich.sound)end
end)