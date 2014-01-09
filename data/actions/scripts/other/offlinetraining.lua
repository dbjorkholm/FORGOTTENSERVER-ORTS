local statue = {
	[18488] = SKILL_SWORD,
	[18489] = SKILL_AXE,
	[18490] = SKILL_CLUB,
	[18491] = SKILL_DISTANCE,
	[18492] = SKILL_MAGLEVEL
	}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local premiumDays = getPlayerPremiumDays(cid)

	if (isPlayerPzLocked(cid)) then
		return false
	end
 
	if (isPremium(cid)) then
		doPlayerSetOfflineTrainingSkill(cid, statue[item.itemid])
		doRemoveCreature(cid)
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)
	end
	return true
end