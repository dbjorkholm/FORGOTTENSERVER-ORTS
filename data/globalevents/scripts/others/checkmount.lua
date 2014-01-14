local mounts = {
        ["brown rented horse"] = {price = 500, days = 2, mountid = 22, level = 10, premium = false, storage = 50561},
        ["grey rented horse"] = {price = 500, days = 1, mountid = 25, level = 20, premium = false, storage = 50562}
}

local function doRemovePlayerMount(cid, mountId)
        Player(cid):removeMount(mountId)
        return Player(cid):setOutfit({lookType = Player(cid):getOutfit().lookType, lookHead = Player(cid):getOutfit().lookHead, lookBody = Player(cid):getOutfit().lookBody, lookLegs = Player(cid):getOutfit().lookLegs, lookFeet = Player(cid):getOutfit().lookFeet, lookAddons = Player(cid):getOutfit().lookAddons})
end

local function CheckRentMount(cid)
        for var, ret in pairs(mounts) do
                if Player(cid):hasMount(ret.mountid) and Player(cid):getStorageValue(ret.storage) ~= -1 and Player(cid):getStorageValue(ret.storage) <= os.time() then
                        doRemovePlayerMount(cid, ret.mountid)
                        Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, "The time of your mount " .. var .. " has ended, to get it again back to the NPC.")
                end
        end
end

function onThink(interval)
        for _, cid in ipairs(getOnlinePlayers()) do
                CheckRentMount(cid)
        end

        return true
end
