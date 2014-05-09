local mounts = {
    ["brown rented horse"] = {price = 500, days = 1, mountid = 22, level = 10, premium = false, storage = 50561},
    ["grey rented horse"] = {price = 500, days = 1, mountid = 25, level = 20, premium = false, storage = 50562}
}

local function doRemovePlayerMount(cid, mountId)
    local player = Player(cid)
    player:removeMount(mountId)
    
    return player:setOutfit({lookType = player:getOutfit().lookType, lookHead = player:getOutfit().lookHead, lookBody = player:getOutfit().lookBody, lookLegs = player:getOutfit().lookLegs, lookFeet = player:getOutfit().lookFeet, lookAddons = player:getOutfit().lookAddons})
end

local function CheckRentMount(cid)
    local player = Player(cid)
    for var, ret in pairs(mounts) do
        if player:hasMount(ret.mountid) and player:getStorageValue(ret.storage) ~= -1 and player:getStorageValue(ret.storage) <= os.time() then
            doRemovePlayerMount(cid, ret.mountid)
	    player:setStorageValue(ret.storage, -1) 
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The time of your mount " .. var .. " has ended, to get it again back to the NPC.")
        end
    end
end

function onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        CheckRentMount(player:getId())
    end

    return true
end
