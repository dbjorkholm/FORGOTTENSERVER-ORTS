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
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if(msgcontains(msg, "mission")) then
		-- CHILDREN OF REVOLUTION QUEST
		if(getPlayerStorageValue(cid, 1050) < 1) then
			npcHandler:say("Zzo you are offering your help to a lizzard? Hmm, unuzzual. I don't know if I can fully truzzt you yet. ...", cid)
			npcHandler:say("You'll have to work to earn my truzzt. Are you zzure you want to offer me your help?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, 1050) == 2) then
			npcHandler:say("What newzz do you bring? Did you find any cluezz about zzeir whereaboutzz? ", cid)
			talkState[talkUser] = 3
		elseif(getPlayerStorageValue(cid, 1050) == 3) then
			npcHandler:say("Zzurely you have zzeen zze black pondzz and puddlezz all over zze mountain pazz, palezzkin. It izz zze corruption zzat pervadezz zze landzz. It would be wizze not to drink or tazzte from zzem. ... ", cid)
			npcHandler:say("It zzoakzz zze land, itzz people and even zze air itzzelf. But zzere are zztill zzpotzz not tainted by zze darknezz. ... ", cid)
			npcHandler:say("A temple, norzzwezzt of zze barricaded outpozzt wizztood zze evil influenzze. However, I lozzt contact to itzz inhabitantzz when zze lizzardzz tightened zzeir grip. ... ", cid)
			npcHandler:say("No one made it zzrough zze mountainzz for quite zzome time now - exzzept you. Maybe you can find out what happened zzere? ", cid)
			talkState[talkUser] = 5
		elseif(getPlayerStorageValue(cid, 1050) == 5) then
			npcHandler:say("Zzo you found zze temple... lozzt you zzay. It wazz our lazzt remaining bazztion of hope for help from wizzin zze plainzz. ... ", cid)
			npcHandler:say("Zzat meanzz zze plainzz are now in zze handzz of zze emperor and hizz army. I'm afraid zzat even zze great gate izz zzealed and zze landzz beyond it tainted azz well. ... ", cid)
			npcHandler:say("Dark timezz, and I fear we know nozzing about our enemy yet. ", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 1050, 6)
		elseif(getPlayerStorageValue(cid, 1050) == 6) then
			npcHandler:say("Large partzz of zze empire are tainted. I zzee now zzat zzere izz almozzt nozzing left of our onzze zzo zztrong zzivilizzation. But I zztill don't know which danger our enemy really pozzezz. ... ", cid)
			npcHandler:say("Zzere uzzed to be a remote and quiet zzettlement in zze middle of zze valley. If it hazz not been dezztroyed by zze corruption, I'm zzure zze army of zze emperor will have confizzcated it to gazzer rezzourzzezz. ... ", cid)
			npcHandler:say("If you can get inzzide zze village, find out anyzzing you can about zzeir zzituation. Zze clever hawk hidezz itzz clawzz. ... ", cid)
			npcHandler:say("I'm mozzt interezzted in zzeir weaponzz, food and zze zztrengzz of zzeir forzzezz. ... ", cid)
			npcHandler:say("Are you prepared for zzizz mizzion? ", cid)
			talkState[talkUser] = 6
		elseif(getPlayerStorageValue(cid, 1050) == 7) then
			if(getPlayerStorageValue(cid, 1055) == 1 and getPlayerStorageValue(cid, 1056) == 1 and getPlayerStorageValue(cid, 1057) == 1) then
				npcHandler:say("Zzizz izz mozzt unfortunate. Zzo many warriorzz? Large amountzz of food? And how many weaponzz did you zzay? I zzee, hmm. ... ", cid)
				npcHandler:say("Direct confrontation izz futile. We'll have to find ozzer wayzz to approach zze emperor and hizz army. ", cid)
				setPlayerStorageValue(cid, 1050, 8)
				talkState[talkUser] = 0
			end
		elseif(getPlayerStorageValue(cid, 1050) == 8) then
			npcHandler:say("Your lazzt excurzzion revealed a terrifying truzz. Zze enemy'zz forzzezz are overwhelming, zzeir zztrengzz probably unrivaled. We cannot attack an army of zzizz zzize unlezz - unlezz we zzin out zzeir rankzz a little. ... ", cid)
			npcHandler:say("A zzingle individual can be azz zztrong azz an army if he zztrikezz zze army azz a whole. ... ", cid)
			npcHandler:say("Are you ready for your nexzzt tazzk? ", cid)
			talkState[talkUser] = 7
		elseif(getPlayerStorageValue(cid, 1050) == 11) then
			npcHandler:say("You accomplished an important tazzk in breaking zze defenzze of zze emperor. Not everyzzing might be lozzt yet. ... ", cid)
			npcHandler:say("I've got anozzer mizzion for you which will be even more dangerouzz zzan zze lazzt one. Return to me when you're ready. ", cid)
			talkState[talkUser] = 0
			setPlayerStorageValue(cid, 1050, 12)
		elseif(getPlayerStorageValue(cid, 1050) == 12) then
			npcHandler:say("Wizz zze enemy'zz forzzezz weakened like zzizz, we will be able to zzneak pazzt zze defenzze and furzzer inzzpect zze norzz. You should travel to zze mountain range furzzer eazzt of zze village. ... ", cid)
			npcHandler:say("Zze old route to zze gate hazz been taken by darknezz. You'll have to find ozzer wayzz. Are you up to zzizz, palezzkin? ", cid)
			talkState[talkUser] = 10
		elseif(getPlayerStorageValue(cid, 1050) == 17) then
			npcHandler:say("You have zzolved zze riddle? Imprezzive, palezzkin. Zze humming you hear in zze chamber mozzt zzertainly comezz from a magic portal zzomewhere in zze temple. ...", cid)
			npcHandler:say("Have you zzearched zze ozzer chamberzz for any magical devizzezz or portalzz?", cid)
			talkState[talkUser] = 12
		elseif(getPlayerStorageValue(cid, 1050) == 18) then
			npcHandler:say("If I'm correct, zze portal in zze chamber beyond zze mechanizzm will lead you to zze great gate. It izz perfectly pozzible, however, zzat you will not be tranzzported directly into zze area. ...", cid)
			npcHandler:say("You will razzer be brought to a plazze clozze by your goal. Where exzzactly, I cannot zzay. ...", cid)
			npcHandler:say("Take all your courage and walk zze pazz zzrough zze portal. At leazzt TRY it - after all, I didn't make you my pupil for nozzing, Kohei. Are you prepared?", cid)
			talkState[talkUser] = 13
		elseif(getPlayerStorageValue(cid, 1050) == 20) then
			npcHandler:say("Too clozze, far too clozze. I felt a huge impact not long after you left. Zze war machinery of zze emperor muzzt finally have been zztarted. ...", cid)
			npcHandler:say("I focuzzed and could only hope zzat I would reach you before everyzzing wazz too late. If I hadn't been able to tranzzport you here, our cauzze would have been lozzt. ...", cid)
			npcHandler:say("I'm afraid we cannot continue zzizz fight here today. Zze rezzizztanzze izz zztill fragile. I'm afraid, zzere izz zztill much left to do. We'll have to prepare for war. ...", cid)
			npcHandler:say("You've helped uzz a great deal during zzezze dark hourzz, I've got zzomezzing for you my friend. Pleazze, take zzizz zzerpent crezzt azz a zzign of my deep rezzpect. ...", cid)
			npcHandler:say("Rezzt for now, you will need it - you have earned it.", cid)
			setPlayerStorageValue(cid, 1050, 21)
			talkState[talkUser] = 0
		-- CHILDREN OF REVOLUTION QUEST
			
		-- WRATH OF THE EMPEROR QUEST
		elseif(getPlayerStorageValue(cid, 1050) == 21 and getPlayerStorageValue(cid, 1060) < 1) then
			npcHandler:say("Zze attackzz have weakened our enemy zzignificantly. Yet, your quezzt continuezz. Bezzidezz zzome tazzkzz you could take, zze zzreat of zze emperor izz zztill hanging over our headzz like a rain cloud. ... ", cid)
			npcHandler:say("Zzo, are you indeed willing to continue zze fight for our cauzze? ", cid)
			talkState[talkUser] = 14
		elseif(getPlayerStorageValue(cid, 1060) == 1) then
			npcHandler:say("Ah you have returned. I azzume you already found zzome itemzz to build a proper dizzguizze? ", cid)
			talkState[talkUser] = 16
		elseif(getPlayerStorageValue(cid, 1060) == 11) then
			npcHandler:say("You - azzembled zze zzeptre? Hand it out, give it to me, will you? ", cid)
			talkState[talkUser] = 19
		elseif(getPlayerStorageValue(cid, 1060) == 12) then
			npcHandler:say("Now we need to get clozzer to zze emperor himzzelf. A hive of beezz would defend zzeir queen wizz zzeir lives in cazze an enemy gained entranzze. Zzizz makezz a formidable defenzze line, nearly inviolable. ... ", cid)
			npcHandler:say("But a zztranger directly in zze midzzt of zze hive will be acczzepted - after all it izz not pozzible to overcome zzuch a formidable defenzze which izz nearly inviolable, or izz it? Ha. ... ", cid)
			npcHandler:say("Now zzat you overcame zzeir linezz of defenzze at zze great gate, you only need to find a way to enter zzeir home. ... ", cid)
			npcHandler:say("Head zztraight to zze entranzze of zze zzity. If you can convinzze zze guardzz to let you enter zze zzity, you should be able to reach our contact zzere wizz eazze. ... ", cid)
			npcHandler:say("We have alzzo forged zome paperzz for you and zzent zzem to zze zzity. Your victory in zze arena iz well known in our land. Wizz zze help of zzezze paperzz you will pretend zzat zzome of zze higher officialzz want to talk to you about your battle. ... ", cid)
			npcHandler:say("Zzizz way you will be able to enter zze zzity of zze dragon emperor and meet our contact zzere in zze imperial offizze. He will give you zze next inzztructionzz. ", cid)
			setPlayerStorageValue(cid, 1060, 13)
			talkState[talkUser] = 0
		-- WRATH OF THE EMPEROR QUEST	
		end
	
	-- WRATH OF THE EMPEROR QUEST
	elseif(msgcontains(msg, "crate")) then
		if(talkState[talkUser] == 17) then
			npcHandler:say("Ah I zzee. You are ready for your mizzion and waiting for me to create and mark zze crate? ", cid)
			talkState[talkUser] = 18
		end
	-- WRATH OF THE EMPEROR QUEST
		
	-- CHILDREN OF REVOLUTION QUEST
	elseif(msgcontains(msg, "symbols")) then
		if(getPlayerStorageValue(cid, 1050) == 14) then
			npcHandler:say("Mh, zze zzymbolzz of zze chamber you dezzcribe are very common in our culture, palezzkin. You should have come accrozz zzem in many a plazze already. ...", cid)
			npcHandler:say("Zze zzymbolzz zzeem to be arranged in zzome way you zzay? Were zzere any notizzeable devizzezz? Zzwitchezz or leverzz? ", cid)
			talkState[talkUser] = 11
		end
	-- CHILDREN OF REVOLUTION QUEST
	elseif(msgcontains(msg, "yes")) then
		-- CHILDREN OF REVOLUTION QUEST
		if(talkState[talkUser] == 1) then
			npcHandler:say("Zzen indeed, I have a tazzk for you. Lizzten carefully and you might even learn zzomezzing. A wizze being hearzz one zzing and underzztandzz ten. ...", cid)
			npcHandler:say("Zze mountainzz to zze norzz are overrun by corrupted lizzardzz. ...", cid)
			npcHandler:say("Beyond zzem, you'll find a lush valley, zze Muggy Plainzz. Find out about zzeir planzz, zzeir tacticzz. Zze lizzardzz' art of war izz characterizzed by dizzguizze and zzecrezzy. ...", cid)
			npcHandler:say("A traveller told me about a barricaded zzettlement zzey ezztablished. It'zz a weak and in all zzeir arroganzze, poorly guarded outpozzt beyond zze mountainzz. ...", cid)
			npcHandler:say("If you can find any documentzz about zzeir zztrategiezz, zze rezzizztanzze will be very grateful. ...", cid)
			npcHandler:say("Are you interezzted, palezzkin?", cid)
			talkState[talkUser] = 2
		elseif(talkState[talkUser] == 2) then
			npcHandler:say("Be warned. Zze mountain pazzezz have been dezzerted for zzeveral weekzz now. No one made it acrozz and I fear you won't meet a zzingle friendly zzoul up zzere.", cid)
			setPlayerStorageValue(cid, 1050, 1)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 3) then
			npcHandler:say("Exzztraordinary. We are mozzt fortunate to have zzezze documentzz in our handzz now. Zzizz would zzertainly help me to build an effective rezzizztanzze. Will you give zzem to me? ", cid)
			talkState[talkUser] = 4
		elseif(talkState[talkUser] == 4) then
			if(getPlayerItemCount(cid, 11101) >= 1) then
				npcHandler:say("Aaah, zzezze look zzertainly interezzting. Zzezze manuzzcriptzz show uzz zzeveral locationzz of zze enemy troopzz. ... ", cid)
				npcHandler:say("I'm imprezzed, zzoftzzkin. Maybe you can be of zzome more help. ", cid)
				doPlayerRemoveItem(cid, 11101, 1)
				setPlayerStorageValue(cid, 1050, 3)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 5) then
			npcHandler:say("I've marked itzz location on your map. Go and find out what happened zzere. In zze pazzt it wazz known azz zze Temple of Equilibrium. ", cid)
			setPlayerStorageValue(cid, 1050, 4)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 6) then
			npcHandler:say("I'll mark zze entranzze to Chaochai on your map. ... ", cid)
			npcHandler:say("Conzzentrate on one location at a time. Zze one who chazzezz after two harezz, won't catch even one. ", cid)
			setPlayerStorageValue(cid, 1050, 7)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 7) then
			npcHandler:say("Not far to zze eazzt of zze village, you'll find rizze fieldzz. Zzey uzze zzem to rezztore zzeir food suppliezz. ... ", cid)
			npcHandler:say("In zze zztorage accrozz zzizz room, you'll find a zzpecial poizzon which will zzignificantly weaken zzem if uzzed on zze water and zzoil zze rizze growzz in. ... ", cid)
			npcHandler:say("Are you fully prepared for zzizz?", cid)
			talkState[talkUser] = 8
		elseif(talkState[talkUser] == 9) then
			npcHandler:say("Good. Zze fieldzz should be not far from Xiachai in zze eazzt. Go to zze top terrazze and mix zze poizzon wizz zze water. ... ", cid)
			npcHandler:say("Poizzon izz often uzzed by cowardzz, yet it grantzz great power to zze opprezzed. ", cid)
			setPlayerStorageValue(cid, 1050, 9)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 10) then
			npcHandler:say("Perhapzz you can find a way to enter zze norzz of zze valley and find a pazzage to zze great gate itzzelf. Zzearch any templezz or zzettlementzz you come accrozz for hidden pazzagezz. ... ", cid)
			npcHandler:say("I wish for a zzafe return wizz good newzz. ", cid)
			setPlayerStorageValue(cid, 1050, 12)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 11) then
			npcHandler:say("Interezzting. It'zz a riddle, zzoftzzkin. Zzuch gamezz are very popular in our culture. I believe zze leverzz will alter zze arrangement. ... ", cid)
			npcHandler:say("Not too far from zze lever, zzere muzzt be a hint of zzome zzort. An image of how zze zzymbolzz muzzt be arranged. Zzurely zze mechanizzm will trigger a zzecret pazzage, maybe a moving wall or a portal. ... ", cid)
			npcHandler:say("Zzizz should be our pazz to zze great gate. Head to zze zztorage onzze again. Zzere should be zzome extra greazzy oil which should work wizz zzuch a large mechanizzm. Zze leverzz should zzen be movable again. ", cid)
			setPlayerStorageValue(cid, 1050, 15)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 12) then
			npcHandler:say("Zzen zzizz izz zze way which will lead you to zze great gate. ...", cid)
			npcHandler:say("By zze way, before I forget it - zzinzze you are zzkilled in zzolving riddlezz, maybe you can make uzze of zzizz old tome I've found? It containzz ancient knowledge and truly izz a tezztament of our culture, treat it wizz care. ...", cid)
			npcHandler:say(" I may alzzo have anozzer mizzion for you if you are interezzted.", cid)
			setPlayerStorageValue(cid, 1050, 18)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 13) then
			npcHandler:say("You did well on your quezzt zzo far. I hope you will reach zze great gate in time. If we are lucky, it will zztill be open. ... Zalamon: If not, it will already be overrun by enemy zzoldierzz. Direct confrontation will be inevitable in zzat cazze, palezzkin. Now clear your mind and approach zze portal.", cid)
			setPlayerStorageValue(cid, 1050, 19)
			talkState[talkUser] = 0
		-- CHILDREN OF REVOLUTION QUEST
		
		-- WRATH OF THE EMPEROR QUEST
		elseif(talkState[talkUser] == 14) then
			npcHandler:say("You continue to imprezz, zzoftzzkin. ... ", cid)
			npcHandler:say("A contact of zze rezzizztanzze izz located furzzer in zze norzz of Zao. ... ", cid)
			npcHandler:say("Zze emperor will drag hizz forzzezz to zze great gate now to bolzzter hizz defenzze. Zzinzze we attacked zze gate directly, he will not expect uzz taking a completely different route to reach zze norzzern territoriezz. ... ", cid)
			npcHandler:say("I azzume you are already geared up and ready to conquer zze norzz? ", cid)
			talkState[talkUser] = 15
		elseif(talkState[talkUser] == 15) then
			npcHandler:say("Your determination izz highly appreciated. To zzneak pazzt zze eyezz of zze enemy, you will have to uzze a diverzzion. Zzere are zzeveral old tunnelzz beneazz zze zzoil of Zzao. ... ", cid)
			npcHandler:say("One of zzem izz uzzed azz a maintenanzze connection by enemy lizardzz. To enter it, you will have to uzze a dizzguizze. Zzomezzing like a crate perhapzz. ... ", cid)
			npcHandler:say("Mh, if you can find zzome nailzz - 3 should be enough - and 1 piezze of wood, I should be able to create an appropriate cazzing. Return to me if you found zze itemzz and we will talk about zze next zztep. ", cid)
			setPlayerStorageValue(cid, 1060, 1)
			talkState[talkUser] = 0
		elseif(talkState[talkUser] == 16) then
			npcHandler:say("Very good, I am confident zzizz will zzuffizze. Now I can build and mark a crate large enough for you to fit in - while zztill being able to breazze of courzze - and I will mark it in our tongue zzo it will look lezz zzuzzpizziouzz. ... ", cid)
			npcHandler:say("Wizz zzeir eyezz towardzz zze gate, your chanzzezz to zzlip zzrough have never been better. I will keep zze zzpare materialzz here wizz me, we can alwayzz build a new one if you need to. ", cid)
			talkState[talkUser] = 17
		elseif(talkState[talkUser] == 18) then
			if(getPlayerItemCount(cid, 8309) >= 3 and getPlayerItemCount(cid, 5901) >= 1) then
				doPlayerRemoveItem(cid, 5901, 1)
				doPlayerRemoveItem(cid, 8309, 3)
				setPlayerStorageValue(cid, 1060, 2)
				doPlayerAddItem(cid, 12284, 1)
				npcHandler:say("Alright. Let uzz create a crate. Hm. Let me zzee. ... ", cid)
				npcHandler:say("Good. Zzat will do. ... ", cid)
				npcHandler:say("Zze maintenanzze tunnelzz are in zze eazzt of zze plainzz, near ze coazt. Here, I will mark zzem on your map. ... ", cid)
				npcHandler:say("Uzze zze dizzguizze wizzely, try to hide in zze dark and avoid being zzeen at all cozzt. ... ", cid)
				npcHandler:say("Onzze you have reached zze norzz, you can find zze rezzizztanzze hideout at zze ozzer zzpot I marked on your map. Now hurry. ", cid)
				talkState[talkUser] = 0
			end
		elseif(talkState[talkUser] == 19) then
			if(getPlayerItemCount(cid, 12327) >= 1) then
				doPlayerRemoveItem(cid, 12327, 1)
				setPlayerStorageValue(cid, 1060, 12)
				npcHandler:say("Finally. At lazzt. Zze zzeptre izz - ourzz. Ourzz of courzze. A weapon we should uzze wizzely for our cauzze. I need a zzecond or two. Do you leave me already? ", cid)
				talkState[talkUser] = 0
			end
		-- WRATH OF THE EMPEROR QUEST
		end	
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())