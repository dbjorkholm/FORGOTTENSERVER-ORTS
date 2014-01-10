local mobs =
{
 {x = 31948, y = 32572, z = 10, mob="Necropharus"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 5) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end