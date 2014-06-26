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

    if(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9977) == 1) and (getPlayerStorageValue(cid,9978) < 1) then
        npcHandler.topic[cid] = 1
		local msgs={
            "So someone sent you after a scroll, eh? A stroll for a scroll! <chuckles> Sounds like an old-fashioned necromancer thing. ...",
            "Well, this piece here is a rather fascinating thing - see those strange blood stains? - ...",
            "My predecessors have had it for quite a while without finding out more - I was hoping to investigate, but there's always so much to do! ...",
            "Ah, so you want it, too? Well, do me a favour: fetch two samples and assist in my experiment, in exchange for the scroll piece. Yes?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 and (getPlayerStorageValue(cid,9977) == 1) then
        setPlayerStorageValue(cid, 9978, 1)
		doPlayerAddItem(cid,21417)
		doPlayerAddItem(cid,21417)
		npcHandler.topic[cid] = 0
		local msgs={
            "Sanguine! I need two different blood samples - The first one from the necromancer's pure blood chamber. ... ",
            "I was barred from the premises. For my research! Shameful! I'm a martyr to the cause - oh, the second sample you said? ...",
            "The second sample you must retrieve from the sacrificial chamber in the ancient vampire crypts, first floor, far west. ...",
            "Take these two sterilised vials, one for each blood basin. Oh, I wish I could go myself! Come back when you have filled both vials.",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission') or msgcontains(msg, 'blood')) and (getPlayerStorageValue(cid,9980) == 1) and (getPlayerStorageValue(cid,9981) < 1) then
        npcHandler.topic[cid] = 2
		local msgs={
            "Hello hello! Did you bring those blood samples? ",
            }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2 and (getPlayerStorageValue(cid,9980) == 1) then
		if getPlayerItemCount(cid,21419,1) and getPlayerItemCount(cid,21418,1) then
			setPlayerStorageValue(cid, 9981, 1)
			doPlayerRemoveItem(cid,21418,1)
			doPlayerRemoveItem(cid,21419,1)
			doPlayerAddItem(cid,21449,1)
			npcHandler.topic[cid] = 0
			local msgs={
				"Now, let me see... yes... yes... very good. Let me add THIS ..... swill it... there. Sanguine! ...",
				"We're not finished yet. Take this tainted blood vial ...",
				"Dab some drops from it on to the four blood pagodas in the inner circle here. Then pull the lightning lever over there.",
             }
			doNPCTalkALot(msgs,6500)
		else
			selfSay('You haven\'t got any blood.', cid)
			npcHandler.topic[cid] = 0
		end
	
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission') or msgcontains(msg, 'Mission')) and (getPlayerStorageValue(cid,9986) == 1) and (getPlayerStorageValue(cid,9987) < 1) then
		npcHandler.topic[cid] = 3
		local msgs={
            "Hello hello! Did Hello hello! Well now, painted all those blood pagodas properly?",
            }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 3 and (getPlayerStorageValue(cid,9986) == 1) then
		setPlayerStorageValue(cid,9987,1)
		npcHandler.topic[cid] = 0
		local msgs={
			"Sanguine! Did you see those sparks! We definitely had some energy transfer! Well done! Now, for your reward. ...",
			"Err... I would awfully like to know more about the scroll ...",
			"Would you settle for a heartfelt handshake instead - oh, you wouldn't? Well, er, okay ...",
			"Give me a minute or two to retrieve it. Ask me for the {scroll} or the {mission}",
		 }
		doNPCTalkALot(msgs,6500)
		
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission') or msgcontains(msg, 'Mission')) and (getPlayerStorageValue(cid,9987) == 1) and (getPlayerStorageValue(cid,9988) < 1) then
		npcHandler.topic[cid] = 4
		local msgs={
            "Hello hell- oh, you've come for the scroll, haven't you?",
            }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 4 and (getPlayerStorageValue(cid,9987) == 1) then
		setPlayerStorageValue(cid,9988,1)
		doPlayerAddItem(cid,21250,1)
		npcHandler.topic[cid] = 0
		local msgs={
			"My heart bleeds to part from it. Here. Extend your hand - I'll just retrieve some blood from in exchange - HOLD STILL.",
		 }
		doNPCTalkALot(msgs,6500)
		
end
    return TRUE    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  