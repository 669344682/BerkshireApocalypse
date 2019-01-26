--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

addEvent("spenden.window",true)
addEventHandler("spenden.window",root,function()
	if(GUIEditor.isWindow())then
        GUIEditor.window[1] = guiCreateWindow(0.30, 0.29, 0.35, 0.36, language[language.get()][13][2], true)
		
        GUIEditor.label[1] = guiCreateLabel(0.02, 0.09, 0.96, 0.33, language[language.get()][13][1], true, GUIEditor.window[1])
		
        GUIEditor.label[2] = guiCreateLabel(0.02, 0.45, 0.32, 0.08, "Code 1:", true, GUIEditor.window[1])
        GUIEditor.label[3] = guiCreateLabel(0.02, 0.56, 0.32, 0.08, "Code 2 (optional):", true, GUIEditor.window[1])
        GUIEditor.label[4] = guiCreateLabel(0.02, 0.67, 0.32, 0.08, "Code 3 (optional):", true, GUIEditor.window[1])
		
        GUIEditor.edit[1] = guiCreateEdit(0.36, 0.45, 0.62, 0.08, "", true, GUIEditor.window[1])
        GUIEditor.edit[2] = guiCreateEdit(0.36, 0.56, 0.62, 0.08, "", true, GUIEditor.window[1])
        GUIEditor.edit[3] = guiCreateEdit(0.36, 0.67, 0.62, 0.08, "", true, GUIEditor.window[1])
		
        GUIEditor.button[1] = guiCreateButton(0.02, 0.78, 0.32, 0.08, language[language.get()][13][3], true, GUIEditor.window[1])
        GUIEditor.button[2] = guiCreateButton(0.02, 0.89, 0.32, 0.08, language[language.get()][4][1], true, GUIEditor.window[1])
		
        GUIEditor.label[5] = guiCreateLabel(0.36, 0.78, 0.62, 0.19, language[language.get()][13][4], true, GUIEditor.window[1])
		
		GUIEditor.set("set",5);
		
		addEventHandler("onClientGUIClick",GUIEditor.button[1],function()
			local code1 = guiGetText(GUIEditor.edit[1]);
			local code2 = guiGetText(GUIEditor.edit[2]);
			local code3 = guiGetText(GUIEditor.edit[3]);
			
			if(#code1 >= 1 and #code2 == 0 and #code3 == 0)then
				if(#code1 == 16)then
					if(checkSonderzeichen(code1))then
						triggerServerEvent("spenden.buy",localPlayer,code1,0,0);
					end
				else infobox.create(language[language.get()][13][5],"error")end
			end
			
			if(#code1 >= 1 and #code2 >= 1 and #code3 == 0)then
				if(#code1 == 16 and #code2 == 16)then
					if(checkSonderzeichen(code1) and checkSonderzeichen(code2))then
						triggerServerEvent("spenden.buy",localPlayer,code1,code2,0);
					end
				else infobox.create(language[language.get()][13][6],"error")end
			else end
			
			if(#code1 >= 1 and #code2 >= 1 and #code3 >= 1)then
				if(#code1 == 16 and #code2 == 16 and #code3 == 16)then
					if(checkSonderzeichen(code1) and checkSonderzeichen(code2) and checkSonderzeichen(code3))then
						triggerServerEvent("spenden.buy",localPlayer,code1,code2,code3);
					end
				else infobox.create(language[language.get()][13][6],"error")end
			else end
		end,false)
		
		addEventHandler("onClientGUIClick",GUIEditor.button[2],function()
			GUIEditor.set("reset");
		end,false)
    end
end)