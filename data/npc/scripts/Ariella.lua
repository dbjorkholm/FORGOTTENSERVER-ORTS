local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

function PirateSecond(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
	local p = Player(cid) 
	if(p:getStorageValue(22034) ~= -1) then
		if(p:getItemCount(6101) >= 1 and p:getItemCount(6102) >= 1 and p:getItemCount(6100) >= 1 and p:getItemCount(6099) >= 1) then
			if(p:removeItem(6101, 1) and p:removeItem(6102, 1) and p:removeItem(6100, 1) and p:removeItem(6099, 1)) then
				npcHandler:say("Ah, right! The pirate hat! Here you go.", cid)             
				p:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				p:setStorageValue(22034, 1)
				local outfit = p:getSex() == 0 and 155 or 151
				p:addOutfitAddon(addon, 2)
				npcHandler:say("Ah, right! The pirate hat! Here you go.", cid)
			end
		else
			npcHandler:say("You do not have all the required items.", cid)
		end
	else
		npcHandler:say("It seems you already have this addon, don\'t you try to mock me son!", cid)
	end
end

node1 = keywordHandler:addKeyword({'hat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate hat you need give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
node1:addChildKeyword({'yes'}, PirateSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate hat you need give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
node2:addChildKeyword({'yes'}, PirateSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())
