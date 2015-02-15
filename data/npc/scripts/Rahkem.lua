local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Please, not so loud, not so loud. Some of us are trying to rest in peace here.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

-- Wooden Stake
keywordHandler:addKeyword({'wooden stake'}, StdModule.say, {npcHandler = npcHandler, text = 'I think you have forgotten to bring your stake, pilgrim.'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 8 and player:getItemCount(5941) == 0 end)

local stakeKeyword = keywordHandler:addKeyword({'wooden stake'}, StdModule.say, {npcHandler = npcHandler, text = 'Yes, I was informed what to do. Are you prepared to receive my line of the prayer?'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 8 end)
	stakeKeyword:addChildKeyword({'yes'}, StdModule.say, {npcHandler = npcHandler, text = 'So receive my prayer: \'Let there be power and compassion\'. Now, bring your stake to Brewster in Port Hope for the next line of the prayer. I will inform him what to do.', reset = true}, nil,
		function(player) player:setStorageValue(Storage.FriendsandTraders.TheBlessedStake, 9) player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE) end
	)
	stakeKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'I will wait for you.', reset = true})

keywordHandler:addKeyword({'wooden stake'}, StdModule.say, {npcHandler = npcHandler, text = 'You should visit Brewster in Port Hope now.'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 9 end)
keywordHandler:addKeyword({'wooden stake'}, StdModule.say, {npcHandler = npcHandler, text = 'You already received my line of the prayer.'}, function(player) return player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) > 9 end)
keywordHandler:addKeyword({'wooden stake'}, StdModule.say, {npcHandler = npcHandler, text = 'A blessed stake? That is a strange request. Maybe Quentin knows more, he is one of the oldest monks after all.'})

npcHandler:addModule(FocusModule:new())
