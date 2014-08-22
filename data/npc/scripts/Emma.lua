local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local fire = Condition(CONDITION_FIRE)
fire:setParameter(CONDITION_PARAM_DELAYED, true)
fire:setParameter(CONDITION_PARAM_FORCEUPDATE, true)
fire:addDamage(25, 9000, -10)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue(Storage.secretService.Quest, 1)
			npcHandler:say('I am still a bit sceptical, but well, welcome to the girls brigade.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 then
			if player:removeItem(8190, 1) then
				player:setStorageValue(Storage.secretService.CGBMission01, 2)
				player:setStorageValue(Storage.secretService.Quest, 3)
				npcHandler:say('How unnecessarily complicated, but that\'s the way those Thaians are. In the end we got what we wanted and they can\'t do anything about it.', cid)
			else
				npcHandler:say('Bring me the spellbook.', cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			player:setStorageValue(Storage.secretService.CGBMission02, 3)
			player:setStorageValue(Storage.secretService.Quest, 5)
			npcHandler:say('I think the druids will be pleased to hear that the immediate threat has been averted.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			player:setStorageValue(Storage.secretService.AVINMission03, 3)
			player:setStorageValue(Storage.secretService.Quest, 7)
			npcHandler:say('Does it not warm up your heart if you can bring a little joy to the people while doing your job? Well, don\'t get carried away, most part of your job is not warming up hearts but tearing them out.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			player:setStorageValue(Storage.secretService.AVINMission04, 3)
			player:setStorageValue(Storage.secretService.Quest, 9)
			npcHandler:say('Good work getting rid of that nuisance.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then
			if player:removeItem(7708, 1) then
				player:setStorageValue(Storage.secretService.AVINMission05, 2)
				player:setStorageValue(Storage.secretService.Quest, 11)
				npcHandler:say('Fine, fine. This will serve us quite well. Ah, don\'t give me that look... you are not that stupid, are you?', cid)
			else
				npcHandler:say('Come back when you\'ve found the ring.', cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			player:setStorageValue(Storage.secretService.AVINMission06, 3)
			player:setStorageValue(Storage.secretService.Quest, 13)
			npcHandler:say('Even if the present has not improved our relations, the weapons will enable the barbarians to put more pressure on Svargrond and Carlin. So in any case we profited from the present.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 8 then
			if player:removeItem(7699, 1) then
				player:setStorageValue(Storage.secretService.Mission07, 2)
				player:setStorageValue(Storage.secretService.Quest, 15)
				player:addItem(7962, 1)
				npcHandler:say({
				'You have proven yourself as very efficient. The future may hold great things for you in store ...',
				'Take this token of gratitude. I hope you can use well what you will find inside!'
				}, cid)
			else
				npcHandler:say('Please bring me proof of the mad technomancers defeat!', cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') then
		npcHandler:say('As you wish.', cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'join') then
		if player:getStorageValue(Storage.secretService.Quest) < 1 then
			npcHandler:say({
				player:getSex() == 0 and 
				'The girls brigade is the foremost front on which we fight the numerous enemies of our city ...',
				'It\'s a constant race to stay ahead of our enemies. Absolute loyalty and the willingness to put ones life at stake are attributes that are vital for this brigade ...',
				'If you join, you dedicate your service to Carlin alone! Do you truly think that you are girl enough to join the brigade?'
				or
				'A man in the girls brigade? Come on this is hilarious, this is outright stupid, this is ...'
				'exactly what no one would expect. Mhm, on second thought the element of surprise might offset your male inferiority.'
				'If you join, you dedicate your service to Carlin alone! Do you truly think that you are girl enough to join the brigade?'
			}, cid)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, 'mission') then
		if player:getStorageValue(Storage.secretService.Quest) == 1 and player:getStorageValue(Storage.secretService.TBIMission01) == 0 and player:getStorageValue(Storage.secretService.CGBMission01) == 0 then
			player:setStorageValue(Storage.secretService.Quest, 2)
			player:setStorageValue(Storage.secretService.CGBMission01, 1)
			npcHandler:say({
			'Our relations with Thais can be called strained at best. Therefore, it\'s not really astounding that the Thaian financed Edron\'s academy but refuse to share some knowledge with our druids ..',
			'But we won\'t accept this so easily. With the help of divination, we learnt that the knowledge our druids are looking for is found in a certain book ...',
			'It will be your task to enter the academy and to steal this book for us.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.CGBMission01) == 1 then
			npcHandler:say('Have you been successful?', cid)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue(Storage.secretService.CGBMission01) == 2 and player:getStorageValue(Storage.secretService.Quest) == 3 then
			player:setStorageValue(Storage.secretService.Quest, 4)
			player:setStorageValue(Storage.secretService.CGBMission02, 1)
			npcHandler:say({
				'The druids have asked the brigade for a favour. Given that we heavily rely on their resources and they are important supporters of our cities, we can\'t deny them the request ...',
				'A wandering druid has recently visited the Green Claw Swamp, located north west of that corrupted hell hole Venore. While gathering herbs, he noticed some malignant presence in the said area ...',
				'Searching for the source of evil there, he detected some old ruin. Suddenly, he was attacked by bonelords and their undead minions. He barely managed to escape alive ...',
				'The evidence he found let him conclude that the bonelords in the ruins were raising so-called death trees.These trees are full of negative energy and slowly but steadily corrupt their surrounding ...',
				'After the druid\'s return to Carlin, divination confirmed his upsetting assumptions about the existence of these trees ...',
				'Over the years, hundreds have fallen victim to the swamp, conserved by mud and water for eternity. With the help of the death trees, the bonelords strive for an army of undeads. This cannot be tolerated ...',
				'Travel to Green Claw Swamp and rip out the heart out of the master tree. Without it, the unnatural trees will wither soon. Bring me the heart as proof.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.CGBMission02) == 2 then
			npcHandler:say('Have you been successful?', cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(Storage.secretService.AVINMission02) == 2 and player:getStorageValue(Storage.secretService.Quest) == 5 then
			player:setStorageValue(Storage.secretService.Quest, 6)
			player:setStorageValue(Storage.secretService.AVINMission03, 1)
			player:addItem(7706, 1)
			npcHandler:say({
				'The oppression of Carlin\'s men by their lunatic women is unbearable to some of our authorities. We see it as our honourable duty to support the male resistance in Carlin ...',
				'The poor guys have some speakeasy in the sewers. Bring them this barrel of beer with our kind regards to strengthen their resistance.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.AVINMission03) == 2 then
			npcHandler:say('Do you have news to make old Uncle happy?', cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(Storage.secretService.AVINMission03) == 3 and player:getStorageValue(Storage.secretService.Quest) == 7 then
			player:setStorageValue(Storage.secretService.Quest, 8)
			player:setStorageValue(Storage.secretService.AVINMission04, 1)
			npcHandler:say({
				'As you know, our lovely city is a bastion of civilisation surrounded by numerous hazards. The nearby Plains of Havoc and the hostile elven town Shadowthorn are only a few of the obstacles we have to overcome on an almost daily basis ...',
				'Against all odds, we managed to gain some modest profit by exploiting these circumstances in one way or the other. Recently though, one of our neighbours went too far...',
				'In some ruin in the midst of the Green Claw Swamp, a dark knight had fancied himself as the lord of the swamp for quite a while ...',
				'For some years, we had some sort of gentleman\'s agreement. In exchange for some supplies and luxuries, the deranged knight used his ominous influence over the local bonelord species to supply us with ... certain goods ...',
				'However, lately the black knight has proven himself to be no gentleman at all. In a fit of unprovoked rage, he slew our emissary and almost all of his henchmen ...',
				'Even though we can live with this loss, it becomes obvious that the knight\'s madness gets worse which makes him unbearable as a neighbour. Find him in his hideout in the Green Claw Swamp and get rid of him.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.AVINMission04) == 2 then
			npcHandler:say('Do you have news to make old Uncle happy?', cid)
			npcHandler.topic[cid] = 5
		elseif player:getStorageValue(Storage.secretService.AVINMission04) == 3 and player:getStorageValue(Storage.secretService.Quest) == 9 then
			player:setStorageValue(Storage.secretService.Quest, 10)
			player:setStorageValue(Storage.secretService.AVINMission05, 1)
			npcHandler:say('I need you to locate a lost ring on the Isle of the Kings for me, get back to me once you have it.', cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.AVINMission05) == 1 then
			npcHandler:say('Do you have news to make old Uncle happy?', cid)
			npcHandler.topic[cid] = 6
		elseif player:getStorageValue(Storage.secretService.AVINMission05) == 2 and player:getStorageValue(Storage.secretService.Quest) == 11 then
			player:setStorageValue(Storage.secretService.Quest, 12)
			player:setStorageValue(Storage.secretService.AVINMission06, 1)
			player:addItem(7707, 1)
			npcHandler:say({
				'We try to establish new trade agreements with various potential customers. Sometimes we have to offer some presents in advance to ensure that trade is prospering and flourishing. It will be your task to deliver one of those little presents ...',
				'The northern barbarians are extremely hostile to us. The ones living in Svargrond are poisoned by the lies of agitators from Carlin. The barbarians that are also known as raiders are another story though ...',
				'Of course they are extremely wild and hostile but we believe that we will sooner or later profit from it when we are able to improve our relations. Please deliver this chest of weapons to the barbarians as a sign of our good will ...',
				'Unfortunately, most of them will attack you on sight. It will probably take some time until you find somebody that is willing to talk to you and to accept the weapons.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.AVINMission06) == 2 then
			npcHandler:say('Do you have news to make old Uncle happy?', cid)
			npcHandler.topic[cid] = 7
		elseif player:getStorageValue(Storage.secretService.AVINMission06) == 3 and player:getStorageValue(Storage.secretService.Quest) == 13 then
			player:setStorageValue(Storage.secretService.Quest, 14)
			player:setStorageValue(Storage.secretService.Mission07, 1)
			npcHandler:say({
				'Some dwarven criminal called Blowbeard dares to blackmail our city. He threatens to destroy the whole city and demands an insane amount of gold ...',
				'Of course we are not willing to give him a single gold coin. It will be your job to get rid of this problem. Go and kill this infamous dwarf ...',
				'His laboratory is near the technomancer hall. Bring me his beard as proof of his demise.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.AVINMission06) == 3 and player:getStorageValue(Storage.secretService.Mission07) == 1 then
			npcHandler:say('Do you have news to make old Uncle happy?', cid)
			npcHandler.topic[cid] = 8
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
