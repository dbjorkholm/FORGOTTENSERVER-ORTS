function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid ~= 4207 then
		return false
	end

	if player:getStorageValue(Storage.TibiaTales.TheExterminator) ~= 1 then
		return false
	end

	player:setStorageValue(Storage.TibiaTales.TheExterminator, 2)
	Item(item.uid):transform(2006, 0)
	toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
	return true
end
