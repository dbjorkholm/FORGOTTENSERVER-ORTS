function revertCask(toPosition)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	local tile = toPosition:getTile()
	if tile then
		local thing = tile:getItemById(2249)
		if thing then
			thing:transform(5539)
		end
	end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target:isItem() then
		return false
	end

	-- In Service Of Yalahar Quest
	if target.uid == 3071 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe01) < 1 then
			doSetMonsterOutfit(player, 'skeleton', 3 * 1000)
			fromPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe01, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			local position
			for x = -1, 1 do
				for y = -1, 1 do
					position = Position(player:getPosition().x + x, player:getPosition().y + y, player:getPosition().z)
					position:sendMagicEffect(CONST_ME_YELLOWENERGY)
				end
			end
		end
	elseif target.uid == 3072 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe02) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe02, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
			local position
			for x = -1, 1 do
				for y = -1, 1 do
					if math.random(2) == 2 then
						position = Position(player:getPosition().x + x, player:getPosition().y + y, player:getPosition().z)
						Game.createMonster('rat', position)
						position:sendMagicEffect(CONST_ME_TELEPORT)
					end
				end
			end
		end
	elseif target.uid == 3073 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe03) < 1 then
			player:say('You have used the crowbar on a grate.', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe03, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
		end
	elseif target.uid == 3074 then
		if player:getStorageValue(Storage.InServiceofYalahar.SewerPipe04) < 1 then
			doSetMonsterOutfit(player, 'bog raider', 5 * 1000)
			player:say('You have used the crowbar on a knot.', TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.SewerPipe04, 1)
			player:setStorageValue(Storage.InServiceofYalahar.Mission01, player:getStorageValue(Storage.InServiceofYalahar.Mission01) + 1) -- StorageValue for Questlog 'Mission 01: Something Rotten'
		end
	end
	-- The Ape City - Mission 7: Destroying Casks With Crowbar
	if target.itemid == 5539 and target.actionid == 12127 and player:getStorageValue(Storage.TheApeCity.Mission07) <= 3 then --hit cask with crowbar
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.TheApeCity.Mission07, player:getStorageValue(Storage.TheApeCity.Mission07) + 1) -- The Ape City Questlog - Mission 7: Destroying Casks With Crowbar
		if player:getStorageValue(Storage.TheApeCity.Mission07) == 4 then
			player:setStorageValue(Storage.TheApeCity.Questline, 17)
		end
		player:say('You destroyed a cask.', TALKTYPE_MONSTER_SAY)
		target:transform(2249)
		addEvent(revertCask, 30 * 1000, toPosition)
	end
	-- Postman Quest
	if target.actionid == 100 and target.itemid == 2593 then
		if player:getStorageValue(Storage.postman.Mission02) == 1 then
			player:setStorageValue(Storage.postman.Mission02, 2)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	-- Secret Service Quest
	if target.actionid == 12566 and player:getStorageValue(Storage.secretService.TBIMission06) == 1 then
		local playerOutfit = player:getOutfit()
		local yelling = Position(32204, 31157, 8)
		if playerOutfit.lookType == 137 then -- amazon lookType
			player:setStorageValue(Storage.secretService.TBIMission06, 2)
			Game.createMonster('barbarian skullhunter', yelling) -- say
			player:say("Nooooo! What have you done??", TALKTYPE_MONSTER_SAY, false, 0, yelling)
			Game.createMonster('barbarian skullhunter', Position(32204, 31156, 8))
		end
	end
	return true
end
