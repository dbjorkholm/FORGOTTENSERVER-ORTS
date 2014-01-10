local mobs =
{
 {x = 32109, y = 32783, z = 12, mob="Crustacea Gigantica"},
 {x = 32111, y = 32739, z = 12, mob="Crustacea Gigantica"},
 {x = 32183, y = 32938, z = 9, mob="Crustacea Gigantica"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 400) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end