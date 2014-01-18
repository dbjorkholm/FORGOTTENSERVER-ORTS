local t = {
    [13925] = {itemid = 13925, female = 431, male = 430, addon = 1, msg = "first afflicted"},
    [13926] = {itemid = 13926, female = 431, male = 430, addon = 2, msg = "second afflicted"},
    [18518] = {itemid = 18518, female = 514, male = 516, addon = 1, msg = "first soil guardian"},
    [18519] = {itemid = 18519, female = 514, male = 516, addon = 2, msg = "second soil guardian"},
    [18521] = {itemid = 18521, female = 513, male = 512, addon = 1, msg = "first crystal warlord"},
    [18522] = {itemid = 18522, female = 513, male = 512, addon = 2, msg = "second crystal warlord"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    local v = t[item.itemid]
    if v then
        if not player:hasOutfit(player:getSex() == 0 and v.female or v.male, v.addon) then 
            if player:removeItem(v.itemid, 1) then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've received the " .. v.msg .. " addon!")
                player:addOutfitAddon(player:getSex() == 0 and v.female or v.male, v.addon)
                player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the required item!")
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've already obtained this addon!")
        end
    end
    return true
end