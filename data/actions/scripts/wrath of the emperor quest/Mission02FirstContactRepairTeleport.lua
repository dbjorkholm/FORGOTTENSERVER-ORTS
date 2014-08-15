local function revertWater(position)
	Tile(position):getItemById(11030):transform(11450)
end


function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	-- Rake
	if item.itemid == 2549 then
		if itemEx.itemid == 12322 then
			player:addItem(12285, 1)
			player:say("You dig out a handful of ordinary clay.", TALKTYPE_MONSTER_SAY)
		end
	-- clay with the sacred earth
	elseif (item.itemid == 12285 and itemEx.itemid == 12297) or (item.itemid == 12297 and itemEx.itemid == 12285) then
		player:say("You carefully mix the clay with the sacred earth.", TALKTYPE_MONSTER_SAY)
		Item(item.uid):remove()
		Item(itemEx.uid):remove()
		player:addItem(12300, 1)
	-- sacred clay
	elseif item.itemid == 12300 and itemEx.itemid == 12287 then
		player:say("You carefully coat the inside of the wooden bowl with the sacred clay.", TALKTYPE_MONSTER_SAY)
		Item(itemEx.uid):remove()
		Item(item.uid):transform(12303)
	-- sacred bowl of purification
	elseif item.itemid == 12303 and itemEx.itemid == 11450 then 
		player:say("Filling the corrupted water into the sacred bowl completly purifies the fluid.", TALKTYPE_MONSTER_SAY)
		Item(item.uid):transform(12289)
	-- bowl with sacred water
	elseif item.itemid == 12289 and itemEx.itemid == 12301 then
		Item(item.uid):transform(12290)
		toPosition:sendMagicEffect(CONST_ME_POFF)
	-- sacred coal
	elseif item.itemid == 12290 and itemEx.actionid == 8025 then
		player:say("As you give the coal into the pool the corrupted fluid begins to dissolve, leaving purified, refreshing water.", TALKTYPE_MONSTER_SAY)
		Item(item.uid):remove()
		if player:getStorageValue(Storage.WrathoftheEmperor.Questline) == 4 then
			player:setStorageValue(Storage.WrathoftheEmperor.Questline, 5)
			player:setStorageValue(Storage.WrathoftheEmperor.Mission02, 2) --Questlog, Wrath of the Emperor "Mission 02: First Contact"
		end 
		local pos = {
			Position({x = 33282, y = 31036, z = 10}),
			Position({x = 33282, y = 31037, z = 10}),
			Position({x = 33283, y = 31037, z = 10}),
			Position({x = 33283, y = 31036, z = 10}),
			Position({x = 33283, y = 31038, z = 10}),
			Position({x = 33283, y = 31035, z = 10})
		}
		for i = 1, 4 do
			pos[i]:sendMagicEffect(CONST_ME_GREEN_RINGS)
		end
		for i = 1, 6 do
			Tile(pos[i]):getItemById(11450):transform(11030)
			doTransformItem(getTileItemById(pos[i], 11450).uid, 11030)
			addEvent(revertWater, 60 * 1000, pos[i])
		end
	end
	return true
end