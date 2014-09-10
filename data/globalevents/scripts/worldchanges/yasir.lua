local config = {
	[1] = { -- Ankrahmun
		removeItems = {
			{position = Position(33096, 32882, 6), itemId = 4978},
			{position = Position(33096, 32883, 6), itemId = 4978},
			{position = Position(33096, 32883, 6), itemId = 4922},
			{position = Position(33096, 32884, 6), itemId = 4922},
			{position = Position(33096, 32885, 6), itemId = 4922}
		},
		fromPosition = {x = 33099, y = 32875, z = 7},
		toPosition = {x = 33106, y = 32893, z = 7},
		mapName = 'ankrahmun',
		yasirPosition = Position(33102, 32884, 6)
	},
	[2] = { -- Carlin
		removeItems = {
			{position = Position(32393, 31814, 6), itemId = 10408},
			{position = Position(32393, 31815, 6), itemId = 10408},
			{position = Position(32393, 31816, 6), itemId = 10408}
		},
		fromPosition = {x = 32397, y = 31806, z = 7},
		toPosition = {x = 32403, y = 31824, z = 7},
		mapName = 'carlin',
		yasirPosition = Position(32400, 31815, 6)
	},
	[3] = { -- Liberty Bay
		fromPosition = {x = 32311, y = 32884, z = 1},
		toPosition = {x = 32318, y = 32904, z = 7},
		mapName = 'libertybay',
		yasirPosition = Position(32314, 32895, 6)
	}
}

local groundIds = {
	1284, 4608, 4609, 4610, 4611,
	4612, 4613, 4614, 4615, 4616,
	4617, 4618, 4619, 4651, 4665,
	4666, 4972, 5768, 5769, 8284,
	9067
}

local itemIds = {
	1277, 1386, 2038, 2067, 2226, 2240, 2253, 2585,
	2667, 3587, 3589, 3591, 3602, 3759, 3760, 3781,
	3877, 3878, 3879, 3880, 3881, 3978, 3979, 3980,
	4403, 4609, 4883, 4884, 4885, 4887, 4888, 4889,
	4890, 4891, 4893, 4894, 4895, 4896, 4906, 4907,
	4908, 4909, 4910, 4911, 4912, 4919, 4922, 4923,
	4924, 4927, 4928, 4929, 4931, 4932, 4942, 4943,
	4944, 4947, 4948, 4949, 4950, 4954, 4955, 4956,
	4957, 4962, 4963, 4966, 4967, 4975, 4977, 4978,
	4988, 4990, 4998, 5003, 5004, 5555, 5556, 5485,
	5486, 5487, 5488, 5491, 5492, 5493
}

local yasirEnabled = true
local yasirChance = 33

local function spawnYasir(position)
	local npc = Game.createNpc('Yasir', position)
	if npc then
		npc:setMasterPos(position)
	end
end

function onStartup()
	if yasirEnabled then
		math.randomseed(os.time())
		if math.random(100) <= yasirChance then
			local randTown = config[math.random(#config)]
			local tile, topTopItem, topDownItem, topVisibleThing, ground
			for x = randTown.fromPosition.x, randTown.toPosition.x do
				for y = randTown.fromPosition.y, randTown.toPosition.y do
					for z = randTown.fromPosition.z, randTown.toPosition.z do
						tile = Tile(Position(x, y, z))
						if tile then
							topDownItem = tile:getTopDownItem()
							if topDownItem and isInArray(itemIds, topDownItem:getId()) then
								topDownItem:remove()
							end

							topTopItem = tile:getTopTopItem()
							if topTopItem and isInArray(itemIds, topTopItem:getId()) then
								topTopItem:remove()
							end

							topVisibleThing = tile:getTopVisibleThing()
							if topVisibleThing and isInArray(itemIds, topVisibleThing:getId()) then
								topVisibleThing:remove()
							end

							ground = tile:getGround()
							if ground and isInArray(groundIds, ground:getId()) then
								ground:remove()
							end
						end
					end
				end
			end

			if randTown.removeItems then
				for i = 1, #randTown.removeItems do
					tile = Tile(randTown.removeItems[i].position):getItemById(randTown.removeItems[i].itemId)
					if tile then
						tile:remove()
					end
				end
			end

			Game.loadMap('data/world/yasir/' .. randTown.mapName .. '.otbm')
			addEvent(spawnYasir, 5000, randTown.yasirPosition)
		end
	end
end
