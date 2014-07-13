local reward = {
	[3148] = {
		{18501, 1},
		{18502, 1},
		{18503, 1},
		{18402, 1},
		{18396, 1},
		{2160, 3},
		{18415, 7},
		{18423, 2},
	},
	[3149] = {
		{18407, 1},
		{18505, 1},
		{18506, 1},
		{18507, 1},
		{18396, 1},
		{2160, 4},
		{18413, 10},
		{18423, 2},
	},
	[3150] = {
		{18500, 1},
		{18501, 1},
		{18502, 1},
		{18408, 1},
		{18396, 1},
		{2160, 5},
		{18414, 12},
		{18423, 2},
	},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	tmpTable = {}
	local player = Player(cid)
	if(item.uid == 3147) then
		if(player:getStorageValue(954) == 4) then
			player:setStorageValue(954, 5)
			player:addItem(2137, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found some golden fruits.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3148) then
		if(player:getStorageValue(958) == 1) then
			player:setStorageValue(958, 0)
			while(tmpTable[1] ~= tmpTable[2]) do
				tmpTable[1] = math.random(#reward[item.uid])
				tmpTable[2] = math.random(#reward[item.uid])
			end
			for i = 1, #reward[item.uid] do
				if(not(isInArray(tmpTable, i))) then
					player:addItem(reward[item.uid][1], reward[item.uid][2])
				end
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a reward for defeating Warzone 1.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3149) then
		if(player:getStorageValue(959) == 1) then
			while(tmpTable[1] ~= tmpTable[2]) do
				tmpTable[1] = math.random(#reward[item.uid])
				tmpTable[2] = math.random(#reward[item.uid])
			end
			for i = 1, #reward[item.uid] do
				if(not(isInArray(tmpTable, i))) then
					player:addItem(reward[item.uid][1], reward[item.uid][2])
				end
			end
			player:setStorageValue(959, 0)
			player:addItem(2493, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a reward for defeating Warzone 2.")
			if(math.random(25) == 1) then
				player:addItem(16619, 1)
			end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3150) then
		if(player:setStorageValue(960) == 1) then
			while(tmpTable[1] ~= tmpTable[2]) do
				tmpTable[1] = math.random(#reward[item.uid])
				tmpTable[2] = math.random(#reward[item.uid])
			end
			for i = 1, #reward[item.uid] do
				if(not(isInArray(tmpTable, i))) then
					player:addItem(reward[item.uid][1], reward[item.uid][2])
				end
			end
			player:setStorageValue(960, 0)
			player:addItem(2493, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a reward for defeating Warzone 3.")
		else
			player:sendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end