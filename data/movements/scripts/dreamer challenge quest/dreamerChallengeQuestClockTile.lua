local words = {
	"YOU ARE DREAMING !",
	"WAKE UP !",
	"TIC TAC",
	"TAC",
	"TIC"
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local pos = player:getPosition() 
	pos.x = pos.x + math.random(-3,3)
	pos.y = pos.y + math.random(-3,3)
	player:say(words[math.random(#words)], TALKTYPE_MONSTER_SAY, false, 0, pos) 
	return true
end
