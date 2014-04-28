local boss = {
	["snake god essence"] = {
		text = "IT'S NOT THAT EASY MORTALS! FEEL THE POWER OF THE GOD!",
		newForm = "snake thing"
	},
	["snake thing"] = {
		text = "NOOO! NOW YOU HERETICS WILL FACE MY GODLY WRATH!",
		newForm = "lizard abomination"
	},
	["lizard abomination"] = {
		text = "YOU ... WILL ... PAY WITH ETERNITY ... OF AGONY!",
		newForm = "mutated zalamon"
	}
}

function onKill(cid, target)
	local monster = Monster(target)
	bossTmp = boss[string.lower(monster:getName())]	
	if monster then
		if bossTmp then
			Game.createMonster(bossTmp.newForm, monster:getPosition())
			Player(cid):say(bossTmp.text, TALKTYPE_ORANGE_1)
		end
	end
	return true
end