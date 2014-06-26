local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 1060) == 27) then
			npcHandler:say("You made it! Az zoon az you are prepared, I will brief you for your nexzt mizzion. ", cid)
			setPlayerStorageValue(cid, 1060, 28)
			npcHandler.topic[cid] = 0
		elseif(getPlayerStorageValue(cid, 1060) == 28) then
			npcHandler:say("Ze dragon emperor controlz ze whole empire wiz hiz willpower. But even he iz not powerful enough to uze ziz control continuouzly wizout zome form of aid. ... ", cid)
			npcHandler:say("Wiz ze ancient zeptre zat you acquired for uz earlier, I can charge ozer zeptrez wiz azpectz of power of ze Great Znake. If you manage to touch one of ze tranzmitter cryztalz wiz ze zeptre, itz godly power will realign ze cryztal. ...", cid)
			npcHandler:say("Not only will ze cryztal ztop zending ze orderz of ze emperor into ze mindz of my opprezzed people, it will alzo zend a mezzage of freedom and zelf-rezpect inztead. ...", cid)
			npcHandler:say("Dizabling ze cryztalz will probably alert ze emperor. It will likely be too late for him to intervene in perzon but a creature of hiz power might have ozer wayz to intervene. ...", cid)
			npcHandler:say("But zere iz more. To reach ze emperor, you will need accezz to hiz inner realmz. Ze zecret to enter iz guarded by a dragon. ...", cid)
			npcHandler:say("But ziz iz not ze catch - ze catch iz, zat ze key iz buried in hiz vazt mind. Ze emperor haz bound ze dragon to himzelf, forzing him into an eternal zlumber. ...", cid)
			npcHandler:say("A zignificant part of ze emperor'z power iz uzed to reztrain ze dragon. Ze only way to free him will be to enter hiz dreamz. Are you prepared for ziz?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, 1060) == 31) then
			npcHandler:say("You freed ze dragon! And you pozzezz ze key to enter ze inner realmz of ze emperor, well done. ...", cid)
			npcHandler:say("Now you are ready to reach ze inner zanctum of ze emperor. Zalamon'z revelationz showed him zat zere are four cryztalz channelling ze will of ze emperor into ze land. ...", cid)
			npcHandler:say("Wiz ze relic you gained from Zalamon we were able to create powerful replicaz of ze zeptre. Take ziz wiz you. ...", cid)
			npcHandler:say("You will have to realign ze cryztalz one after ze ozer. Ztart wiz ze one in ze norz-wezt and work your way clockwize zrough ze room. ...", cid)
			npcHandler:say("Uzing ze zeptre will forze a part of ze emperor'z willpower out of ze cryztal. You will have to kill zoze manifeztationz. ...", cid)
			npcHandler:say("Zen uze your zeptre on ze remainz to deztroy ze emperor'z influenze over ze cryztal. ...", cid)
			npcHandler:say("I recommend not to go alone becauze it will be very dangerouz - but ALL of you will have to uze zeir zeptre replicaz on ze emperor'z remainz to prozeed! ...", cid)
			npcHandler:say("Good luck. You will need it. ", cid)
			setPlayerStorageValue(cid, 1060, 32)
			setPlayerStorageValue(cid, 1090, 1)
			doPlayerAddItem(cid, 12318, 1)
			npcHandler.topic[cid] = 0
		elseif(getPlayerStorageValue(cid, 1060) == 35) then
			npcHandler:say("Oh yez, let me zee ze documentz. Here we go: zree cheztz filled wiz platinum, one houze, a zet of elite armor, and an unending mana cazket. Iz ziz correct?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Didn't exzpect anyzing lezz from you. Alright, zankz to your effortz to build an effective reziztanze, our comradez zalvaged ziz potion and ze formula you need to utter to breach hiz zubconzciouznezz. ...", cid)
			npcHandler:say("Drink it and when you are cloze to ze dragon zpeak: Z...z.. well, juzt take ze sheet wiz ze word and read it yourzelf. A lot of rebelz have died to retrieve ziz information, uze it wizely. ...", cid)
			npcHandler:say("Now go and try to find a way to reach ze emperor and to free ze land from it'z opprezzor. Onze you have found a way, return to me and I will explain what to do wiz ze cryztalz. May ze Great Znake guide you! ", cid)
			setPlayerStorageValue(cid, 1060, 29)
			doPlayerAddItem(cid, 12328, 1)
			doPlayerAddItem(cid, 12382, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 3) then
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
			setPlayerStorageValue(cid, 1060, 36)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
