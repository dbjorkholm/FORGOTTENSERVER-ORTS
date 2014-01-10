local mobs =
{
 {x = 32874, y = 32278, z = 15, mob="Massacre"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 50) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end