local mobs =
{
 {x = 33188, y = 31241, z = 7, mob="Draptor"},
 {x = 33219, y = 31222, z = 7, mob="Draptor"},
 {x = 33234, y = 31184, z = 7, mob="Draptor"},
 {x = 33330, y = 31189, z = 7, mob="Draptor"},
 {x = 33254, y = 31161, z = 7, mob="Draptor"},
 {x = 33293, y = 31255, z = 7, mob="Draptor"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	if(math.random(1, 1000) < 100) then
		local monster = mobs[math.random(1, #mobs)]
		if(type(doSummonCreature(monster.mob, {x=monster.x, y=monster.y, z=monster.z})) == "number") then
		end
	end
	return true
end