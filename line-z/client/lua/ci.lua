--[[
--------------------------------------------------------------------
--Create the GuiText
--------------------------------------------------------------------
]]
screenWidth, screenHeight = guiGetScreenSize()
endPos = screenHeight-screenHeight/6
startPos = 0
stopScroll = false
moveValueaa = 5
tickCountaa = 400
theText = "-"
theHead = "-"
textHeight = dxGetFontHeight(2,"default-bold")


function displayClientInfo(head, texta, r, g, b )
startPos = 0
stopScroll = false
moveValueaa = 5
tickCountaa = 400
theTexta = texta
theHead = head
red,gree,blue = r,g,b
rezise = dxGetTextWidth(string.gsub(theTexta, '#%x%x%x%x%x%x', ''),1.5,"default-bold")
removeEventHandler("onClientRender", getRootElement(),drawInfoBox)
addEventHandler("onClientRender", getRootElement(),drawInfoBox)
end
addEvent("displayClientInfo", true)
addEventHandler("displayClientInfo", getLocalPlayer(), displayClientInfo)



--Draw Part
function drawInfoBox()
		startPos = startPos+moveValueaa
	if screenHeight-startPos <= endPos then
		moveValueaa = 0
		tickCountaa = tickCountaa-2
		if tickCountaa <= 0 then
			moveValueaa = -5
		end
	end
	if screenHeight-startPos >= screenHeight+100 and moveValueaa == -5 then
		removeEventHandler("onClientRender", getRootElement(),drawInfoBox)
	end
	dxDrawRectangle ( screenWidth/2-(rezise/2)-screenWidth/20,screenHeight-startPos,rezise +(screenWidth/20*2),screenHeight/6, tocolor ( red,gree,blue, 210) )
	dxDrawImage(screenWidth/2-(rezise/2)-screenWidth/20-4,screenHeight-startPos,rezise +(screenWidth/20*2)+8,screenHeight/6,"client/image/tools/c_info/rand.png", 0,0,0,tocolor(255,255,255,210), false)
	dxDrawingColorText(theHead,screenWidth/2,screenHeight-startPos,screenWidth/2,screenHeight-startPos+textHeight*1.5, tocolor(255,255,255,230), 230, 2, "default-bold", "center", "bottom", false, false, false )
	dxDrawingColorText(theTexta,screenWidth/2,screenHeight-startPos+screenHeight/16,screenWidth/2,screenHeight-startPos+textHeight+screenHeight/16, tocolor(255,255,255,230), 230, 1.4, "default-bold", "center", "bottom", false, false, false )
end
