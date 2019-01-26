--[[

	Berkshire Apocalypse
	2018
	© Xendom Rayden

]]--

savezone = { -- x,y,width,height
	{-2003.8505859375,76.118301391602,60,135},}
	
function savezone.load()
	for _,v in ipairs(savezone)do
		savezone.radar = createColRectangle(v[1],v[2],v[3],v[4]);
		createRadarArea(v[1],v[2],v[3],v[4],0,255,0,100,root);
		
		addEventHandler("onColShapeHit",savezone.radar,function(hitElement)
			if(isElement(hitElement))then
				setElementData(hitElement,"savezone",1);
				if(getElementData(hitElement,"zombie") and getElementData(hitElement,"zombie") == true)then
					killPed(hitElement);
				end
			end
		end)
		
		addEventHandler("onColShapeLeave",savezone.radar,function(hitElement)
			setElementData(hitElement,"savezone",0);
		end)
	end
end
savezone.load()