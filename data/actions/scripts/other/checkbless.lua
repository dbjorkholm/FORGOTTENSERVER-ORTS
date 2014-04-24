function onUse(cid, item, fromPosition, itemEx, toPosition)
	local str = {"\nWisdom of Solitude", "\nSpark of the Phoenix", "\nFire of the Suns", "\nSpiritual Shielding", "\nEmbrace of Tibia", "\nTwist of Fate"}
	local result = "Received blessings:"
	local p = Player(cid)
	for i = 1, 6 do
		result = p:hasBlessing(i) and result .. str[i] or result
	end
	
	p:sendTextMessage(MESSAGE_EVENT_ADVANCE, 20 > result:len() and "No blessings received." or result)
return true
end
