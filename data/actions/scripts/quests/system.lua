local specialQuests = {
        [2215] = 2215 --New quest
}

local questsExperience = {
        [100000] = 2215
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local storage = specialQuests[item.actionid]
	if(not storage) then
		storage = item.uid
		if(storage > 65535) then
			return false
		end
	end

	if(item.uid == 1296) then --behemoth quest
		if (getPlayerStorageValue(cid, 9244) < 1) then
			doPlayerAddExp(cid, 80000, true, true)
			setPlayerStorageValue(cid,9244, 1) 
		end
	end
 
	if(getPlayerStorageValue(cid, storage) > 0) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The " .. getItemName(item.itemid) .. " is empty.")
		return true
	end

	if(item.actionid == 2215 
		if (getPlayerStorageValue(cid, 2215) < 1) then --anni
	 		doPlayerAddExp(cid, 100000, true, true)
	 		setPlayerStorageValue(cid,2215, 1) 
		end
	end
	if(item.uid == 9170 
		if getPlayerStorageValue(cid, 9170) < 1) then --banshee
			doPlayerAddExp(cid, 20000, true, true)
			setPlayerStorageValue(cid,9170, 1) 
		end
	end
	if(item.uid == 9050 or item.uniqueid == 9051 or item.uniqueid == 9052 or item.uniqueid == 9053) then --dream challenge q
		if (getPlayerStorageValue(cid, 9050) < 1 or getPlayerStorageValue(cid, 9051) < 1 or getPlayerStorageValue(cid, 9052) < 1 or getPlayerStorageValue(cid, 9053) < 1) then
				if getPlayerStorageValue(cid, 3145) < 1) then --dream challenge
					doPlayerAddExp(cid, 20000, true, true)
					setPlayerStorageValue(cid,3145, 1)
				end
		end
	end
 
	local items = {}
	local reward = 0
 
	local size = isContainer(item.uid) and getContainerSize(item.uid) or 0
	if(size == 0) then
		reward = doCopyItem(item, false)
	else
		for i = 0, size do
			local tmp = getContainerItem(item.uid, i)
			if(tmp.itemid > 0) then
				table.insert(items, tmp)
			end
		end
	end
 
	size = table.maxn(items)
	if(size == 1) then
		reward = doCopyItem(items[1], true)
	end
 
	local result = ""
	if(reward ~= 0) then
		local ret = getItemDescriptions(reward.itemid)
		if(reward.type > 1 and isItemRune(reward.itemid)) then
			result = reward.type .. " charges " .. ret.name
		elseif(reward.type > 1 and isItemStackable(reward.itemid)) then
			result = reward.type .. " " .. ret.plural
		else
			result = ret.article .. " " .. ret.name
		end
	else
		if(size > 20) then
			reward = doCopyItem(item, false)
		elseif(size > 8) then
			reward = getThing(doCreateItemEx(1988, 1))
		else
			reward = getThing(doCreateItemEx(1987, 1))
		end
 
		for i = 1, size do
			local tmp = doCopyItem(items[i], true)
			if(doAddContainerItemEx(reward.uid, tmp.uid) ~= RETURNVALUE_NOERROR) then
				print("[Warning] QuestSystem:", "Could not add quest reward")
			else
				local ret = ", "
				if(i == 2) then
					ret = " and "
				elseif(i == 1) then
					ret = ""
				end
 
				result = result .. ret
				ret = getItemDescriptions(tmp.itemid)
				if(tmp.type > 1 and isItemRune(tmp.itemid)) then
					result = result .. tmp.type .. " charges " .. ret.name
				elseif(tmp.type > 1 and isItemStackable(tmp.itemid)) then
					result = result .. tmp.type .. " " .. ret.plural
				else
					result = result .. ret.article .. " " .. ret.name
				end
			end
		end
	end
 
	if(doPlayerAddItemEx(cid, reward.uid, false) ~= RETURNVALUE_NOERROR) then
		if getPlayerFreeCap(cid) < getItemWeightByUID(reward.uid) then
			result = "You have found " .. result .. " weighing " .. string.format("%.2f", getItemWeightByUID(reward.uid)) .. " oz. You have no capacity."
		else
			result = "You have found " .. result .. ", but you have no room to take it."
		end
	else
		result = "You have found " .. result .. "."
		setPlayerStorageValue(cid, storage, 1)
	end
 
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, result)
	return true
end
