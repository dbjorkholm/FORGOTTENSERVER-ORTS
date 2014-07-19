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

	local player = Player(cid)

	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) < 1 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 1)
			npcHandler:say("I don't see how you could help me. I'm in deep, deep trouble. I'm accused of having stolen a ring from Rerun, but I haven't.", cid)
		elseif player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 6 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 7)
			npcHandler:say("WHAT?! I can't believe it. You saved my life... well, at least one week of it 'cause that would have been the time I had to spend in jail. If you want to, you can pass the door now and take a look at the northern mines. Have fun!", cid)
		end
	elseif msgcontains(msg, "ring") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 1 then
			npcHandler:say(
							{
							"He said he still had it after work. On that evening, Grombur, Rerun and me opened a cask of beer in one of the mine tunnels. We had a fun evening there. ...",
							"On the next day, the guards brought me to emperor Rehal, and Rerun was there, too. He said I had stolen his ring. I'd never steal, you have to believe me."
							}, cid)
	elseif msgcontains(msg, "Grombur") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 1 then
			npcHandler:say("Maybe Grombur knows more than me. The thing is he won't talk to me, and he will surely not accuse his best friend as a liar. What a dilemma!", cid)
		end
	elseif msgcontains(msg, "rerun") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 1 then
			npcHandler:say("He's a miner in the southern wing. Maybe he has lost the ring there... but even if I find the ring, no one will believe me. Someone should talk to Grombur. He's Rerun's best friend.", cid)
		end
	elseif msgcontains(msg, "rehal") then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 1 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 2)
			npcHandler:say("He's a good emperor but I doubt he is wise enough to see the truth behind that false accusation against me. If just someone would find out the truth about that whole mess.", cid)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "See you my friend.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you my friend.")
npcHandler:setMessage(MESSAGE_GREET, "You are....kind of tall! Hello.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
