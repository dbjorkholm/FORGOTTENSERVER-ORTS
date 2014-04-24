-- TODO: Rewrite this script using fluidtypes from LIQUIDS doc-file,
--      and correct itemid's to recieve the liquids.

local drunk = Condition(CONDITION_DRUNK)
    drunk:setParameter(CONDITION_PARAM_TICKS, 60000)

local poison = Condition(CONDITION_POISON)
    poison:setParameter(CONDITION_PARAM_DELAYED, true) -- Condition will delay the first damage from when it's added
    poison:setParameter(CONDITION_PARAM_MINVALUE, -50) -- Minimum damage the condition can do at total
    poison:setParameter(CONDITION_PARAM_MAXVALUE, -120) -- Maximum damage
    poison:setParameter(CONDITION_PARAM_STARTVALUE, -5) -- The damage the condition will do on the first hit
    poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000) -- Delay between damages
    poison:setParameter(CONDITION_PARAM_FORCEUPDATE, true) -- Re-update condition when adding it(ie. min/max value)

local fluidType = {3, 4, 5, 7, 10, 11, 13, 15, 19, 43}
local fluidMessage = {"Aah...", "Urgh!", "Mmmh.", "Aaaah...", "Aaaah...", "Urgh!", "Urgh!", "Aah...", "Urgh!", "Aaaah..."}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local iex = Item(itemEx.uid)
	local i = Item(item.uid)
	local p = Player(cid)
	local ie = ItemType(itemEx.itemid)
    if ie:isFluidContainer() and itemEx.type == 0 then
        iex:transform(itemEx.itemid, item.type)
        i:transform(item.itemid, 0)
        return true
    end
    if ie:isFluidContainer() and item.type == 0 then
        iex:transform(itemEx.itemid, 0)
        i:transform(item.itemid, itemEx.type)
        return true
    end

    if itemEx.itemid == 1 then
        if item.type == 0 then
            p:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
        elseif itemEx.uid == cid then
            i:transform(item.itemid, 0)
            if item.type == 3 or item.type == 15 or item.type == 43 then
				p:addCondition(drunk)
            elseif item.type == 4 then
                p:addCondition(poison)
            elseif item.type == 7 then
                p:addMana(math.random(50, 150))
                fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            elseif item.type == 10 then
                p:addHealth(60)
                fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
            end
            for i = 0, #fluidType do
                if item.type == fluidType[i] then
                    p:say(fluidMessage[i], TALKTYPE_ORANGE_1)
                    return true
                end
            end
            p:say("Gulp.", TALKTYPE_ORANGE_1)
        else
            i:transform(item.itemid, 0)
            Game.createItem(2016, item.type, toPosition):decay()
        end
    else
        local fluidSource = ie:getFluidSource()
        if fluidSource ~= 0 then
            i:transform(item.itemid, fluidSource)
        elseif item.type == 0 then
            p:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
        else
            if toPosition.x == CONTAINER_POSITION then
                toPosition = p:getPosition()
            end
            i:transform(item.itemid, 0)
            Game.createItem(2016, item.type, toPosition):decay()
        end
    end
    return true
end
