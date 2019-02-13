--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden
	
	cAdminsystemAllround
	Last Edit: 10.02.2019

]]--

Adminsystem = {
	["Names"] = {
		[0] = "User",
		[1] = "Supporter",
		[2] = "Moderator",
		[3] = "Administrator",
		[4] = "Project Manager",
	},
	["Savezones"] = {
		"San Fierro Railway Station","Chicken Valley",
	},
};

addEvent("Adminsystem.putTeamMembersInATable",true)
addEventHandler("Adminsystem.putTeamMembersInATable",root,function(members)
	if(#members >= 1)then
		Adminsystem.allMembers = {};
		for _,v in pairs(members)do
			table.insert(Adminsystem.allMembers,{v[1],Adminsystem["Names"][v[2]]});
		end
		Adminsystem.openTeamWindow();
	end
end)

function Adminsystem.openTeamWindow()
    BerkshireApocalypse.window[1] = guiCreateWindow(544, 298, 327, 222, "Team", false)

    BerkshireApocalypse.gridlist[1] = guiCreateGridList(10, 26, 307, 186, false, BerkshireApocalypse.window[1])
    usernameGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Username", 0.5)
    adminlevelGridlist = guiGridListAddColumn(BerkshireApocalypse.gridlist[1], "Adminlevel", 0.5)
	setWindowDatas("set");
	
	if(#Adminsystem.allMembers >= 1)then
		for _,v in pairs(Adminsystem.allMembers)do
			local row = guiGridListAddRow(BerkshireApocalypse.gridlist[1]);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,usernameGridlist,v[1],false,false);
			guiGridListSetItemText(BerkshireApocalypse.gridlist[1],row,adminlevelGridlist,v[2],false,false);
		end
	end
end