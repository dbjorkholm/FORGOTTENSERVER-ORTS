local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 1060) == 2) then
			npcHandler:say("Mhm, what are you doing here. Who zent you? ", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 1060) == 3) then
			npcHandler:say("Zo are you ready to get zomezing done?", cid)
			talkState[talkUser] = 2
		elseif(getPlayerStorageValue(cid, 1060) == 5) then
			npcHandler:say("Zo? Did you find a way to reztore ze teleporter? ", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 1060) == 6) then
			npcHandler:say("You ezztablished zze connection to zze hideout, good. But zzizz izz no time to rezzt. Your new tazzk will be quite different. ... ", cid)
			npcHandler:say("Zze gardenzz are plagued by a creature. Zze former keeper of zzizz garden became an abomination of madnezz zzat needzz to be zztopped. ... ", cid)
			npcHandler:say("He hidezz deep underground and it will be dangerouzz to challenge him in hizz lair but I am willing to rizzk it. ... ", cid)
			npcHandler:say("Find him, dezztroy him, bring me hizz - I uhm, mean it izz utterly nezzezzary for you to deliver me a proof of hizz deazz. ... ", cid)
			npcHandler:say("Now go - what are you waiting for, zzoftzzkin? Ready to finish what needzz to be finished? ", cid)
			talkState[talkUser] = 4
		elseif(getPlayerStorageValue(cid, 1060) == 8) then
			npcHandler:say("Zzo... you finished him. Show me hizz head, will you? ", cid)
			talkState[talkUser] = 5
		elseif(getPlayerStorageValue(cid, 1060) == 9) then
			npcHandler:say("At zze dawn of time, zze children of zze Great Zznake were numerouzz. Zzey daringly colonizzed many partzz of zze world. But all bravery did not help againzzt zze sheer number of enemiezz zzey encountered. ... ", cid)
			npcHandler:say("And while zze entitiezz zze unbelieverzz call godzz battled for power out of vanity, zze fazze of zze world changed violently. ... ", cid)
			npcHandler:say("Many zzentrezz of our magnifizzent zzivilizzation were dezztroyed and only two realmzz zzat we know of remained intact but lozzt contact to each ozzer. ... ", cid)
			npcHandler:say("In vizzionzz, zze Great Zznake revealed to Zalamon zze exzzizztenzze of ozzer lizzard people in a vazzt jungle in a far away land. ...", cid)
			npcHandler:say("Zzough zze lizardzz of zze land failed zze Great Zznake and lozzt itzz favour, zzey are zztill in pozzezzion of ancient reliczz of immenzze power, onzze imbued by zze Great Zznake himzzelf. ... ", cid)
			npcHandler:say("I had vizzionzz of an - item. Yezz. It may be uzzeful for uzz - I mean you, ezzpecially you. ... ", cid)
			npcHandler:say("We need a zzeptre of power zzat can be found in zze underground of an ancient temple. It hazz been overrun by zzavage apezz and you will have to fight zzem and zze ancient guardianzz of zze temple azz well. Get uzz zzat zzeptre wherever it might be. ... ", cid)
			npcHandler:say("It wazz revealed zzat it hazz been zzplit into 3 partzz for reazzonzz zzat are of no importanzze anymore. Zzizz powerful devizze could help uzz in our battle againzzt zze emperor. ... ", cid)
			npcHandler:say("A shaft, a cuzzp, and an emerald form a zzeptre of zzuch power zzat zze partzz were hidden and are now guarded by vile creaturezz. ... ", cid)
			npcHandler:say("Find it. Retrieve it. And bring it back to me. ", cid)
			setPlayerStorageValue(cid, 1060, 10)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "zalamon")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("I zee. Zalamon zent word of ze arrival of a zoftzkin quite zome time ago. Zat muzt be you zen. ... ", cid)
			npcHandler:say("Well, I exzpected zomeone more - imprezzive. However, we will zee how far you can get. You've got newz from ze zouz? ... ", cid)
			npcHandler:say("Hm, I underztand. ... ", cid)
			npcHandler:say("Oh you did. ... ", cid)
			npcHandler:say("I zee. Interezting. ... ", cid)
			npcHandler:say("You being here meanz we have eztablished connectionz to ze zouz. Finally. And you are going to help uz. Well, zere iz zertainly a lot for you to do. Zo better get ztarted. ", cid)
			setPlayerStorageValue(cid, 1060, 3)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 2) then
			npcHandler:say("Alright. Well, az you might not be aware of it yet - we are on top of an old temple complex. It haz been abandoned and it haz crumbled over time. ...", cid)
			npcHandler:say("Ze teleporter over zere uzed to work juzt fine to get uz back to ze zouz. But it haz ztopped operating for quite zome time. ... ", cid)
			npcHandler:say("My men believe it iz a dizturbanze cauzed by ze corruption zat zpreadz everywhere. Zey are too zcared to go down zere. And zat'z where you come in. ... ", cid)
			npcHandler:say("Zere were meanz to activate teleporterz zomewhere in ze complex. But zinze you cannot reach all ze roomz, I guezz you will have to improvize. ... ", cid)
			npcHandler:say("Here iz ze key to ze entranze to ze complex. Figure zomezing out, reztore ze teleporter zo we can get back to ze plainz in ze zouz. ", cid)
			setPlayerStorageValue(cid, 1060, 4)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("You did it! Zere waz zome kind of zparkle and I zink it iz working again - oh pleaze feel free to try it, I uhm, I will wait here and be ready juzt in caze zomezing uhm happenz to you. ... ", cid)
			npcHandler:say("And if you head to Zalamon, be zure to inform him about our zituation. Food rationz are running low and we are ztill not well equipped. We need to eztablish a working zupply line. ", cid)
			setPlayerStorageValue(cid, 1060, 6)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 4) then
			npcHandler:say("Fine. I guezz poizzoning zzome of hizz plantzz will be enough to lure him out of hizz conzzealment. Zzizz plant poizzon here should allow you to do zzome zzignificant damage, take it. ... ", cid)
			npcHandler:say("You can find him eazzt of zze corrupted gardenzz. Zzere uzzed to be a zzmall domizzile zzere but it hazz probably been conzzumed by zze corruption zzo beware. And now - go. ", cid)
			setPlayerStorageValue(cid, 1060, 7)
			doPlayerAddItem(cid, 12320, 1)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 5) then
			if(getPlayerItemCount(cid, 12316) >= 1) then
				doPlayerRemoveItem(cid, 12316, 1)
				npcHandler:say("Zzizz izz not hizz head but clearly belonged to zze keeper. I - I am imprezzed. You can go now. Leave me alone for a zzecond. ", cid)
				setPlayerStorageValue(cid, 1060, 9)
				talkState[talkUser] = 0
			end
		end	
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())