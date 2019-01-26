--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

teaminfo = {}

function teaminfo.open()
	if(isElement(GUIEditor.window[1]))then destroyElement(GUIEditor.window[1])end
	
    GUIEditor.window[1] = guiCreateWindow(0.27, 0.37, 0.30, 0.29, "Team", true)

    GUIEditor.tabpanel[1] = guiCreateTabPanel(0.02, 0.12, 0.95, 0.84, true, GUIEditor.window[1])

    GUIEditor.tab[1] = guiCreateTab(language[language.get()][12][1], GUIEditor.tabpanel[1])
    GUIEditor.tab[2] = guiCreateTab(language[language.get()][12][2], GUIEditor.tabpanel[1])    
	
    GUIEditor.label[1] = guiCreateLabel(0.02, 0.05, 0.95, 0.89, "/", true, GUIEditor.tab[1])
	GUIEditor.label[2] = guiCreateLabel(0.02, 0.05, 0.95, 0.89, "/", true, GUIEditor.tab[2])
	
	GUIEditor.set("set",2);
end