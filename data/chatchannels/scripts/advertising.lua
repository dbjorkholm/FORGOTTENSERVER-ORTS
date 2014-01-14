function canJoin(cid)
        return Player(cid):getVocation():getId() ~= VOCATION_NONE or Player(cid):getAccountType() >= ACCOUNT_TYPE_SENIORTUTOR
end

local CHANNEL_ADVERTISING = 5

local muted = createConditionObject(CONDITION_CHANNELMUTEDTICKS)
setConditionParam(muted, CONDITION_PARAM_SUBID, CHANNEL_ADVERTISING)
setConditionParam(muted, CONDITION_PARAM_TICKS, 120000)

function onSpeak(cid, type, message)
        if(Player(cid):getAccountType() >= ACCOUNT_TYPE_GAMEMASTER) then
                if(type == TALKTYPE_CHANNEL_Y) then
                        return TALKTYPE_CHANNEL_O
                end
                return true
        end

        if(Player(cid):getLevel() == 1) then
                Player(cid):sendCancelMessage("You may not speak into channels as long as you are on level 1.")
                return false
        end

        if(getCreatureCondition(cid, CONDITION_CHANNELMUTEDTICKS, CHANNEL_ADVERTISING)) then
                Player(cid):sendCancelMessage("You may only place one offer in two minutes.")
                return false
        end
        doAddCondition(cid, muted)

        if(type == TALKTYPE_CHANNEL_O) then
                if(Player(cid):getAccountType() < ACCOUNT_TYPE_GAMEMASTER) then
                        type = TALKTYPE_CHANNEL_Y
                end
        elseif(type == TALKTYPE_CHANNEL_R1) then
                if(not getPlayerFlagValue(cid, PlayerFlag_CanTalkRedChannel)) then
                        type = TALKTYPE_CHANNEL_Y
                end
        end
return type
end
