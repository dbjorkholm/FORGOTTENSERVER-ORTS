local Aluguel_mounts = {
    ["brown rented horse"] = {price = 500, days = 2, mountid = 22, level = 10, premium = false, storage = 50561},
    ["grey rented horse"] = {price = 500, days = 1, mountid = 25, level = 20, premium = false, storage = 50562}
}
 
local function doRemovePlayerMount(cid, mountId) -- vodka
    doPlayerRemoveMount(cid, mountId)
    return doCreatureChangeOutfit(cid,{lookType = getCreatureOutfit(cid).lookType, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet, lookAddons = getCreatureOutfit(cid).lookAddons})
end
 
local function CheckRentMount(cid)
    for var, ret in pairs(Aluguel_mounts) do
        if getPlayerMount(cid, ret.mountid) and getPlayerStorageValue(cid, ret.storage) ~= -1 and getPlayerStorageValue(cid, ret.storage) <= os.time() then
            doRemovePlayerMount(cid, ret.mountid)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The time of your mount " .. var .. " has ended, to get it again back to the NPC.")
        end
    end
end
 
function onThink(interval)
    for _, cid in ipairs(getOnlinePlayers()) do
        CheckRentMount(cid)
    end
	
    return true
end
