local function bloom()
	if(math.random(1, 7) == 1) then
		timeChange = math.random(2, 6)
		doTransformItem(getTileItemById({x = 32024, y = 32830, z = 4}, 5687).uid, 5659)
		doSendMagicEffect({x = 32024, y = 32830, z = 4}, CONST_ME_MAGIC_RED)
		addEvent(doTransformItem, timeChange * 60 * 60 * 1000, getTileItemById({x = 32024, y = 32830, z = 4}, 5659).uid, 5687)
		return addEvent(bloom, timeChange * 60 * 60 * 1000)
	else
		return addEvent(bloom, 60 * 60 * 1000)
	end
end

function onStartup()
	bloom()
	return true
end
