function onUse(cid, item, fromPosition, itemEx, toPosition)
local self = Player(cid)
	if self:getStorageValue(994) == 1 then
		if itemEx.actionid == 986 then
			doRemoveItem(item.uid)
			doSendMagicEffect(toPosition, CONST_ME_HITAREA)
			self:setStorageValue(996, self:getStorageValue(996) + math.random(1,5))
			if math.random(1, 100) < self:getStorageValue(996) then
				self:setStorageValue(994,2)
				self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "*clonk*")
				return true
			end
			self:sendTextMessage(MESSAGE_INFO_DESCR, "You place the heavy crate of coral on top of the other crates.")
			return true
		end
	end
return false
end
