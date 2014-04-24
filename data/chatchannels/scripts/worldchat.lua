function onSpeak(cid, type, message)
        if(Player(cid):getLevel() == 1 and getPlayerAccountType(cid) < ACCOUNT_TYPE_GAMEMASTER) then
                Player(cid):sendCancelMessage("You may not speak into channels as long as you are on level 1.")
                return false
        end

        if(type == TALKTYPE_CHANNEL_Y) then
                if(Player(cid):getAccountType() >= ACCOUNT_TYPE_GAMEMASTER) then
                        type = TALKTYPE_CHANNEL_O
                end
        elseif(type == TALKTYPE_CHANNEL_O) then
                if(Player(cid):getAccountType() < ACCOUNT_TYPE_GAMEMASTER) then
                        type = TALKTYPE_CHANNEL_Y
                end
        elseif(type == TALKTYPE_CHANNEL_R1) then
                if(Player(cid):getAccountType() < ACCOUNT_TYPE_GAMEMASTER and not getPlayerFlagValue(cid, PlayerFlag_CanTalkRedChannel)) then
                        type = TALKTYPE_CHANNEL_Y
                end
        end
        return type
end
