local config = {
	{from = 1, to = 1442, itemid = 2238},
	{from = 1443, to = 2856, itemid = 2237},
	{from = 2857, to = 4262, itemid = 2115},
	{from = 4263, to = 4819, itemid = 2148, count = 6},
	{from = 4820, to = 5325, itemid = 2787},
	{from = 5326, to = 5813, itemid = 5890},
	{from = 5814, to = 6283, itemid = 3976, count = 4},
	{from = 6284, to = 6751, itemid = 2328},
	{from = 6752, to = 7175, itemid = 5899},
	{from = 7176, to = 7576, itemid = 5894},
	{from = 7577, to = 7949, itemid = 10606},	
	{from = 7950, to = 8315, itemid = 2403},
	{from = 8316, to = 8673, itemid = 8859},
	{from = 8674, to = 8972, itemid = 5902},
	{from = 8973, to = 9187},
	{from = 9188, to = 9328, itemid = 2661},
	{from = 9329, to = 9428, itemid = 2199},
	{from = 9429, to = 9515, itemid = 13926},
	{from = 9516, to = 9594, itemid = 2143},
	{from = 9595, to = 9666, itemid = 5879},
	{from = 9667, to = 9732, itemid = 2114},
	{from = 9733, to = 9791, itemid = 13925},
	{from = 9792, to = 9845, itemid = 10563},
	{from = 9846, to = 9891, itemid = 2110},
	{from = 9892, to = 9929, itemid = 5895},
	{from = 9930, to = 9967, itemid = 5880},
	{from = 9968, to = 9998, itemid = 13508},
	{from = 9999, to = 10001, itemid = 2195}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local rand = math.random(10001)
	for i = 1, #config do
		local randomItem = config[i]
		if rand >= randomItem.from and rand <= randomItem.to then
			if randomItem.itemid then
				local itemid, count = randomItem.itemid, randomItem.count or 1
				local itemType = ItemType(itemid)
				Player(cid):addItem(itemid, count)
				doCreatureSayWithRadius(cid, "You found " .. (count > 1 and count or (itemType:getArticle() ~= "" and itemType:getArticle() or "")) .. " " .. (count > 1 and itemType:getPluralName() or itemType:getName()) .. " in the bag.", TALKTYPE_MONSTER_SAY, 2, 2)
			else
				doCreatureSayWithRadius(cid, "You found nothing useful.", TALKTYPE_MONSTER_SAY, 2, 2)
			end
			local targetItem = Item(item.uid)
			targetItem:getPosition():sendMagicEffect(CONST_ME_POFF)
			targetItem:remove()
			break
		end
	end
	return true
end