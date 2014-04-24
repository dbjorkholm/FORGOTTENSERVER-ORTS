dofile('data/lib/SvargrondArenaQuest.lua')

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if(getPlayerStorageValue(cid, STORAGE_ARENA) < 0) then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Nothing here.")
	end
	
	for i = 1 , 3 do
		local arena = getPlayerStorageValue(cid, STORAGE_ARENA) - i
		if ARENA[arena].reward[item.uid] then
			local reward = ARENA[arena].reward[item.uid]
			if getPlayerStorageValue(cid, ARENA[arena].reward.storage) > 0 then
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's empty.")
			end
	 
			if reward.container then
				local cont = doPlayerAddItem(cid, reward.id, 1)
				for i = 1, table.maxn(reward.inside) do
					doAddContainerItem(cont, reward.inside[i][1], reward.inside[i][2])
				end
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. getItemName(reward.id) .. ".")
				setPlayerStorageValue(cid, ARENA[arena].reward.storage, 1)
				doPlayerAddExp(cid, 5000, true, true)
				return true
			else
				doPlayerAddItem(cid, reward.id[1], reward.id[2])
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. (reward.id[2] < 2 and "x" .. reward.id[2]) .. " " .. getItemName(reward.id[1]) .. ".")
				setPlayerStorageValue(cid, ARENA[arena].reward.storage, 1)
				doPlayerAddExp(cid, 5000, true, true)
				return true
			end
		end
	end
	return true
end