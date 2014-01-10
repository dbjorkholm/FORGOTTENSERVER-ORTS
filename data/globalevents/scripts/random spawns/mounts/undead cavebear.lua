local mobs =
{
 {x = 31914, y = 32559, z = 10, mob="Undead Cavebear"},
 {x = 31960, y = 32584, z = 10, mob="Undead Cavebear"},
 {x = 31979, y = 32575, z = 10, mob="Undead Cavebear"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 10) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end