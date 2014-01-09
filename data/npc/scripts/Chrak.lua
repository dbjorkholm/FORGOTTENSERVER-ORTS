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
	
	if(msgcontains(msg, "battle")) then
		if(getPlayerStorageValue(cid, 1015) == 24) then
			npcHandler:say("Zo you want to enter ze arena, you know ze rulez and zat zere will be no ozer option zan deaz or victory?", cid)
			npcHandler:say("My mazter wantz to zurprize hiz opponentz by an unexpected move. He will uze warriorz from ze outzide, zomeone zat no one can azzezz. ... ", cid)
			npcHandler:say("One of ziz warriorz could be you. Or you could ztay here and rot in ze dungeon. Are you interezted in ziz deal? ", cid)
			talkState[talkUser] = 1
		end
	elseif(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 1015) == 26) then
			npcHandler:say("You have done ze impozzible and beaten ze champion. Your mazter will be pleazed. Hereby I cleanze ze poizon from your body. You are now allowed to leave. ...", cid)
			npcHandler:say("For now ze mazter will zee zat you and your alliez are zpared of ze wraz of ze dragon emperor az you are unimportant for hiz goalz. ...", cid)
			npcHandler:say("You may crawl back to your alliez and warn zem of ze gloriouz might of ze dragon emperor and hiz minionz.", cid)
			setPlayerStorageValue(cid, 1015, 27)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, "yes")) then
		if(talkState[talkUser] == 1) then
			npcHandler:say("Asss you wishzz.", cid)
			setPlayerStorageValue(cid, 1015, 25)
			talkState[talkUser] = 0
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
