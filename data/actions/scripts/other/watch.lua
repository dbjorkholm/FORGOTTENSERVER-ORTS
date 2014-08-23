function onUse(cid, item, fromPosition, itemEx, toPosition)
	Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, "The time is " .. getTibianTime() .. ".")
	return true
end
