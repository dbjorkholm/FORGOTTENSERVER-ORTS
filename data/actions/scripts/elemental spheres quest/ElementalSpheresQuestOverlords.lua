local time = 10

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pos = getThingPos(itemEx.uid)
	if(itemEx.itemid == 8572) then
		doTransformItem(itemEx.uid, 8576)
		doSendMagicEffect(toPosition, CONST_ME_BIGPLANTS)
		addEvent(Reset, time*1000, pos)
	end
	return true
end

local function Reset(pos)
	if (pos.itemid == 8576) then
		doTransformItem(pos, 8572)
	end
	return true
end
		
		