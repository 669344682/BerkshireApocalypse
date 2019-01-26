--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

waffenskills = {state = false, weapon = nil}

function waffenskills.render()
	if(GUIEditor.isWindow())then
        dxDrawRectangle(1209*(x/1440), 176*(y/900), 221*(x/1440), 32*(y/900), tocolor(0,0,0, 225), false)
        dxDrawText(getWeaponNameFromID(getPedWeapon(localPlayer)).." Skill: "..math.floor(getElementData(localPlayer,waffenskills.weapon)).."/1000", 1209*(x/1440), 176*(y/900), 1430*(x/1440), 208*(y/900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end
end

addEvent("waffenskills.create",true)
addEventHandler("waffenskills.create",root,function(weapon)
	waffenskills.weapon = weapon
	if(waffenskills.state == false)then
		waffenskills.state = true
		addEventHandler("onClientRender",root,waffenskills.render);
		waffenskills.timer = setTimer(function()
			waffenskills.destroy()
		end,5000,1)
		addEventHandler("onClientPlayerWeaponSwitch",root,waffenskills.destroy);
	end
end)

function waffenskills.destroy()
	if(waffenskills.state == true)then
		if(isTimer(waffenskills.timer))then killTimer(waffenskills.timer)end
		waffenskills.state = false
		removeEventHandler("onClientRender",root,waffenskills.render);
		removeEventHandler("onClientPlayerWeaponSwitch",root,waffenskills.destroy);
	end
end