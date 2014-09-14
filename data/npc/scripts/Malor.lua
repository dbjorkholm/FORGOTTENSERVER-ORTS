local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Factions) <= 0 or player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission01) < 1 and BlueOrGreen then
		return false
	end

	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	-- Mission 3 - Orc Fortress
	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission02) == 3 and player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) < 1 then
			npcHandler:say({
				"I guess this is the first time I entrust a human with a mission. And such an important mission, too. But well, we live in hard times, and I am a bit short of adequate staff. ...",
				"Besides, Baa'leal told me you have distinguished yourself well in previous missions, so I think you might be the right person for the job. ...",
				"But think carefully, human, for this mission will bring you close to certain death. Are you prepared to embark on this mission?"
			}, cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.DjinnWar.EfreetFaction.Mission03) == 3 then
			npcHandler:say("Have you found Fa'hradin's lamp and placed it in Malor's personal chambers?", cid)
			npcHandler.topic[cid] = 2
		end
	-- Mission 3 - Orc Fortress
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say({
				"Well, listen. We are trying to acquire the ultimate weapon to defeat Gabel: Fa'hradin's lamp! ...",
				"At the moment it is still in the possession of that good old friend of mine, the Orc King, who kindly released me from it. ...",
				"However, for some reason he is not as friendly as he used to be. You better watch out, human, because I don't think you will get the lamp without a fight. ...",
				"Once you have found the lamp you must enter Ashta'daramai again. Sneak into Gabel's personal chambers and exchange his sleeping lamp with Fa'hradin's lamp! ...",
				"If you succeed, the war could be over one night later!"
			}, cid)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission03, 1)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say({
				"Well well, human. So you really have made it - you have smuggled the modified lamp into Gabel's bedroom! ...",
				"I never thought I would say this to a human, but I must confess I am impressed. ...",
				"Perhaps I have underestimated you and your kind after all. ...",
				"I guess I will take this as a lesson to keep in mind when I meet you on the battlefield. ...",
				"But that's in the future. For now, I will confine myself to give you the permission to trade with my people whenever you want to. ...",
				"Farewell, human!"
			}, cid)
			player:setStorageValue(Storage.DjinnWar.EfreetFaction.Mission03, 4)
			npcHandler.topic[cid] = 0
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Greetings, human |PLAYERNAME|. My patience with your kind is limited, so speak quickly and choose your words well.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell, human. When I have taken my rightful place I shall remember those who served me well. Even if they are only humans.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Farewell, human.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

local focusModule = FocusModule:new()
focusModule:addGreetMessage('djanni\'hah')
npcHandler:addModule(focusModule)
