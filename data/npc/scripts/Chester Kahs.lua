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
	if msgcontains(msg, 'gamel') and msgcontains(msg, 'rebel') then
		npcHandler:say('Are you saying that Gamel is a member of the rebellion?', cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Do you know what his plans are about?', cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 3 then
			if player:removeItem(2177, 1) then
				npcHandler:say('Thank you! Take this ring. If you ever need a healing, come, bring the scroll, and ask me to {heal}.', cid)
				player:addItem(2168, 1)
			else
				npcHandler:say('Sorry, but you have none.', cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(2168, 1) then
				npcHandler:say('So be healed!', cid)
				player:addHealth(player:getMaxHealth())
				Npc():getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			else
				npcHandler:say('Sorry, you are not worthy!', cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			player:setStorageValue(Storage.secretService.Quest, 1)
			npcHandler:say('Then I welcome you to the TBI. This is a great moment for you, remember it well. Talk to me about your missions whenever you feel ready.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then
			player:setStorageValue(Storage.secretService.TBIMission01, 3)
			player:setStorageValue(Storage.secretService.Quest, 3)
			npcHandler:say('I think they understood the warning the way it was meant. If not, you will have to visit Venore soon again. But for now it\'s settled.', cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			player:setStorageValue(Storage.secretService.TBIMission02, 3)
			player:setStorageValue(Storage.SecretService.Quest, 5)
			npcHandler:say('Thank you, we can finally let them have some closure regarding this.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('Then don\'t bother me with it. I\'m a busy man.', cid)
		elseif npcHandler.topic[cid] == 3 then
			npcHandler:say('Traitor!', cid)
			player:addCondition(fire)
			player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONHIT)
			Npc():getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			player:removeItem(2177, 1)
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		else
			npcHandler:say('As you wish.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif npcHandler.topic[cid] == 2 then
		if msgcontains(msg, 'magic') and msgcontains(msg, 'crystal') and msgcontains(msg, 'lugri') and msgcontains(msg, 'deathcurse') then
			npcHandler:say('That\'s terrible! Will you give me the crystal?', cid)
			npcHandler.topic[cid] = 3
		else
			npcHandler:say('Tell me precisely what he asked you to do! It\'s important!', cid)
		end
	elseif msgcontains(msg, 'heal') then
		npcHandler:say('Do you need the healing now?', cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, 'join') then
		if player:getStorageValue(Storage.secretService.Quest) < 1 then
			npcHandler:say({
				'Our bureau is an old and traditional branch of the Thaian government. It takes more than lip service to join our ranks ...',
				'Absolute loyalty to the crown and the Thaian cause as well as courage face-to-face with the enemy is the least we expect from our members ...',
				'You will swear allegiance to Thais alone and abandon the service of any other city. So is it really your wish to become one of our field agents?'
			}, cid)
			npcHandler.topic[cid] = 5
		end
	elseif msgcontains(msg, 'mission') then
		if player:getStorageValue(Storage.secretService.Quest) == 1 and player:getStorageValue(Storage.secretService.AVINMission01) == 0 and player:getStorageValue(Storage.secretService.CGBMission01) == 0 then
			player:setStorageValue(Storage.secretService.Quest, 2)
			player:setStorageValue(Storage.secretService.TBIMission01, 1)
			npcHandler:say({
				'Your first task is to deliver a warning. Illegally, the Venoreans are crafting more ships than the Thaian authorities have allowed them ...',
				'Our sources have told us that those ships often end up in the hands of pirates or smugglers ...',
				'An official note would strain the relationship between Thais and Venore too much as this would mean that we had to admit officially that we know about those activities ...',
				'Still, we can\'t allow them to continue like this. It will be your task to let them know that we do not tolerate such behaviour. Get a fire bug from Liberty Bay and set their shipyard on fire ...',
				'Use the fire bug on some flammable material there to start the fire. It might take a while to find some wood that\'s dry enough for the fire to spread. Just keep trying ... ',
				'If you get captured or killed during your mission, we will deny any contact with you.'
			}, cid)
		elseif player:getStorageValue(Storage.secretService.TBIMission01) == 2 then
			npcHandler:say('Have you fulfilled your current mission?', cid)
			npcHandler.topic[cid] = 6
		elseif player:getStorageValue(Storage.secretService.TBIMission01) == 3 and player:getStorageValue(Storage.secretService.Quest) == 3 then
			player:setStorageValue(Storage.secretService.Quest, 4)
			player:setStorageValue(Storage.secretService.TBIMission02, 1)
			npcHandler:say({
				'Your next mission concerns an internal matter for our agency. Some decades ago, one of our most talented field agents vanished in the Green Claw Swamp ...',
				'Nowadays, that more and more adventurers are swarming this area, there is an increasing number of reports on some sinister goings-on and mysterious ruins in the middle of the swamp ...',
				'We got some credible clues that there might be a connection between the ruins and the disappearance of our agent ...',
				'As he is already missing since decades it is unlikely that he is still alive. Nevertheless, we want you to find out something about the whereabouts of our agent in the ruins in the Green Claw Swamp, north west of Venore ...',
				'He used to write diaries, maybe you can find one of those, or some other hints, or even his remains. You have to understand that he was a member of a prestigious Thaian family. Very influential people are interested in his whereabouts ...',
				'The Green Claw Swamp is treacherous and dangerous. You will have a hard time to find any clues ...',
				'As a small incentive I think its worthy to mention that he was wearing a quite impressive armor. You may keep it for yourself if you stumble across it.'
			}, cid)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(Storage.secretService.TBIMission02) == 2 then
			npcHandler:say('Have you fulfilled your current mission?', cid)
			npcHandler.topic[cid] = 7
		elseif player:getStorageValue(Storage.secretService.TBIMission02) == 3 and player:getStorageValue(Storage.secretService.Quest) == 5 then
			player:setStorageValue(Storage.secretService.Quest, 6)
			player:setStorageValue(Storage.secretService.TBIMission03, 1)
			npcHandler:say({
				'One of our agents is missing. He was investigating the cause for the slow growth of our colony Port Hope ...',
				'You will continue these investigations at the point where the information that the lost agent has sent us ends. Some of the traders in Port Hope must have connections to persons who are interested in sabotaging our efforts in Tiquanda ...',
				'Search their personal belongings to find some sort of evidence that we could need!'
			}, cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
