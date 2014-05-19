local function doTransformCampFire(cpPos, itemid, itemid2)
        local tile = Position(cpPos):getTile()
        if tile then
                local thing = tile:getItemById(itemid)
                if thing and thing:isItem() then
                        thing:transform(itemid2)
                end
        end
end
 
local config = {
        [1945] = {
                [50005] = {pos = {x = 32309, y = 31975, z = 13}, cpId = 1423, cpId2 = 1421},
                [50006] = {pos = {x = 32309, y = 31976, z = 13}, cpId = 1423, cpId2 = 1421},
                [50007] = {pos = {x = 32311, y = 31975, z = 13}, cpId = 1423, cpId2 = 1421},
                [50008] = {pos = {x = 32311, y = 31976, z = 13}, cpId = 1423, cpId2 = 1421},
                [50009] = {pos = {x = 32313, y = 31975, z = 13}, cpId = 1423, cpId2 = 1421},
                [50010] = {pos = {x = 32313, y = 31976, z = 13}, cpId = 1423, cpId2 = 1421}
        },
        [1946] = {
                [50005] = {pos = {x = 32309, y = 31975, z = 13}, cpId = 1421, cpId2 = 1423},
                [50006] = {pos = {x = 32309, y = 31976, z = 13}, cpId = 1421, cpId2 = 1423},
                [50007] = {pos = {x = 32311, y = 31975, z = 13}, cpId = 1421, cpId2 = 1423},
                [50008] = {pos = {x = 32311, y = 31976, z = 13}, cpId = 1421, cpId2 = 1423},
                [50009] = {pos = {x = 32313, y = 31975, z = 13}, cpId = 1421, cpId2 = 1423},
                [50010] = {pos = {x = 32313, y = 31976, z = 13}, cpId = 1421, cpId2 = 1423}
        }
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
        local targetItem = config[item.itemid]
        if not targetItem then
                return true
        end
       
        doTransformCampFire(targetItem[item.uid]["pos"], targetItem[item.uid]["cpId"], targetItem[item.uid]["cpId2"])
        Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
        return true
end