local premiumDaysCost = 3
function onSay(cid, words, param)
        if(Player(cid):getGroup():getAccess() > 0) then
                Player(cid):setSex(Player(cid):getSex() == PLAYERSEX_FEMALE and PLAYERSEX_MALE or PLAYERSEX_FEMALE)
                Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You have changed your sex.")
                return false
        end

        if(Player(cid):getPremiumDays >= premiumDaysCost) then
                Player(cid):removePremiumDays(config.premiumDaysCost)
                Player(cid):setSex(Player(cid):getSex() == PLAYERSEX_FEMALE and PLAYERSEX_MALE or PLAYERSEX_FEMALE)
                Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "You have changed your sex for ".. config.premiumDaysCost .." days of your premium account.")
        else
                Player(cid):sendCancelMessage("You do not have enough premium days, changing sex costs ".. config.premiumDaysCost .." days of your premium account.")
                Position(Player(cid):getPosition):sendMagicEffect(CONST_ME_POFF)
        end
return false
end
