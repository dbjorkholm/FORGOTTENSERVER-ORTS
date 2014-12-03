-- create sugar oat --
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 5467 then
		return false
	end

	Item(item.uid):remove(1)
	Player(cid):removeItem(5467, 1)
	Player(cid):addItem(13939, 1)
	return true
end