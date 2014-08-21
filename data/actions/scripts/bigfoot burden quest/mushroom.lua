function onUse(cid, item, fromPosition, itemEx, toPosition)
	local spore = Game.createItem(math.random(18221, 18224), 1, toPosition)
	if spore then
		spore:decay()
	end
	return true
end