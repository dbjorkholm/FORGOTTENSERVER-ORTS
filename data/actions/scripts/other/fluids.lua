-- TODO: Rewrite this script using fluidtypes from LIQUIDS doc-file,
--       and correct itemid's to recieve the liquids.

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

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target:isItem() then
		return false
	end

	local targetItemId = target:getType()
	if targetItemId:isFluidContainer() and target.type == 0 then
		target:transform(target.itemid, item.type)
		item:transform(item.itemid, 0)
		return true
	end
	if targetItemId:isFluidContainer() and item.type == 0 then
		target:transform(target.itemid, 0)
		item:transform(item.itemid, target.type)
		return true
	end

	if target.itemid == 1 then
		if item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
		elseif target.uid == player:getId() then
			item:transform(item.itemid, 0)
			if item.type == 3 or item.type == 15 or item.type == 43 then
				player:addCondition(drunk)
			elseif item.type == 4 then
				player:addCondition(poison)
			elseif item.type == 7 then
				player:addMana(math.random(50, 150))
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			elseif item.type == 10 then
				player:addHealth(60)
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
			for i = 0, #fluidType do
				if item.type == fluidType[i] then
					player:say(fluidMessage[i], TALKTYPE_MONSTER_SAY)
					return true
				end
			end
			player:say("Gulp.", TALKTYPE_MONSTER_SAY)
		else
			item:transform(item.itemid, 0)
			Game.createItem(2016, item.type, toPosition):decay()
		end
	else
		local fluidSource = targetItemId:getFluidSource()
		if fluidSource ~= 0 then
			item:transform(item.itemid, fluidSource)
		elseif item.type == 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
		else
			if toPosition.x == CONTAINER_POSITION then
				toPosition = player:getPosition()
			end
			item:transform(item.itemid, 0)
			Game.createItem(2016, item.type, toPosition):decay()
		end
	end
	return true
end
