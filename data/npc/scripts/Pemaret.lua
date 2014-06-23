local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m a fisherman and I take along people to Edron. You can also buy some fresh fish.'})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I\'m a fisherman and I take along people to Edron. You can also buy some fresh fish.'})
keywordHandler:addKeyword({'fish'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My fish is of the finest quality you could find. Ask me for a trade to check for yourself.'})
keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'It\'s a lovely and peaceful isle. Did you already visit the nice sandy beach?'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My name is Pemaret, the fisherman.'})

 --************************************************************Travel************************************************************************************************************
       

if luaFlags.freeBoats then	   

	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to get to Edron for free?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33176, y=31764, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})

	travelNode = keywordHandler:addKeyword({'eremo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oh, you know the good old sage Eremo. I can bring you to his little island. Do you want me to do that?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33314, y=31883, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})

else

	local travelNode = keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to get to Edron for 20 golds?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 20, destination = {x=33176, y=31764, z=6} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})

	travelNode = keywordHandler:addKeyword({'eremo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Oh, you know the good old sage Eremo. I can bring you to his little island. Do you want me to do that?'})
		travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33314, y=31883, z=7} })
		travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})


end	
 --***********************************************************Marlin*******************************************************************************************************


function creatureSayCallback(cid, type, msg)
	if(msgcontains(msg, "marlin")) then
		if(getPlayerItemCount(cid, 7963) >= 1) then
			npcHandler:say("WOW! You have a marlin!! I could make a nice decoration for your wall from it. May I have it?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(npcHandler.topic[cid] == 1) then
		if(getPlayerItemCount(cid, 7963) >= 1) then
			npcHandler:say("Yeah! Now let's see... <fumble fumble> There you go, I hope you like it! ", cid)
			doPlayerAddItem(cid, 7964, 1)
			doPlayerRemoveItem(cid, 7963, 1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You don't have the fish.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	if(msgcontains(msg, "no")) then
		npcHandler.topic[cid] = 0
		npcHandler:say("Then no.", cid)
	end
	return true
end

--***********************************************************Modules and Callbacks*******************************************************************************************************

 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
