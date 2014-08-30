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
function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, STORAGE_END) == 3) then
			npcHandler:say("Oh yez, let me zee ze documentz. Here we go: zree cheztz filled wiz platinum, one houze, a zet of elite armor, and an unending mana cazket. Iz ziz correct?", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Fine, zo let'z prozeed. You uzed forged documentz to enter our zity, killed zeveral guardz who enjoyed a quite excluzive and expenzive training, deztroyed rare magical devizez in ze pozzezzion of ze emperor. ...", cid)
			npcHandler:say("Ze good newz iz, your zree cheztz of platinum should be nearly enough to pay ze finez. Lucky you, ziz could have left you broke. ...", cid)
			npcHandler:say("Zere are alzo zertain noble familiez complaining about ze murder of zeveral of zeir beloved onez. ...", cid)
			npcHandler:say("I zink I can make a deal wiz ze noblez by zelling zem your property in ze zity. Your prezenze would ruin ze houze prizez zere anyway. ...", cid)
			npcHandler:say("Of courze zat will not zuffize to compenzate zeir grief, zo I guezz you'll have to part wiz zat elite armor, too. Zadly, prizez for armor are on an all time low right now. ...", cid)
			npcHandler:say("But luckily you ztill have zat mana cazket. Well, you had it. Now we have to zell it. ...", cid)
			npcHandler:say("But not all iz lozt my blank-zkinned vizitor. According to my calculationz, zere iz ztill a bit left. ...", cid)
			npcHandler:say("I zink we can zave you zome gold and zome treazurez, and you can keep one pieze of your elite armor at leazt. ...", cid)
			npcHandler:say("You will find your rewardz in one of ze old zupply zellarz. Beware of ze ratz zough. ...", cid)
			npcHandler:say("Ze rednezz of your faze and ze zound you make wiz your teez iz obviouzly a zign of gratitude of your zpeziez! I am flattered, but pleaze leave now az I have to attend to zome important buzinezz. ", cid)
			setPlayerStorageValue(cid, STORAGE_END, 4)
			talkState[talkUser] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
