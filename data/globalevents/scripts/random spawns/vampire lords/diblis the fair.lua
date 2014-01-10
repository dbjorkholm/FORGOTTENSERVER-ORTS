local mobs =
{
 {x = 32009, y = 32795, z = 10, mob="Diblis The Fair"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 50) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end