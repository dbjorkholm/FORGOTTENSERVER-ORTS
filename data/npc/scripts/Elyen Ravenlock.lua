local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


local function doCreatureSayWithDelay(cid,text,type,delay,e)
   if delay<=0 then
      doCreatureSay(cid,text,type)
   else
      local func=function(pars)
                    doCreatureSay(pars.cid,pars.text,pars.type)
                    pars.e.done=TRUE
                 end
      e.done=FALSE
      e.event=addEvent(func,delay,{cid=cid, text=text, type=type, e=e})
   end
end

--returns how many msgs he have said already
local function cancelNPCTalk(events)
  local ret=1
  for aux=1,table.getn(events) do
     if events[aux].done==FALSE then
        stopEvent(events[aux].event)
     else
        ret=ret+1
     end
  end
  events=nil
  return(ret)
end


local function doNPCTalkALot(msgs,interval)
  local e={}
  local ret={}
  if interval==nil then interval=3000 end --3 seconds is default time between messages
  for aux=1,table.getn(msgs) do
      e[aux]={}
      doCreatureSayWithDelay(getNpcCid(),msgs[aux],TALKTYPE_PRIVATE_NP,(aux-1)*interval,e[aux])
      table.insert(ret,e[aux])
  end
  return(ret)
end


local function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,9936) == 1 and getPlayerStorageValue(cid,9937) < 1 then
        npcHandler.topic[cid] = 1
		local msgs={
            "Hello, brother. You come with a question to me, I believe?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 and getPlayerStorageValue(cid,9936) == 1 then
        setPlayerStorageValue(cid, 9921, 1)
		npcHandler.topic[cid] = 2
		local msgs={
            "And what is it you want? Do you bring news from the undead, or do you seek a dark {artefact}?",
            }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'artefact') or msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 2 and getPlayerStorageValue(cid,9936) == 1 and getPlayerStorageValue(cid,9937) < 1 then
        npcHandler.topic[cid] = 3
		local msgs={
            "The scroll piece there? The symbols look promising, but it is incomplete. ...",
            "It is of little use to us. But it seems to be of interest to you ...",
            "In exchange for the scroll piece, you must assist me with something. {Agreed}?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'agreed') or msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 3 and getPlayerStorageValue(cid,9936) == 1 and getPlayerStorageValue(cid,9937) < 1 then
        setPlayerStorageValue(cid,9937,1)
		doPlayerAddItem(cid,21249,1)
		npcHandler.topic[cid] = 0
		local msgs={
            "I would have to sing to the Dark Shrines, but I cannot. ...",
            "I... cannot bear Urgith's breed. Everywhere, I hear them - scrabbling, squeaking ...",
            "Take this bone flute and play it in front of the five Dark Shrines so that they answer with song in return. You will find them in the Gardens of Night. ...",
            "If you have done that, you may have the scroll piece. Now go.",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'yes')) and getPlayerStorageValue(cid,9938) == 1 and getPlayerStorageValue(cid,9939) < 1 then
		npcHandler.topic[cid] = 4
		local msgs={
            "Hello, brother. You have finished the dance?",
           }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'yes')) and npcHandler.topic[cid] == 4 and getPlayerStorageValue(cid,9938) == 1 and getPlayerStorageValue(cid,9939) < 1 then
		npcHandler.topic[cid] = 0
		doPlayerRemoveItem(cid,21249,1)
		setPlayerStorageValue(cid,9939,1)
		local msgs={
            "You have indeed. The shrines have sung back to you. Well done, brother. Not many men take such an interest in our art. ...",
            "I will take the flute back. Our bargain stands. You may take the scroll.",
           }
		doNPCTalkALot(msgs,6500)
		
end
    return true    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  