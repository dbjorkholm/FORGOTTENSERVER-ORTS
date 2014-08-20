function transfer_deep_spawn_back(pos)
doTransformItem(getTileItemById(pos, 15137).uid, 15570)
doSendMagicEffect(pos, CONST_ME_DRAWBLOOD)
return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 989) < 1 then
		return false
	end
	
	if exhaustion.get(cid, 992) ~= false then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "You finished your mission for now. Come back in one hour.")
		return true
	end

	if exhaustion.get(cid, 990) ~= false then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_SMALL, "The soul net is not ready yet.")
		return true
	end
	
	if itemEx.itemid == 15570 then
		exhaustion.set(cid, 990, 15)
		doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
		addEvent(transfer_deep_spawn_back, 60000, getThingPos(itemEx.uid))
		doTransformItem(itemEx.uid, 15137)
		setPlayerStorageValue(cid, 991, getPlayerStorageValue(cid, 991) + math.random(1, 5))
			
			if math.random(1, 100) < getPlayerStorageValue(cid, 991) then
			-- mission done
				setPlayerStorageValue(cid, 991, 0)
				Player(cid):addExperience(3000, true, true)
				exhaustion.set(cid, 992, 3600)
				
				if math.random(1,5) == 4 then
					doPlayerAddItem(cid, 15432, 1)
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Suddenly a small anchor seems to materialize inside the net. It looks like a keepsake from a long dead sailor.")
					if getPlayerStorageValue(cid, 989) ~= 1 then
						return true
					end
				end

				
				if getPlayerStorageValue(cid, 989) == 1 then
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You purified the spawns for a while. Report it back to George.")
					setPlayerStorageValue(cid, 989, 2)
					return true
				end
				
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You spread the net over the spawn and the darkness surrounding the hatch seems to dissolve.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You spread the net over the spawn and the darkness surrounding the hatch seems to dissolve.")
			end
			return true
	end
return false
end
