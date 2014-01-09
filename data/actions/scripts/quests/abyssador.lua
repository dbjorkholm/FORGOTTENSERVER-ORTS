local exhaustionStorageabyssador = 9172
local exhaustionDelay = 20 * 60 * 60 -- seconds

function onUse(cid, item, frompos, item2, topos)
	if (item.uid == 9172 and getPlayerStorageValue(cid, exhaustionStorageabyssador) < 1) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Mushroom Backpack.")
			local bag = doPlayerAddItem(cid,18393,1)
			doAddContainerItem(bag,18402,1)
			doAddContainerItem(bag,18414,12)
			doAddContainerItem(bag,18396,1)
			doAddContainerItem(bag,18500,1)
			doAddContainerItem(bag,2160,5)
			doAddContainerItem(bag,18423,2)
			setPlayerStorageValue(cid,exhaustionStorageabyssador, os.time() + exhaustionDelay)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
		end	
	return TRUE
end



