local SKINS = {
        [5908] = {
                -- Minotaurs
                [2830] = {25, 5878},
                [2871] = {25, 5878},
                [2866] = {25, 5878},
                [2876] = {25, 5878},
                [3090] = {25, 5878},

                -- Low Class Lizards
                [4259] = {25, 5876},
                [4262] = {25, 5876},
                [4256] = {25, 5876},

                -- High Class Lizards
                [11288] = {25, 5876},
                [11280] = {25, 5876},
                [11272] = {25, 5876},
                [11284] = {25, 5876},

                -- Dragons
                [3104] = {25, 5877},
                [2844] = {25, 5877},

                -- Dragon Lords
                [2881] = {25, 5948},

                -- Behemoths
                [2931] = { { 10, 5930 }, { 35, 5893 } },

                -- Bone Beasts
                [3031] = {25, 5925},

                -- The Mutated Pumpkin
                [8961] = { { 5, 7487 }, { 10, 7737 }, { 20, 6492 }, { 30, 8860 }, { 45, 2683 }, { 60, 2096 }, { 90, 9005, 50 } }
        },
        [5942] = {
                -- Demon
                [2916] = {25, 5906},

                -- Vampire
                [2956] = {25, 5905}
        }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if itemEx.itemid == 9010 then
                if getPlayerStorageValue(cid, 10003) < 1 then
                        doPlayerAddItem(cid, 8310, 1)
                        doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
                        setPlayerStorageValue(cid, 10003, 1)
                else
                        doCreatureSay(cid, "You cannot skin the corpse more than once.", TALKTYPE_ORANGE_1)
                end
                return true
        end
        local skin = SKINS[item.itemid][itemEx.itemid]
        if skin == nil then
                doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                return true
        end

        local random, effect, transform = math.random(1, 100000), CONST_ME_MAGIC_GREEN, true
        if type(skin[1]) == 'table' then
                local added = false
                for _, _skin in ipairs(skin) do
                        if(random <= _skin[1]) then
                                doPlayerAddItem(cid, _skin[2], _skin[3] or 1)
                                added = true
                                break
                        end
                end

                if not added and itemEx.itemid == 8961 then
                        effect = CONST_ME_POFF
                        transform = false
                end
        elseif random <= skin[1] then
                doPlayerAddItem(cid, skin[2], skin[3] or 1)
        else
                effect = CONST_ME_POFF
        end

        doSendMagicEffect(toPosition, effect)
        if transform then
                doTransformItem(itemEx.uid, itemEx.itemid + 1)
        end
        return true
end
