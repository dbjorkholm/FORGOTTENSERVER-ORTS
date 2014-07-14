local demonOakPosition = Position(32716, 32352, 7)
local questAreaPosition =
{
	{x = 32706, y = 32345, z = 7, stackpos = 255},
	{x = 32725, y = 32357, z = 7, stackpos = 255}
}
local sounds = {
	'Release me and you will be rewarded greatefully!',
	'What is this? Demon Legs lying here? Someone might have lost them!',
	'I\'m trapped, come here and free me fast!!',
	'I can bring your beloved back from the dead, just release me!',
	'What a nice shiny golden armor. Come to me and you can have it!',
	'Find a way in here and release me! Pleeeease hurry!',
	'You can have my demon set, if you help me get out of here!'
}

function onThink(interval, lastExecution)
	local specs = Game.getSpectators(demonOakPosition, false, true, 0, 15, 0, 15)
	for i = 1, #specs do
		if isInRange(specs[i]:getPosition(), questAreaPosition[1], questAreaPosition[2]) then
			return true
		end
		specs[i]:say(sounds[math.random(#sounds)], TALKTYPE_MONSTER_YELL, false, 0, demonOakPosition)
	end
	return true
end