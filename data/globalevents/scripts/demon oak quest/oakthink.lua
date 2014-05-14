local demonOak_pos = {x = 32716, y = 32352, z = 7}
local questAreaPosition =
{
	{x = 32706, y = 32345, z = 7, stackpos = 255},
	{x = 32725, y = 32357, z = 7, stackpos = 255}
}

function onThink(interval, lastExecution)
	local specs = Game.getSpectators(demonOak_pos, false, true, 0, 15, 0, 15)
	for i = 1, #specs do
		if isInRange(specs[i]:getPosition(), questAreaPosition[1], questAreaPosition[2]) then
			return true
		end
		specs[i]:say(sounds[1][math.random(#sounds[1])], TALKTYPE_ORANGE_2, false, 0, demonOak_pos)
	end
 	return true
end