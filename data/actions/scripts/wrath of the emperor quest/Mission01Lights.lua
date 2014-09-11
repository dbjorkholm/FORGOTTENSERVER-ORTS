local function transformLamp(position, itemId, transformId)
	local lampItem = Tile(position):getItemById(itemId)
	if lampItem then
		lampItem:transform(transformId)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3171) then
		if Game.getStorageValue(8018) ~= 1 then
			Game.setStorageValue(8018, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8018, 0)
			local pos = {
				Position(33369, 31075, 8),
				Position(33372, 31075, 8)
			}
			for i = 1, #pos do
				transformLamp(pos[i], 11447, 11446)
				addEvent(transformLamp, 20 * 1000, pos[i], 11446, 11447)
			end
		end
	elseif(item.uid == 3172) then
		if Game.getStorageValue(8019) ~= 1 then
			Game.setStorageValue(8019, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8019, 0)
			local pos = Position(33360, 31079, 8)
			transformLamp(pos, 11449, 11463)
			addEvent(transformLamp, 20 * 1000, pos, 11463, 11449)
		end
	elseif(item.uid == 3173) then
		if Game.getStorageValue(8020) ~= 1 then
			Game.setStorageValue(8020, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8020, 0)
			local pos = Position(33346, 31074, 8)
			transformLamp(pos, 11449, 11463)
			addEvent(transformLamp, 20 * 1000, pos, 11463, 11449)
		end
	elseif(item.uid == 3174) then
		if Game.getStorageValue(8021) ~= 1 then
			Game.setStorageValue(8021, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8021, 0)
			local wallItem, pos
			for i = 1, 4 do
				pos = Position(33355, 31067 + i, 9)
				wallItem = Tile(pos):getItemById(9264)
				if wallItem then
					wallItem:remove()
					addEvent(Game.createItem, 20 * 1000, 9264, 1, pos)
				end
			end
		end
	end
	return true
end