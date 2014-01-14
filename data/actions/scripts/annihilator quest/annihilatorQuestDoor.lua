function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 2216) then
                if(Player(cid):getStorageValue(2215) < 1) then
                        if(item.itemid == 5114) then
								Creature(uid):teleportTo(toPosition, true)
                                Item(uid):transform(5115)
                        end
                end
        end
        return true
end
