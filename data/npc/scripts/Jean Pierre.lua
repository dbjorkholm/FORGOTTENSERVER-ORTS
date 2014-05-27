local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local cfg_ingredients = {
	[1] = {{2666, 2}, {8838, 20}, {8843, 1}, {9114, 1}, {2692, 5}, {2006, 2, 3}},
	[2] = {{7250, 2}, {2685, 2}, {8842, 1}, {2328, 2}, {2805, 5}, {2006, 1, 15}}
}

local function playerHasIngredients(cid)
	local player = Player(cid)
	local table = cfg_ingredients[player:getStorageValue(50023)]
	if table ~= nil then
		for i = 1, #table do
			local itemCount = player:getItemCount(table[i][1], table[i][3] or -1)
        		if itemCount < table[i][2] then
                		itemCount = table[i][2] - itemCount
				return false
			end
       		end
	end
	for i = 1, #table do
        	player:removeItem(unpack(table[i]))
	end
	return true
end


local function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(50022) < 1 then
		npcHandler:setMessage(MESSAGE_GREET, "Greetings, "..player:getName()..". What are you doing out here?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello there again, "..player:getName().."! I guess you're back for some cooking - let's get going then!")
	end	
	return true
end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "cook") then
		if player:getStorageValue(50022) < 1 then
			npcHandler:say("Well, I'm not a simple cook. I travel the whole Tibian continent for the most artfully seasoned {recipes} and constantly develop new ones.", cid)
			npcHandler.topic[cid] = 1	
		end
	elseif msgcontains(msg, "recipe") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("You're interested in my recipes? Well. They are not for sale, but if you want to become my {apprentice}, I'll share my knowledge with you.", cid)
			npcHandler.topic[cid] = 2
		end
		if player:getStorageValue(50022) == 1 then
			if player:getStorageValue(50023) == 1 then
				npcHandler:say({"The first dish we are going to prepare together is called {Rotworm Stew}. Now, don't be scared off. Of course we won't eat those nasty and dirty earth-crawlers! ...",
						"The name is just for the effect it has on people. <winks> Bring me the following ingredients and I'll show you how it's done. ...",
						"Two pieces of meat, two vials of beer, twenty potatoes, one onion, one bulb of garlic and five ounces of flour. Make sure that the ingredients are fresh and smell good."
						}, cid, 0, 1, 4000)
				npcHandler.topic[cid] = 4
			elseif player:getStorageValue(50023) == 2 then
				npcHandler:say({"The next dish we are going to prepare together is called {Hydra Tongue Salad}. The common hydra tongue is a pest plant with an surprisingly aromatic taste. ...",
						"We'll add some other vegetables and spices for the delicate and distinctive taste. Bring me the following ingredients and I'll show you how it's done. ...",
						"Two hydra tongue plants, two tomatoes, one cucumber, two eggs, one troll green and one vial of wine."
						}, cid, 0, 1, 4000)
				npcHandler.topic[cid] = 6
			end
		end
	elseif msgcontains(msg, "apprentice") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("Hmm. You look quite promising. Can't hurt to give it a try, I guess. Would you like to become my apprentice, "..player:getName().."?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 3 then
			npcHandler:say("Fine, young human. Ask me for a {recipe} anytime and I'll teach you what I know.", cid)
			player:setStorageValue(50022, 1)
			player:setStorageValue(50023, 1)
		elseif npcHandler.topic[cid] == 5 then
			if playerHasIngredients(cid) then
				npcHandler:say({"Aah, so let's see! <prepares the food quickly while he explains it to you> We cook the meat in a large pot together with the chopped onion until it's separated from the bones. Now we also have a fine meat broth! ...",
						"Cut the potatoes into small pieces and add them to the pot. Add some flour to thicken the stew. Finally, spice it up with some garlic and add beer for the typical dwarvish taste! ...",
						"And voilà, we're done. I developed this recipe while talking to Maryza in the Jolly Axeman. She said to eat it when one's health is low. Enjoy!"
						}, cid, 0, 1, 4000)
				player:setStorageValue(50023, 2)	
				player:addItem(9992, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Make sure that you have all the ingredients, with you.", cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 7 then
			if playerHasIngredients(cid) then
				npcHandler:say({"Okay, here we go! <cuts the ingredients so fast that his hands seem almost blurry> This one is easy, just chop the hydra tongues, tomatoes and cucumber into tiny pieces. ...",
						"Now for the sauce - our base is wine, in which we mix the raw eggs until it got a nice smooth consistency. Add grinded troll green, whose flavour is quite similar to basil and shake the sauce in a mug. ...",
						"Pour it over the salad, and voilà, we're done! This is a Venorean recipe and very tasty. I recommend eating it when you're suffering from some kind of dangerous condition. Enjoy!"
						}, cid, 0, 1, 4000)
				player:setStorageValue(50023, 3)
				player:addItem(9993, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Make sure that you have all the ingredients, with you.", cid)
				npcHandler.topic[cid] = 0
			end				
		end
	--Dishes
	elseif msgcontains(msg, "rotworm stew") then
		if npcHandler.topic[cid] == 4 then
			npcHandler:say("Did you gather all necessary ingredients to cook Rotworm Stew with me?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, "hydra tongue salad") then
		if npcHandler.topic[cid] == 6 then
			npcHandler:say("Did you gather all necessary ingredients to prepare a Hydra Tongue Salad with me?", cid)
			npcHandler.topic[cid] = 7
		end	
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())