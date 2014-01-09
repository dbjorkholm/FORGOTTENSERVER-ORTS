function onStepIn(cid, item, position, lastPosition)
	if(string.lower(getCreatureName(cid)) == "mushroom sniffer") then
		chance = math.random(1, 3)
		if(getTileItemById(position, 18340).uid > 0 and getTileItemById(position, 18340).actionid ~= 100) then
			if(chance < 3) then
				doSendMagicEffect(position, CONST_ME_POFF)
				doTransformItem(getTileItemById(position, 18340).uid, 18218)
				addEvent(doTransformItem, 40 * 1000, getTileItemById(position, 18218).uid, 18340)
			elseif(chance == 3) then
				doTransformItem(getTileItemById(position, 18340).uid, 18341)
				doSendMagicEffect(position, CONST_ME_GROUNDSHAKER)
			end
		end
	end
	return true
end
