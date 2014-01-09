function onUse(cid, item, fromPosition, itemEx, toPosition)
	doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
	doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
	doCreatureSay(cid, "You feel very refreshed and relaxed.", TALKTYPE_ORANGE_1)
	return true
end