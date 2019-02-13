--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden

	cRegisterLogin
	Last Edit: 13.02.2019
	
]]--

RegisterLogin = {};

function RegisterLogin.load()
	setWeather(9);
	fadeCamera(true);
	setElementData(localPlayer,"loggedin",0);
	setElementData(localPlayer,"savezone",1);
	setElementDimension(localPlayer,0);
	
	setCameraMatrix (-2005.4229736328,193.98599243164,46.244598388672,-2004.8247070313,193.29585266113,45.837471008301);
	smoothMoveCamera(-2005.4229736328,193.98599243164,46.244598388672,-2004.8247070313,193.29585266113,45.837471008301,-1992.9862060547,137.99920654297,33.469501495361,-1992.0090332031,137.99261474609,33.257274627686,7500);
	
	RegisterLogin.sound = playSound("Files/RegisterLogin.mp3");
	
	triggerServerEvent("RegisterLogin.checkAccount",localPlayer);
end
RegisterLogin.load()

addEvent("RegisterLogin.createWindow",true)
addEventHandler("RegisterLogin.createWindow",root,function(type)
	--// GUI-Elements
    BerkshireApocalypse.window[1] = guiCreateWindow(544, 298, 327, 150, "Berkshire Apocalypse", false,"nocross")

    BerkshireApocalypse.label[1] = guiCreateLabel(10, 28, 307, 33, "Your name: "..getPlayerName(localPlayer), false, BerkshireApocalypse.window[1])
    guiSetFont(BerkshireApocalypse.label[1], "default-bold-small")
    guiLabelSetHorizontalAlign(BerkshireApocalypse.label[1], "center", false)
    guiLabelSetVerticalAlign(BerkshireApocalypse.label[1], "center")
    BerkshireApocalypse.label[2] = guiCreateLabel(10, 71, 107, 27, "Password:", false, BerkshireApocalypse.window[1])
    guiSetFont(BerkshireApocalypse.label[2], "default-bold-small")
    guiLabelSetHorizontalAlign(BerkshireApocalypse.label[2], "center", false)
    guiLabelSetVerticalAlign(BerkshireApocalypse.label[2], "center")
    BerkshireApocalypse.button[1] = guiCreateButton(10, 108, 307, 32, type, false, BerkshireApocalypse.window[1])
    guiSetProperty(BerkshireApocalypse.button[1], "NormalTextColour", "FFAAAAAA")
    BerkshireApocalypse.edit[1] = guiCreateEdit(127, 71, 190, 27, "", false, BerkshireApocalypse.window[1])
	setWindowDatas("set");

	addEventHandler("onClientGUIClick",BerkshireApocalypse.button[1],function()
		local password = guiGetText(BerkshireApocalypse.edit[1]);
		if(#password >= 1)then
			triggerServerEvent("RegisterLogin.server",localPlayer,guiGetText(BerkshireApocalypse.button[1]),password);
		end
	end,false)
end)

addEvent("RegisterLogin.destroySound",true)
addEventHandler("RegisterLogin.destroySound",root,function()
	if(isElement(RegisterLogin.sound))then
		destroyElement(RegisterLogin.sound);
	end
end)