local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end
function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end
function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end
function onThink()
	npcHandler:onThink()
end

local Topic = {}

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, "hail") or msgcontains(msg, "salutations") or msgcontains(msg, "king")) and (not npcHandler:isFocused(cid)) then
                npcHandler:say("I greet thee, my loyal subject "..getCreatureName(cid)..".", cid)
		npcHandler:addFocus(cid)
		Topic[talkUser] = 0
		return true
	end
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		selfSay("Good bye, "..getCreatureName(cid).."!", cid, TRUE)
		Topic[talkUser] = 0
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "job") then
		npcHandler:say("I am your sovereign, King Tibianus III, and it's my duty to uphold {justice} and provide guidance for my subjects.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "justice") then
		npcHandler:say("I try my best to be just and fair to our citizens. The army and the {TBI} are a great help in fulfilling this duty.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "name") then
		npcHandler:say("Preposterous! You must know the name of your own King!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "news") then
		npcHandler:say("The latest news is usually brought to our magnificent town by brave adventurers. They recount tales of their journeys at Frodo's tavern.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "tibia") or msgcontains(msg, "land") then
		npcHandler:say("Soon the whole land will be ruled by me once again!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "how") and msgcontains(msg, "are") and msgcontains(msg, "you") then
		npcHandler:say("Thank you, I'm fine.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "castle") then
		npcHandler:say("Rain Castle is my home.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "sell") then
		npcHandler:say("Sell? Sell what? My kingdom isn't for sale!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "god") then
		npcHandler:say("Honour the Gods and above all pay your {taxes}.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "zathroth") then
		npcHandler:say("Please ask a priest about the gods.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "citizen") then
		npcHandler:say("The citizens of Tibia are my subjects. Ask the old monk Quentin if you want to learn more about them.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "sam") then
		npcHandler:say("He is a skilled blacksmith and a loyal subject.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "frodo") then
		npcHandler:say("He is the owner of Frodo's Hut and a faithful tax-payer.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "gorn") then
		npcHandler:say("He was once one of Tibia's greatest fighters. Now he sells equipment.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "benjamin") then
		npcHandler:say("He was once my greatest general. Now he is very old and senile so we assigned him to work for the Royal Tibia Mail.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "harkath") or msgcontains(msg, "bloodblade") or msgcontains(msg, "general") then
		npcHandler:say("Harkath Bloodblade is the general of our glorious {army}.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "noodles") then
		npcHandler:say("The royal poodle Noodles is my greatest {treasure}!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "ferumbras") then
		npcHandler:say("He is a follower of the evil God Zathroth and responsible for many attacks on us. Kill him on sight!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "bozo") then
		npcHandler:say("He is my royal jester and cheers me up now and then.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "treasure") then
		npcHandler:say("The royal poodle Noodles is my greatest treasure!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "monster") then
		npcHandler:say("Go and hunt them! For king and country!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "help") then
		npcHandler:say("Visit Quentin the monk for help.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "quest") or msgcontains(msg, "mission") then
		npcHandler:say("I will call for heroes as soon as the need arises again and then reward them appropriately.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "gold") or msgcontains(msg, "money") or (msgcontains(msg, "tax") and not msgcontains(msg, "collector")) then
		npcHandler:say("To pay your taxes, visit the royal tax collector.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "sewer") then
		npcHandler:say("What a disgusting topic!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "dungeon") then
		npcHandler:say("Dungeons are no places for kings.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "equipment") then
		npcHandler:say("Feel free to buy it in our town's fine shops.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "food") then
		npcHandler:say("Ask the royal cook for some food.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "time") or msgcontains(msg, "hero") or msgcontains(msg, "adventurer") then
		npcHandler:say("It's a time for heroes!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "tax") and msgcontains(msg, "collector") then
		npcHandler:say("That tax collector is the bane of my life. He is so lazy. I bet you haven't payed any taxes at all.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "king") then
		npcHandler:say("I am the king, so watch what you say!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "army") then
		npcHandler:say("Ask the soldiers about that.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "enemy") or msgcontains(msg, "enemies") then
		npcHandler:say("Our enemies are numerous. The evil minotaurs, Ferumbras, and the renegade city of Carlin to the north are just some of them.", cid)
		Topic[talkUser] = 0
	elseif (msgcontains(msg, "city") and msgcontains(msg, "north")) or msgcontains(msg, "carlin") then
		npcHandler:say("They dare to reject my reign over the whole continent!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "thais") or msgcontains(msg, "city") then
		npcHandler:say("Our beloved city has some fine shops, guildhouses and a modern sewerage system.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "shop") then
		npcHandler:say("Visit the shops of our merchants and craftsmen.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "merchant") or msgcontains(msg, "craftsmen") then
		npcHandler:say("Ask around about them.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "guild") then
		npcHandler:say("The four major guilds are the knights, the paladins, the druids, and the sorcerers.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "minotaur") then
		npcHandler:say("Vile monsters, but I must admit they are strong and sometimes even cunning ... in their own bestial way.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "paladin") or msgcontains(msg, "elane") then
		npcHandler:say("The paladins are great protectors for Thais.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "knight") or msgcontains(msg, "gregor") then
		npcHandler:say("The brave knights are necessary for human survival in Thais.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "sorcerer") or msgcontains(msg, "muriel") then
		npcHandler:say("The magic of the sorcerers is a powerful tool to smite our enemies.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "druid") or msgcontains(msg, "marvik") then
		npcHandler:say("We need the druidic healing powers to fight evil.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "good") then
		npcHandler:say("The forces of good are hard pressed in these dark times.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "evil") then
		npcHandler:say("We need all strength we can muster to smite evil!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "order") then
		npcHandler:say("We need order to survive!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "chaos") then
		npcHandler:say("Chaos arises from selfishness.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "excalibug") then
		npcHandler:say("It's the sword of the Kings. If you return this weapon to me I will {reward} you beyond your wildest dreams.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "reward") then
		npcHandler:say("Well, if you want a reward, go on a quest to bring me Excalibug!", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "chester") then
		npcHandler:say("A very competent person. A little nervous but very competent.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "tbi") then
		npcHandler:say("This organisation is an essential tool for holding our enemies in check. Its headquarter is located in the bastion in the northwall.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "promot") then
		npcHandler:say("Do you want to be promoted in your vocation for 20000 gold?", cid)
		Topic[talkUser] = 1
	elseif msgcontains(msg, "yes") and Topic[talkUser] == 1 then
		if(getPlayerStorageValue(cid, 30018) == 1) then
			npcHandler:say('You are already promoted.', cid)
		elseif(getPlayerLevel(cid) < 20) then
			npcHandler:say('You need to be at least level 20 in order to be promoted.', cid)
		elseif getPlayerMoney(cid) < 20000 then
			npcHandler:say('You do not have enough money.', cid)
		elseif getConfigInfo("freePremium") == "yes" or isPremium(cid) == TRUE then
			npcHandler:say("Congratulations! You are now promoted. You have learned new spells.", cid)
			local promotedVoc = getPromotedVocation(getPlayerVocation(cid))
			doPlayerSetVocation(cid, promotedVoc)
			doPlayerRemoveMoney(cid, 20000)
		else
			npcHandler:say("You need a premium account in order to promote.", cid)
		end
		Topic[talkUser] = 0
	elseif Topic[talkUser] == 1 then
		npcHandler:say("Ok, whatever.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "eremo") then
		npcHandler:say("It is said that he lives on a small island near Edron. Maybe the people there know more about him.", cid)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "fan club membership") and getPlayerStorageValue(cid, 100000) == 15 and doPlayerTakeItem(cid, 10308, 1) then
	   	npcHandler:say("Ah, {A fan club premium membership card}! You must be that intelligent fellow who wrote me all those flattering letters! Nice to finally meet my greatest admirer in person. Here, take this little token of appreciation. ...",cid)
	   	npcHandler:say("And now if you will excuse me, I have to attend urgent affairs of state.",cid, 4000)
	   	setPlayerStorageValue(cid,100000, 16)
	   	doPlayerAddItem(cid,10306,1)
	   	setPlayerStorageValue(cid,100063, 24)
	   	AddStageExp(cid,100000)
		setPlayerStorageValue(cid,100162, 9)
	end
	if(msgcontains(msg, "farmine")) then
		if(getPlayerStorageValue(cid, 1015) == 15) then
			npcHandler:say("Ah, I vaguely remember that our little allies were eager to build some base. So speak up, what do you want?", cid)
			Topic[talkUser] = 2
		end
	elseif(msgcontains(msg, "flatter")) then
		if(Topic[talkUser] == 2) then
			if(getPlayerStorageValue(cid, 1022) < 1) then
				npcHandler:say("Indeed, indeed. Without the help of Thais, our allies stand no chance! Well, I'll send some money to support their cause.", cid)
				setPlayerStorageValue(cid, 1022, 1)
			end
		end
	end
	return TRUE
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "How rude!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
