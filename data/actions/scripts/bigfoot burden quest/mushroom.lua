function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local spore = Game.createItem(math.random(18221, 18224), 1, toPosition)
	if spore then
		spore:decay()
	end
	return true
end