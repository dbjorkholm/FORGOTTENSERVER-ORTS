local config = {
	[9172] = {9172, 18394, {{18402, 1}, {18414, 12}, {18396, 1}, {18500, 1}, {2160, 5}, {18423, 2}}, 20 * 60 * 60},
	[9173] = {9173, 18393, {{18402, 1}, {18415, 7}, {18396, 1}, {18504, 1}, {2160, 3}, {18423, 2}}, 20 * 60 * 60},
	[9174] = {9174, 18394, {{18402, 1}, {18413, 10}, {18396, 1}, {18508, 1}, {2160, 4}, {18423, 2}}, 20 * 60 * 60}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[item.uid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) > os.time() then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
		return true
	end
	
	local container = player:addItem(targetItem[2])
	for i = 1, #targetItem[3] do
		container:addItem(targetItem[3][i][1], targetItem[3][i][2])
	end
	player:setStorageValue(targetItem[1], os.time() + targetItem[4])
	local itemType = ItemType(backpack:getId())
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("You have found %s %s.", itemType:getArticle(), itemType:getName()))
	return true
end