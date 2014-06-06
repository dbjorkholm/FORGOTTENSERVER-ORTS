local specialQuests = {
	[2215] = 2215, -- Annihilator
	[2216] = 9050, -- Dreamer's Challenge Quest Boxes
	[10544] = 10544,
	[26300] = 26300,
	[27300] = 27300,
	[28300] = 28300
}

local questsExperience = {
	[1296] = 80000,
	[9170] = 20000,
	[9050] = 20000
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = specialQuests[item.actionid]
	if not storage then
		storage = item.uid
		if storage > 65535 then
			return false
		end
	end

	local player = Player(cid)
	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The " .. ItemType(item.itemid):getName() .. " is empty.")
		return true
	end

	local targetItem = Item(item.uid)
	local items = {}
	local reward = nil

	local size = targetItem:isContainer() and Container(item.uid):getSize() or 0
	if size == 0 then
		reward = targetItem:clone()
	else
		local container = Container(item.uid)
		for i = 0, container:getSize() - 1 do
			table.insert(items, container:getItem(i):clone())
		end
	end

	size = #items
	if size == 1 then
		reward = items[1]:clone()
	end

	local result = ""
	local weight = 0
	if reward then
		local ret = ItemType(reward:getId())
		if ret:isRune() then
			result = ret:getArticle() .. " " ..  ret:getName() .. " (" .. reward:getSubType() .. " charges)"
		elseif ret:isStackable() and reward:getCount() > 1 then
			result = reward:getCount() .. " " .. ret:getPluralName()
		else
			result = ret:getArticle() .. " " .. ret:getName()
		end
		weight = weight + ret:getWeight(reward:getCount())
	else
		if size > 20 then
			reward = Container(item.itemid, {})
		elseif size > 8 then
			reward = Container(1988, {})
		else
			reward = Container(1987, {})
		end

		for i = 1, size do
		local tmp = items[i]
			if reward:addItemEx(tmp) ~= RETURNVALUE_NOERROR then
				print("[Warning] QuestSystem:", "Could not add quest reward to container")
			else
				local ret = ", "
				if i == size then
					ret = " and "
				elseif i == 1 then
					ret = ""
				end
				
				result = result .. ret
				
				local ret = ItemType(tmp:getId())
				if ret:isRune() then
					result = result .. ret:getArticle() .. " " .. ret:getName() .. " (" .. tmp:getSubType() .. " charges)"
				elseif ret:isStackable() and tmp:getCount() > 1 then
					result = result .. tmp:getCount() .. " " .. ret:getPluralName()
				else
					result = result .. ret:getArticle() .. " " .. ret:getName()
				end
				weight = weight + ret:getWeight(tmp:getCount())
			end
		end
		weight = weight + ItemType(reward:getId()):getWeight()
	end
	
	if player:addItemEx(reward) ~= RETURNVALUE_NOERROR then
		if player:getFreeCapacity() < weight then
			player:sendCancelMessage("You have found " .. result .. " weighing " .. string.format("%.2f", weight) .. " oz. You have no capacity.")
		else
			player:sendCancelMessage("You have found " .. result .. ", but you have no room to take it.")
		end
		return true
	end

	if questsExperience[storage] ~= nil then
		player:addExperience(questsExperience[storage], true)
	end

	player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found " .. result .. ".")
	player:setStorageValue(storage, 1)
	return true
end
