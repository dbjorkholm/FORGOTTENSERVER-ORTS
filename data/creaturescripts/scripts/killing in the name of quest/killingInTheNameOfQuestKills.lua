dofile('data/lib/killingInTheNameOfQuest.lua')

function onKill(cid, target, lastHit)
	local started = getPlayerStartedTasks(cid)
	if isPlayer(target) or isSummon(target) then return true end
	if started and #started > 0 then
		for _, id in ipairs(started) do
			if isInArray(tasks[id].creatures, getCreatureName(target):lower()) then
				if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + id) < 0 then
					setPlayerStorageValue(cid, KILLSSTORAGE_BASE + id, 0)
				end
				if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + id) < tasks[id].killsRequired then
					setPlayerStorageValue(cid, KILLSSTORAGE_BASE + id, getPlayerStorageValue(cid, KILLSSTORAGE_BASE + id) + 1)
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, getPlayerStorageValue(cid, KILLSSTORAGE_BASE + id) .. "/" .. tasks[id].killsRequired .. " " .. tasks[id].raceName .. " already killed.")
				end
			end
		end
	end
	return true
end