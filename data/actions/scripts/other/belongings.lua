function onUse(cid, item, frompos, item2, topos)
	local p = Player(cid)
	local i = Item(item.uid)
	local items = {2237,2232,6577,2220,2227,5894,13508,13926,13925,5879,2114}
	local count = {1,1,1,1,1,1,10,10,10,1,1}
	local present = math.random(#items)

	p:getPosition():sendMagicEffect(27)
	p:addItem(items[present],count[present])
	i:remove(1)
return true
end
