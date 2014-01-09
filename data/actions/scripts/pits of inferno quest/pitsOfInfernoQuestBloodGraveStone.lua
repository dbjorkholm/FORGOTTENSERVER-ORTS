local newpos = {x = 32791, y = 32332, z = 10}
local splash = {x = 32791, y = 32334, z = 9}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local blood = getTileItemById(splash, 2025)
	if item.actionid == 2023 then
		doSendMagicEffect(getThingPos(cid), CONST_ME_DRAWBLOOD)
		doTeleportThing(cid, newpos)
		doCreatureSay(cid, 'Muahaha..',TALKTYPE_ORANGE_1)
		doSendMagicEffect(newpos, CONST_ME_MORTAREA)
	end
	return true
end