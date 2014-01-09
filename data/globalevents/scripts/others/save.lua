local function executeSave1(save1)
	addEvent(executeSave, 1*1000, save)
	broadcastMessage("The server is now saving, please be patient.", MESSAGE_EVENT_ADVANCE)
end

local function executeSave(save)
	saveServer()
end

function onThink(interval)
	broadcastMessage("Server save within 30 seconds, please mind it may freeze!", MESSAGE_EVENT_ADVANCE)
	addEvent(executeSave1, 30*1000, save1)
	return true
end




