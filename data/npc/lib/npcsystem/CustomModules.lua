-- Custom Modules, created to help us in this datapack

--It cannot be named TravelModule because there is already a TravelModule on modules.lua
TravelLib = {}

-- These callback function must be called with parameters.npcHandler = npcHandler in the parameters table or they will not work correctly.
-- Usage:
	-- keywordHandler:addKeyword({'svargrond'}, TravelLib.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a passage to Svargrond for %s?', cost = 180, discount = TravelLib.postmanDiscount})

function TravelLib.say(cid, message, keywords, parameters, node)
	local npcHandler = parameters.npcHandler

	if npcHandler == nil then
		error("StdModule.say called without any npcHandler instance.")
	end

	local onlyFocus = (parameters.onlyFocus == nil or parameters.onlyFocus == true)
	if not npcHandler:isFocused(cid) and onlyFocus then
		return false
	end

	if parameters.questCheck then
		if not parameters.questCheck(cid) then
			npcHandler:resetNpc(cid)
			return true
		end
	end

	local costMsg = "%d gold coins"

	if parameters.cost > 0 then
		local cost = parameters.cost

		if parameters.discount then
			cost = cost - parameters.discount(cid, cost)
		end

		costMsg = string.format(costMsg, cost)
	else   
		costMsg = "free"
	end

	local parseInfo = {[TAG_PLAYERNAME] = Player(cid):getName()}

	local msg = string.format(npcHandler:parseMessage(parameters.text or parameters.message, parseInfo), costMsg)

	npcHandler:say(msg, cid, parameters.publicize and true)		

	if not parameters.reset == false then
		npcHandler:resetNpc(cid)
	elseif parameters.moveup ~= nil then
		npcHandler.keywordHandler:moveUp(parameters.moveup)
	end

	return true
end

-- These callback function must be called with parameters.npcHandler = npcHandler in the parameters table or they will not work correctly.
-- Usage:
	-- keywordHandler:addKeyword({"yes"}, TravelLib.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 180, discount = TravelLib.postmanDiscount, destination = {x=32341, y=31108, z=6} })

function TravelLib.travel(cid, message, keywords, parameters, node)
	local npcHandler = parameters.npcHandler
	if npcHandler == nil then
		error("StdModule.travel called without any npcHandler instance.")
	end

	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)

	local costTravel = parameters.cost
	if costTravel > 0 then
		if parameters.discount then
			costTravel = costTravel - parameters.discount(cid, costTravel)
		end
	end

	if parameters.questCheck then
		if not parameters.questCheck(cid) then
			npcHandler:resetNpc(cid)
			return true
		end
	end

	if parameters.premium and not player:isPremium() then
		npcHandler:say("I'm sorry, but you need a premium account in order to travel onboard our ships.", cid)
	elseif not player:removeMoney(costTravel) then
		npcHandler:say("You don't have enough money.", cid)
	elseif(parameters.level ~= nil and player:getLevel() < parameters.level) then
		npcHandler:say("You must reach level " .. parameters.level .. " before I can let you go there.", cid)
	elseif player:isPzLocked() then
		npcHandler:say("First get rid of those blood stains! You are not going to ruin my vehicle!", cid)
	else
		npcHandler:releaseFocus(cid)
		npcHandler:say(parameters.msg or "Set the sails!", cid)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

		local destination = parameters.destination
		if type( destination ) == 'function' then
			destination = destination( cid )
		end

		player:teleportTo(destination)
		Position(destination):sendMagicEffect(CONST_ME_TELEPORT)

		if parameters.onTravelCallback then
			parameters.onTravelCallback(cid)
		end
	end

	npcHandler:resetNpc(cid)
	return true
end

function TravelLib.postmanDiscount(cid, cost)	
	if Player(cid):getStorageValue(Storage.postman.Rank) >= 3 then
		return 10
	end
   
	return 0
end