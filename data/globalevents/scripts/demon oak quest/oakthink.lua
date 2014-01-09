local demonoak_pos = {x = 32716, y = 32352, z = 7}
local questAreaPosition =
{
	{x = 32706, y = 32345, z = 7, stackpos = 255},
	{x = 32725, y = 32357, z = 7, stackpos = 255}
}

function onThink(interval, lastExecution)
	local list = getSpectators(demonoak_pos, 15, 15, false, true)
	if list and #list > 0 then
		for _, uid in ipairs(list) do
			if isPlayer(uid) and not isInRange(getCreaturePosition(uid), questAreaPosition[1], questAreaPosition[2]) and getCreaturesInQuestArea(TYPE_PLAYER, questAreaPosition[1], questAreaPosition[2], GET_COUNT) == 0 then
				doCreatureSay(uid, sounds[1][math.random(#sounds[1])], TALKTYPE_ORANGE_2, false, uid, demonoak_pos)
			end
		end
	end
 	return true
end