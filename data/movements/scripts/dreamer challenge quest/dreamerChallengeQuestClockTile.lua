local words = {"YOU ARE DREAMING !","WAKE UP !", "TIC TAC", "TAC", "TIC"}
function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid)) then
        	local pos = getThingPos(cid) 
		pos.x = pos.x + math.random(-3,3)
		pos.y = pos.y + math.random(-3,3)
		doCreatureSay(cid, words[math.random(#words)], TALKTYPE_ORANGE_1, false, 0, pos)
	end 
	return true
end