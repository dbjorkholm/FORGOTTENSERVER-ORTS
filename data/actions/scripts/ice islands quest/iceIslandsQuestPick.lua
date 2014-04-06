local chakoyas = {
	"chakoya toolshaper",
	"chakoya tribewarden",
	"chakoya windcaller"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local iEx = Item(itemEx.uid)
	if itemEx.itemid == 3621 then
		if player:getStorageValue(12026) > 0 and player:getStorageValue(122) < 3  then
			player:setStorageValue(122, player:getStorageValue(122) + 1)
			player:setStorageValue(12026, player:getStorageValue(12026) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			doSummonCreature(chakoyas[math.random(1, 3)], toPosition)
			Position(toPosition):sendMagicEffect(CONST_ME_TELEPORT)
			iEx:transform(7186)
			iEx:decay()
			if player:getStorageValue( 122) >= 3 then
				player:setStorageValue( 121, 4)
				player:setStorageValue( 12026, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			end
		end
	end
	return true
end