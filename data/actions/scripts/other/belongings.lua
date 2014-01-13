function onUse(cid, item, frompos, item2, topos)
local items = {2237,2232,6577,2220,2227,5894,13508,13926,13925,5879,2114}
local count = {1,1,1,1,1,1,10,10,10,1,1}
present =math.random(#items)

	doSendMagicEffect(getPlayerPosition(cid),27)
	doPlayerAddItem(cid,items[present],count[present])
	doRemoveItem(item.uid,1)
	return true
end