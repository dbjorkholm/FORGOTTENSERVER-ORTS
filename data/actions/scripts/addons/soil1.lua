function onUse(cid, item, fromPosition, itemEx, toPosition)
local storage = 70029
local item = 18519
local player = Player(cid)
local creature = Creature(cid)

        if (player:getStorageValue(storage) <= 0 and player:removeItem(item, 1)) then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You've received the second soil guardian addon!")
                if (player:getSex() == 1) then
                        player:addOutfitAddon(516, 2)
                else
                        player:addOutfitAddon(514, 2)
                end
                player:setStorageValue(storage,1)
                Position(creature:getPosition()):sendMagicEffect(CONST_ME_HOLYDAMAGE)
        else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You've already recieved this addon!")
        end
end