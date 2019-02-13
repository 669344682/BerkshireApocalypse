--[[

	Berkshire Apocalypse
	2018 - 2019
	© Xendom Rayden

	sSavezone
	Last Edit: 11.02.2019
	
]]--

Savezones = {
	-- x, y, width, height
	{-2003.8505859375,76.118301391602,60,135}, -- San Fierro
	{-250.89590454102,2706.7004394531,60,40}, -- Chicken Valley
};

for _,v in pairs(Savezones)do
	local savezoneArea = createColRectangle(v[1],v[2],v[3],v[4]);
	createRadarArea(v[1],v[2],v[3],v[4],0,255,0,100,root);
	
	addEventHandler("onColShapeHit",savezoneArea,function(hitElement)
		setElementData(hitElement,"savezone",1);
		if(getElementData(hitElement,"zombie") and getElementData(hitElement,"zombie") == true)then
			killPed(hitElement);
		end
	end)
	
	addEventHandler("onColShapeLeave",savezoneArea,function(hitElement)
		setElementData(hitElement,"savezone",0);
	end)
end