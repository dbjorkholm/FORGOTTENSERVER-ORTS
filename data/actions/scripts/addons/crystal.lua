function onUse(cid, item, fromPosition, itemEx, toPosition)
local storage = 73291
local item = 18521
local player = Player(cid)
local creature = Creature(cid)

        if (player:getStorageValue(storage) <= 0 and player:removeItem(item, 1)) then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You've received the first crystal warlord addon!")
                if (player:getSex() == 1) then
                        player:addOutfitAddon(512, 1)
                else
                        player:addOutfitAddon(513, 1)
                end
                player:setStorageValue(storage,1)
                Position(creature:getPosition()):sendMagicEffect(CONST_ME_HOLYDAMAGE)
        else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE,"You've already recieved this addon!")
        end
end