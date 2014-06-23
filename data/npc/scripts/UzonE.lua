local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)      end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                     npcHandler:onThink()                     end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known as Uzon Ibn Kalith."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a licensed Darashian carpetpilot. I can bring you to Darashia or Edron."})
keywordHandler:addKeyword({'caliph'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
keywordHandler:addKeyword({'kazzan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The caliph welcomes travellers to his land."})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Oh, there is so much to tell about Daraman. You better travel to Darama to learn about his teachings."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I would never transport this one."})
keywordHandler:addKeyword({'drefia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So you heared about haunted Drefia? Many adventures travel there to test their skills against the undead: vampires, mummies, and ghosts."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Some people claim it is hidden somewhere under the endless sands of the devourer desert in Darama."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Thais is noisy and overcroweded. That's why I like Darashia more."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have seen almost every place on the continent."})
keywordHandler:addKeyword({'continent'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I could retell the tales of my travels for hours. Sadly another flight is scheduled soon."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Just another Thais but with women to lead them."})
keywordHandler:addKeyword({'flying'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy flying carpets only in Darashia."})
keywordHandler:addKeyword({'fly'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I transport travellers to the continent of Darama for a small fee. So many want to see the wonders of the desert and learn the secrets of Darama."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
keywordHandler:addKeyword({'rumors'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard too many news to recall them all."})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'transport'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'ride'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can fly you to Darashia on Darama or Edron if you like. Where do you want to go?"})


 --************************************************************INQUISITION!************************************************************************************************************

local function creatureSayCallback(cid, type, msg)
	local player = Player( cid )

	if (msgcontains(msg, 'back') or msgcontains(msg, 'eclipse') or msgcontains(msg, 'leave')) then
		npcHandler:say('Oh no, so the time has come? Do you really want me to fly you to this unholy place?', cid)
		npcHandler.topic[cid] = 1
		
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then	
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x=32535, y=31837, z=4})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)				
			npcHandler:say('So be it!', cid)
		end
	end
	
	return true
end	

 --***********************************************************Modules and Callbacks*******************************************************************************************************

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())