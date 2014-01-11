local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end


function doCreatureSayWithDelay(cid,text,type,delay,e)
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
function cancelNPCTalk(events)
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


function doNPCTalkALot(msgs,interval)
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


function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


    if(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9920) == 1) and (getPlayerStorageValue(cid,9921) < 1) then
        talkState[talkUser] = 1
		local msgs={
            "Lost. Hidden. The keys are shadow names. Find them, they will talk to me and reveal what is hidden. Will you go on that quest?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 and (getPlayerStorageValue(cid,9920) == 1) then
        setPlayerStorageValue(cid, 9921, 1)
		talkState[talkUser] = 0
		local msgs={
            "Then into the vampire crypts, deep down, you must go. ...",
            "There... three graves where the shadows swirl, unseen. The first one: name the colour of the silent gong. Then ...",
            "The second: the name that is silent now in the halls of Darkstone ...",
            "The third: the lost beauty of Dunesea. It must be remembered, the shadows command it. Go now.",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9924) == 1) and (getPlayerStorageValue(cid,9925) < 1) then
        talkState[talkUser] = 2
		local msgs={
            "Yes. Have you gone there and found what you sought?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'yes')) and talkState[talkUser] == 2 and (getPlayerStorageValue(cid,9924) == 1) and (getPlayerStorageValue(cid,9925) < 1) then
        talkState[talkUser] = 3
		local msgs={
            "Tell me. Begin with the colour.",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'bronze')) and talkState[talkUser] == 3 and (getPlayerStorageValue(cid,9924) == 1) and (getPlayerStorageValue(cid,9925) < 1) then
        talkState[talkUser] = 4
		local msgs={
            "Yes. The shadows say this is true. The beauty of House Dunesea, name it.",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'floating')) and talkState[talkUser] == 4 and (getPlayerStorageValue(cid,9924) == 1) and (getPlayerStorageValue(cid,9925) < 1) then
        talkState[talkUser] = 5
		local msgs={
            "The floating gardens. Too beautiful to lie asleep in the memory of men. Yes. The name that is no more in Darkstone?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'Takesha Antishu')) and talkState[talkUser] == 5 and (getPlayerStorageValue(cid,9924) == 1) and (getPlayerStorageValue(cid,9925) < 1) then
        setPlayerStorageValue(cid,9925,1)
		talkState[talkUser] = 0
		local msgs={
            "Ah, the Lady of Darkstone. You have done well to remember her name. ...",
            "Now, the shadows say the thing you seek lies next to Akab, the Quarrelsome. ...",
            "No coal is burned in his honour. Find his resting place and dig near it. Now go.",
             }
		doNPCTalkALot(msgs,6500)
		
end
    return TRUE    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  