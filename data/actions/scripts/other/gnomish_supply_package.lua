local config = {
	{from = 1, to = 1440, itemid = 2787, count = 20},
	{from = 1441, to = 2434, itemid = 18397},
	{from = 2435, to = 3270, itemid = 18437, count = 15},
	{from = 3271, to = 4085, itemid = 18304, count = 15},
	{from = 4086, to = 4836, itemid = 18457},
	{from = 4837, to = 5447, itemid = 7588, count = 2},
	{from = 5448, to = 6047, itemid = 7589, count = 2},
	{from = 6048, to = 6576, itemid = 7618, count = 4},
	{from = 6577, to = 7094, itemid = 7620, count = 4},
	{from = 7095, to = 7559, itemid = 7590},
	{from = 7560, to = 7963, itemid = 7591},
	{from = 7964, to = 8317, itemid = 7443},
	{from = 8318, to = 8628, itemid = 7439},
	{from = 8629, to = 8932, itemid = 2152, count = 5},
	{from = 8933, to = 9232, itemid = 5911},
	{from = 9233, to = 9511, itemid = 7440},
	{from = 9512, to = 9636, itemid = 18455},
	{from = 9637, to = 9747, itemid = 18522},
	{from = 9748, to = 9836, itemid = 18519},
	{from = 9837, to = 9893, itemid = 2160},
	{from = 9894, to = 9929, itemid = 2156},
	{from = 9930, to = 9958, itemid = 18509},
	{from = 9959, to = 9987, itemid = 2154},
	{from = 9988, to = 9994, itemid = 2158},
	{from = 9995, to = 10001, itemid = 2155}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local rand = math.random(10001)
	for i = 1, #config do
		local randomItem = config[i]
		if rand >= randomItem.from and rand <= randomItem.to then
			Player(cid):addItem(randomItem.itemid, randomItem.count or 1)
			local targetItem = Item(item.uid)
			targetItem:getPosition():sendMagicEffect(CONST_ME_CRAPS)
			targetItem:remove(1)
			break
		end
	end
	return true
end
