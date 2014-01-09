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
	bossTmp = boss[string.lower(getCreatureName(target))]
	if(bossTmp) then	
		doSummonCreature(bossTmp.newForm, getCreaturePosition(target))
		doCreatureSay(cid, bossTmp.text, TALKTYPE_ORANGE_1) 
	end
	return true
end