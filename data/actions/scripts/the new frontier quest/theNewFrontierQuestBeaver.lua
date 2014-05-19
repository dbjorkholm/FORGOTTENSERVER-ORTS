function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 11100) then
	local player = Player(cid)
		if(itemEx.actionid == 8002) then
			if(player:getStorageValue(1015) == 5) and (player:getStorageValue(12141) < 1) then
				Game.createMonster("thieving squirrel", toPosition)
				toPosition:sendMagicEffect(CONST_ME_TELEPORT)
				player:setStorageValue(12141, 1)
				player:setStorageValue(12132, player:getStorageValue(12132) + 1) --Questlog, The New Frontier Quest "Mission 02: From Kazordoon With Love"
				Game.createMonster("thieving squirrel", pos)
				player:say("You've marked the tree, but its former inhabitant has stolen your bait! Get it before it runs away!", TALKTYPE_ORANGE_1)
				Item(item.uid):remove()
			end
		elseif(itemEx.actionid == 8003) then
			if(player:getStorageValue(1015) == 5) and (player:getStorageValue(12142) < 1) then
				for i = 1, 5 do
					pos = toPosition
					Game.createMonster("wolf", pos)
					toPosition:sendMagicEffect(CONST_ME_TELEPORT)
				end
				Game.createMonster("war wolf", toPosition)
				doSendMagicEffect(toPosition, CONST_ME_TELEPORT)
				player:setStorageValue(12142, 1)
				player:setStorageValue(12132, player:getStorageValue(12132) + 1) --Questlog, The New Frontier Quest "Mission 02: From Kazordoon With Love"
				player:say("You have marked the tree but it seems someone marked it already! He is not happy with your actions and he brought friends!", TALKTYPE_ORANGE_1)
			end
		elseif(itemEx.actionid == 8004) then
			if(player:getStorageValue(1015) == 5) and (player:getStorageValue(12143) < 1) then
				for i = 1, 3 do
					pos = toPosition
					Game.createMonster("enraged squirrel", pos)
					toPosition:sendMagicEffect(CONST_ME_TELEPORT)
				end
				player:setStorageValue(12143, 1)
				player:setStorageValue(12132, player:getStorageValue(12132) + 1) --Questlog, The New Frontier Quest "Mission 02: From Kazordoon With Love"
				player:say("You have marked the tree, but you also angered the aquirrel family who lived on it!", TALKTYPE_ORANGE_1)
			end
		end
		if(player:getStorageValue(12141) == 1) and (player:getStorageValue(12142) == 1) and (player:getStorageValue(12143) == 1)then
			player:setStorageValue(1015, 6)
		end
	end
	return true
end