--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

Serverinfos = {name = "Berkshire Apocalypse", version = "v.1.3"}

x,y = guiGetScreenSize()
GUIEditor = {window = {}, tabpanel = {}, tab = {}, label = {}, button = {}, edit = {}, memo = {}, gridlist = {}, staticimage = {}, radiobutton = {}, blurState = false, window_points = 0,
	["sonderzeichen"] = {"-","+","ä","ü","ö",",","#","'","*","~",":",";","=","}","{","?","/","\\","&","§","!","°","@","|","`","´","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","Ä","Ü","Ö"},}

function checkSonderzeichen(text)
	local counter = 0
	
	for _,v in ipairs(GUIEditor["sonderzeichen"])do
		if(string.find(text,v))then
			counter = counter + 1
		end
	end
	
	if(counter > 0)then
		infobox.create(language[language.get()][14][1],"error");
		return false
	else
		return true
	end
end

function GUIEditor.bars()
	if(GUIEditor.window_points < 40)then GUIEditor.window_points = GUIEditor.window_points + 1 end
	
	dxDrawRectangle(0*(x/1440), 0*(y/900), 1440*(x/1440), GUIEditor.window_points*(y/900), tocolor(0, 0, 0, 255), false)
	dxDrawRectangle(0*(x/1440), 900*(y/900), 1440*(x/1440), - GUIEditor.window_points*(y/900), tocolor(0, 0, 0, 255), false)
end

function GUIEditor.isWindow()
	if(getElementData(localPlayer,"loggedin") == 1)then
		if(isElement(GUIEditor.window[1]) or getElementData(localPlayer,"elementClicked") == true)then
			return false
		else
			return true
		end
	end
end

function GUIEditor.set(typ,id,blurtyp)
	if(typ == "set")then
		if(GUIEditor.blurState == false)then
			if(not(blurtyp))then
				GUIEditor.blurState = true;
				addEventHandler("onClientRender",root,blur.render);
			end
			addEventHandler("onClientRender",root,GUIEditor.bars);
		end
		setElementData(localPlayer,"elementClicked",true);
		showChat(false);
		showCursor(true);
		setPlayerHudComponentVisible("radar",false);
		setPlayerHudComponentVisible("area_name",false);
		
		if(isElement(GUIEditor.window[1]) and not(blurtyp))then
			centerWindow(GUIEditor.window[1])
			guiWindowSetSizable(GUIEditor.window[1],false);
			guiWindowSetMovable(GUIEditor.window[1],false);
		end
		
		if(id and id ~= "none")then
			for i = 1,id do
				guiSetFont(GUIEditor.label[i], "default-bold-small")
				guiLabelSetHorizontalAlign(GUIEditor.label[i], "center", true)
				guiLabelSetVerticalAlign(GUIEditor.label[i], "center")
			end
		end
	else
		GUIEditor.blurState = false;
		removeEventHandler("onClientRender",root,GUIEditor.bars);
		removeEventHandler("onClientRender",root,blur.render);
		setElementData(localPlayer,"elementClicked",false);
		showChat(true);
		showCursor(false);
		GUIEditor.window_points = 0;
		setPlayerHudComponentVisible("radar",true);
		setPlayerHudComponentVisible("area_name",true);
		if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
	end
end
addEvent("GUIEditor.set",true)
addEventHandler("GUIEditor.set",root,GUIEditor.set)

function centerWindow(center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end

function isCursorOnElement(x,y,w,h)
	if(isCursorShowing())then
		local mx,my = getCursorPosition()
		local fullx,fully = guiGetScreenSize()
		cursorx,cursory = mx*fullx,my*fully
		if(cursorx > x and cursorx < x + w and cursory > y and cursory < y + h)then
			return true
		else
			return false
		end
	end
end

bindKey("m","down",function()
	showCursor(not(isCursorShowing()))
end)

addEventHandler("onClientPlayerDamage",root,function()
	cancelEvent();
end)

addEventHandler("onClientPlayerWasted",root,function()
	GUIEditor.set("reset");
end)