local mobs =
{
 {x = 32837, y = 32700, z = 7, mob="Midnight Panther"},
 {x = 32851, y = 32745, z = 7, mob="Midnight Panther"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 100) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end