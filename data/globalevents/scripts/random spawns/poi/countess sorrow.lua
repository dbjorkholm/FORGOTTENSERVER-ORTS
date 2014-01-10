local mobs =
{
 {x = 32801, y = 32351, z = 15, mob="Countess Sorrow"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 50) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end