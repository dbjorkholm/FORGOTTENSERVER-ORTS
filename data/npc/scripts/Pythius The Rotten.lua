local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, "mission") then
		if Player(cid):getStorageValue(Storage.hiddenCityOfBeregar.PythiusTheRotten) < 1 then
			npcHandler:say("I HAVE A MISSION FOR YOU BUT YOU NEED TO DIE FIRST AND RETURN AS AN UNDEAD CREATURE. COME BACK TO ME WHEN YOU ACHIEVED THIS GOAL.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "undead") then
		if npcHandler.topic[cid] == 1 then
			if Player(cid):getStorageValue(50020) == 1 then
				npcHandler:say("BOON AND BANE. I HAVE CHOSEN THIS LIFE VOLUNTARILLY AND I NEVER REGRET IT. MY TREASURE IS GROWING BIGGER EACH DAY.", cid)
				npcHandler.topic[cid] = 2
			end
		end
	elseif msgcontains(msg, "treasure") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("LIKE MY TREASURE? WANNA PICK SOMETHING OUT OF IT?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 3 then
			Player(cid):setStorageValue(Storage.hiddenCityOfBeregar.PythiusTheRotten, 1)
			npcHandler:say(
			{
				"HAHAHA, WHO WOULD SAY SOMETHING ELSE?....BUT....NOTHING'S FOR FREE AND SO WASN'T THE TREASURE BEHIND ME. ...",
				"BRING ME SOMETHING VALUABLE IN EXCHANGE. SOMETHING YOU THINK I'D LIKE AND THEN.....HAHAHAHA......WE CAN CONTINUE OUR SMALL CONVERSATION.",
				"EVERYTHING YOU CARRY WITH YOU CAN ALSO BE FOUND IN MY TREASURE. BRING ME SOMETHING I DON'T OWN!!!"
			}, cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			npcHandler:say("AS YOU WISH. WHAT DO YOU HAVE TO OFFER?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "offer") then
		if Player(cid):getStorageValue(Storage.hiddenCityOfBeregar.PythiusTheRotten) == 1 then
			npcHandler:say("I GRANT YOU ACCESS TO THE DUNGEON IN THE NORTH. YOU'LL FIND SOME OF MY LIVING BROTHERS THERE....BUT.....EVERY TIME YOU WANT TO ENTER YOU HAVE TO GIVE ME SOMETHING PRECIOUS. ALRIGHT?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif msgcontains(msg, "golden mug") then
		if npcHandler.topic[cid] == 4 then
			local player = Player(cid)
			if player:getItemCount(2033) > 0 then
				player:removeItem(2033, 1)
				player:setStorageValue(Storage.hiddenCityOfBeregar.PythiusTheRotten, 2)
				npcHandler:say("I LIKE THAT AND GRANT YOU ACCESS TO THE DUNGEON IN THE NORTH FOR THE NEXT FEW MINUTES. COME BACK ANYTIME AND BRING ME MORE TREASURES.", cid)
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "COME BACK ANYTIME AND BRING ME TREASURES.")
npcHandler:setMessage(MESSAGE_FAREWELL, "COME BACK ANYTIME AND BRING ME TREASURES.")
npcHandler:setMessage(MESSAGE_GREET, "I AWAITED YOU!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
