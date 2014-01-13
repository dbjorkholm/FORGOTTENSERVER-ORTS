function skinMonster(cid,item,skin)
local random = math.random(1,15)
        if(random < 4) then
                doPlayerAddItem(cid,skin,1)
                doSendMagicEffect(getThingPos(item.uid), CONST_ME_MAGIC_GREEN)
        else
                doSendMagicEffect(getThingPos(item.uid), CONST_ME_BLOCKHIT)
        end
        doTransformItem(item.uid,item.itemid+1)
end

function doObsidianKnife(cid, item, itemEx)
local minotaurs = {2830, 3090, 2871, 2866, 2876}
local lizards = {4259, 4262, 4256}
local lizardsh = {11269, 11273, 11277, 11281, 11285}
local greendragons = {3104, 2844}
local reddragons = {2881}
local behemoth = {2931}
local bonebeast = {3031}
local cube = {7441, 7444, 7445}
local cube2 = {7442}
local marble = {11343}
local ashes = {9010}

local random = math.random(1,10)
        if isInArray(minotaurs, itemEx.itemid) then
                skinMonster(cid, itemEx, 5878)
        return true
        elseif isInArray(lizards, itemEx.itemid) then
                skinMonster(cid, itemEx, 5876)
        return true
        elseif isInArray(lizardsh, itemEx.itemid) then
                skinMonster(cid, itemEx, 5876)
        return true
        elseif isInArray(greendragons, itemEx.itemid) then
                skinMonster(cid, itemEx, 5877)
        return true
        elseif isInArray(reddragons, itemEx.itemid) then
                skinMonster(cid, itemEx, 5948)
        return true
        elseif isInArray(behemoth, itemEx.itemid) then
                skinMonster(cid, itemEx, 5893)
        return true
        elseif isInArray(bonebeast, itemEx.itemid) then
                skinMonster(cid, itemEx, 5925)
        return true
        elseif isInArray(ashes, itemEx.itemid) then
                if (getPlayerStorageValue(cid, 10003) < 1) then
                        doPlayerAddItem(cid, 8310, 1)
                        doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
                        setPlayerStorageValue(cid, 10003, 1)
                else
                        doCreatureSay(cid, "You cannot skin the corpse more than once.", TALKTYPE_ORANGE_1)
                end
        return true
        elseif isInArray(marble, itemEx.itemid) then
                doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_ICEAREA)
                doRemoveItem(itemEx.uid,1)
                local check = math.random(1,10)
                if(check < 6) then
                        goblet = doPlayerAddItem(cid, 11344, 1)
                        doSetItemSpecialDescription(goblet, "This shoddy work was made by " .. getCreatureName(cid) .. ".")
                else
                        if(check < 8) then
                                goblet = doPlayerAddItem(cid, 11345, 1)
                                doSetItemSpecialDescription(goblet, "This little figurine made by " .. getCreatureName(cid) .. " has some room for improvement.")
                        else
                                goblet = doPlayerAddItem(cid, 11346, 1)
                                doSetItemSpecialDescription(goblet, "This little figurine of Tibiasula was masterfully sculpted by " .. getCreatureName(cid) .. ".")
                        end
                end
        return true
        elseif isInArray(cube, itemEx.itemid) or isInArray(cube2, itemEx.itemid) then
                if random < 4 then
                        if isInArray(cube2, itemEx.itemid) then ice_cube_transform = 2 else ice_cube_transform = 1 end
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
                        doTransformItem(itemEx.uid, itemEx.itemid + ice_cube_transform)
                        return true
                else
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
                        doRemoveItem(itemEx.uid)
                        doCreatureSay(cid, "The attempt of sculpting failed miserably.", TALKTYPE_MONSTER)
                return true
                end
        end
return false
end

function doWoodenStake(cid, item, itemEx)
local DUSTS = {
        -- Demons
        [2956] = {25000, 5905},
        [5527] = {50000, 5906},
        
        -- Vampires
        [2916] = {25000, 5906}
}
local dust = DUSTS[itemEx.itemid]
if DUSTS[itemEx.itemid] == nil then
        return false
end
        
        local random = math.random(1, 100000)
        if(random <= dust[1]) then
                doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_GROUNDSHAKER)
                doPlayerAddItem(cid, dust[2], 1)
        elseif(dust[3] and random >= dust[3]) then
                doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_GROUNDSHAKER)
                doPlayerAddItem(cid, dust[4], 1)
        else
                doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_POFF)
        end

        doTransformItem(itemEx.uid, itemEx.itemid + 1)
        return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
local obsidianknife = 9
local bws = 13

local tools = {
[5908] = {obsidianknife},
[5942] = {bws}
}

if tools[item.itemid] == nil then
        return false
end

for i = 1, #tools[item.itemid] do
        if tools[item.itemid][i] == obsidianknife then
                if doObsidianKnife(cid, item, itemEx) then
                        return true
                end
        elseif tools[item.itemid][i] == bws then
                if doWoodenStake(cid, item, itemEx) then
                        return true
                end
        end
end

return false
end
