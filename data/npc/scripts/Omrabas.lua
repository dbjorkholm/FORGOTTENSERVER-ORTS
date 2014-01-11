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


    if(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9990) < 1) then
        selfSay('Hmm. You could be of assistance, I presume. I need several body parts. I will reward you adequately. Interested?', cid)
        setPlayerStorageValue(cid, 9990, 1)
		talkState[talkUser] = 1
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 1 and (getPlayerStorageValue(cid,9990) == 1) then
        setPlayerStorageValue(cid, 9991, 1)
		talkState[talkUser] = 0
		local msgs={
            "Very sensible of you. I will pay you handsomely for your help. ...",
            "All you have to do is fetch diverse fresh body parts and then prepare the resurrection ritual. Nothing out of the ordinary. ...",
            "First, I need two arms. Ghouls usually carry some as a snack. Two ghoul snacks should not be hard to get! Return when you have them."
             }
		doNPCTalkALot(msgs,6500)
	
    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9991) == 1) and (getPlayerStorageValue(cid,9992) < 1) then
        selfSay('Ah hello, young friend! Did you bring me two ghoul snacks as requested?', cid)
        talkState[talkUser] = 2
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 and (getPlayerStorageValue(cid,9991) == 1) then
		if getPlayerItemCount(cid, 12423) >= 2 then
			setPlayerStorageValue(cid, 9992, 1)
			doPlayerRemoveItem(cid,12423,2)
			talkState[talkUser] = 0
			selfSay('Splendid! What? They\'re half gnawed! There are no hands! Hrmmm. Let me think of a solution. Ask me for a new {mission}.', cid)
		else
			selfSay('You don\'t have two ghoul snacks.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9992) == 1) and (getPlayerStorageValue(cid,9993) < 1) then
        selfSay('Ah, young friend, I found a solution! Find me two {demonic skeletal hands}. That should do it. Now run along! Ask me for {mission} when you\'re done.', cid)
		setPlayerStorageValue(cid, 9993, 1)
		
	elseif(msgcontains(msg, 'demonic skeletal hands') or msgcontains(msg, 'demonic skeletal hand')) then
		selfSay('What? Hack some off from a demon skeleton, of course! Now get moving.', cid)	
		
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9993) == 1) and (getPlayerStorageValue(cid,9994) < 1) then
        selfSay('Ah hello again! You look as if you could, er, lend me a hand or two? Yes?', cid)
        talkState[talkUser] = 3
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 3 and (getPlayerStorageValue(cid,9993) == 1) then
		if getPlayerItemCount(cid, 10564) >= 2 then
			selfSay('Yes. Those will be adequate. Talk to me again if you want to continue with your next {mission}.', cid)
			doPlayerRemoveItem(cid,10564,2)
			setPlayerStorageValue(cid, 9994, 1)
			talkState[talkUser] = 0
		else
			selfSay('You don\'t have two demonic skeletal hands.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9994) == 1) and (getPlayerStorageValue(cid,9995) < 1) then
        setPlayerStorageValue(cid, 9995, 1)
		local msgs={
            "I need my heart back. I know where they have hidden it. Too afraid to destroy my beating heart, hah! ...",
            "It is in a dusty amphora in a sealed mass grave in the downmost cellar of my ancient home. The ruins lie to the north at the beach. ...",
            "Crash the amphoras to find my heart, and bring it to me."
             }
		doNPCTalkALot(msgs,6500)
		
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9996) == 1) and (getPlayerStorageValue(cid,9997) < 1) then
        talkState[talkUser] = 4       
	    local msgs={
            "Yes? You have it? You what? Not in the amphoras? You picked it off someone else?!? ...",
            "Well, the important thing is that you have it. Let's see if it's still in good shape. {Give} it to me.",
             }
		doNPCTalkALot(msgs,6500)
		
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'give')) and talkState[talkUser] == 4 and (getPlayerStorageValue(cid,9996) == 1) then
		if getPlayerItemCount(cid, 21394) >= 1 then
			selfSay('Ah... <sighs> Very good. Just say the word when you are ready for the next {mission}.', cid)
			doPlayerRemoveItem(cid,21394,1)
			setPlayerStorageValue(cid, 9997, 1)
			talkState[talkUser] = 0
		else
			selfSay('You don\'t have my heart.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9997) == 1) and (getPlayerStorageValue(cid,9998) < 1) then
		setPlayerStorageValue(cid, 9998, 1)
	    local msgs={
            "I will need brains - don't laugh! Ahem. I will need a stimulated brain, to be precise. ...",
            "Use two half-eaten brains with the Brain Heater Machine in the Necromancer halls and bring me the fused, stimulated brain. Now go!",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9999) == 1) and (getPlayerStorageValue(cid,9950) < 1) then
        talkState[talkUser] = 5     
	    selfSay('Yes, yes, hello. Tell me if you lost something. If not, do you have that stimulated brain with you?', cid)
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 5 and (getPlayerStorageValue(cid,9999) == 1) then
		if getPlayerItemCount(cid, 21395) >= 1 then
			selfSay('Ah... <sighs> Very good. Just say the word when you are ready for the next {mission}.', cid)
			doPlayerRemoveItem(cid,21395,1)
			setPlayerStorageValue(cid, 9950, 1)
			talkState[talkUser] = 0
		else
			selfSay('You don\'t have the brain.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9950) == 1) and (getPlayerStorageValue(cid,9951) < 1) then
		setPlayerStorageValue(cid, 9951,1)
		doPlayerAddItem(cid,21402,1)
	    local msgs={
            "Now that you have shown you've got the brains, I need you to show initiative. ...",
            "I will need something that can be adequately used as intestines. Something alive. Stuff it into this storage flask and return it to me!",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9952) == 1) and (getPlayerStorageValue(cid,9953) < 1) then
        talkState[talkUser] = 6     
	    selfSay('Hello, hello. Let\'s come to the point - did you find me some intestines?', cid)
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 6 and (getPlayerStorageValue(cid,9952) == 1) then
		if getPlayerItemCount(cid, 21403) >= 1 then
			doPlayerRemoveItem(cid,21403,1)
			setPlayerStorageValue(cid, 9953, 1)
			talkState[talkUser] = 0
			local msgs={
				"Ah... interesting. A snake? Not bad, not bad at all. ...",
				"Right. Now, we need to waken the old powers through ritual. Let me know when you are ready for this {mission}.",
            }
			doNPCTalkALot(msgs,6500)
		else
			selfSay('You don\'t have my intestine.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9953) == 1) and (getPlayerStorageValue(cid,9954) < 1) then
	    talkState[talkUser] = 7
		local msgs={
            "Good. As you may have gathered, the body parts you brought need to be assembled to form a whole body. ...",
            "This will happen through a necromantic ritual that we - or rather, you - now have to prepare. ...",
            "In a first step, it will involve retrieving specific artefacts of dark magic and hallowing the altars of the dark powers with them. ...",
            "After that, you will have to speak an ancient incantation to animate the body and fuse my soul within. ...",
            "But first things first. Are you ready to {undertake} the hallowing of the five altars?",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'undertake') and talkState[talkUser] == 7 and (getPlayerStorageValue(cid,9953) == 1) then
		setPlayerStorageValue(cid, 9954,1)
		doPlayerAddItem(cid,21401,3)
		talkState[talkUser] = 0
		local msgs={
            "Good! Let's not waste time. The first altar you must hallow is the Dragonsoul Altar, at the eastern side of the room. ...",
            "To hallow it, dig out three dragon tears and place them on the altar to appease the dark powers. ...",
            "What? Oh, you'll find some dragon tears near dragon skulls... where? ...",
            "In the Dragonbone Cemetery, OBVIOUSLY! Must I explain EVERYTHING to you? Now go!",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9955) == 1) and (getPlayerStorageValue(cid,9956) < 1) then 
	    selfSay('Ah hello! Well done there, I felt the old powers settling down. Now, {ready} to hallow the next altar?', cid)
		setPlayerStorageValue(cid, 9956,1)
	
	elseif(msgcontains(msg, 'ready') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9956) == 1) and (getPlayerStorageValue(cid,9957) < 1) then
		setPlayerStorageValue(cid, 9957,1)
		local msgs={
            "I expected no less. Next is the Bonemarrow Altar, where the Dark Lord feasts upon the hallowed bones of...err. ...",
            "Ahem. Just take a yellowed bone or big bone, and hallow it - you don't know how? ...",
            "Huh. To HALLOW a yellowed bone, use it with one of the hallowed bonepiles in the Gardens Of Night. There are always bones around there - or were, in my days. ...",
            "Then, place the hallowed bone on the firebasin of the Bonemarrow Altar so the Dark Lord can consume it and grants us his power. Return to me after that.",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9957) == 1) and (getPlayerStorageValue(cid,9958) < 1) then
		talkState[talkUser] = 8
		local msgs={
            "Are you still here? Come on, let's not laze about, go to the Gardens of Night - where? ...",
            "East of the Necromancer Halls, you can't miss it, just look for a lot of dark and white sand, dried trees, and priestesses! ...",
            "Or got a {problem} with finding bones? Hah!",
             }
		doNPCTalkALot(msgs,6500)
	
	elseif msgcontains(msg, 'problem') and talkState[talkUser] == 8 and (getPlayerStorageValue(cid,9957) == 1) then
		setPlayerStorageValue(cid, 9958,1)
		doPlayerAddItem(cid,21407,3)
		talkState[talkUser] = 0
		selfSay('What? No bones around you say? Hrmmm. Wait. Check the skull heap here - that\'s right - hah! There! Now get to work!', cid)
	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9960) == 1) and (getPlayerStorageValue(cid,9961) < 1) then
		setPlayerStorageValue(cid,9961,1)
		local msgs={
            "Ah, welcome, welcome! I felt that one! The Dark Lord is pleased with the gift you brought, so now we can proceed with everything as planned. ...",
            "If it had gone wrong though, he would have had your guts for gart... er... well, here you are, so - ready to get some {blood} flowing?",
            }
		doNPCTalkALot(msgs,6500)
		
	elseif(msgcontains(msg, 'blood') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9961) == 1) and (getPlayerStorageValue(cid,9962) < 1) then
		setPlayerStorageValue(cid, 9962,1)
		local msgs={
            "Yes, I said blood. Important ingredient in necromantic rituals, usually. ...",
            "You need to spill some vials of blood tincture for this task. Probably means killing blood priests to get those vials. Ready to do this?",
           }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'ready') or msgcontains(msg, 'mission') or msgcontains(msg, 'yes')) and (getPlayerStorageValue(cid,9962) == 1) and (getPlayerStorageValue(cid,9963) < 1) then
		setPlayerStorageValue(cid, 9963,1)
		local msgs={
            "Ah, I knew you were a sturdy fellow! Necromancer material if ever I saw one! ...",
            "Well then, the next task is to anoint the Bloodgong Altar. This will animate the dark flows we need for the ritual. ...",
            "You need to spill a vial of blood tincture on each of the four sacrifical stones of the altar in order to anoint them. ...",
            "Then, toll the Bloodgong north of the sacrificial stones to set the dark flows going. Return to me after that.",
           }
		doNPCTalkALot(msgs,6500)
	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9965) == 1) and (getPlayerStorageValue(cid,9966) < 1) then
		setPlayerStorageValue(cid,9966,1)
		talkState[talkUser] = 9
		local msgs={
            "Ah, it is invigorating to fell the dark flows, rushing through Drefia, once again! Capital. This has earned you a reward. ...",
            "Now, the next mission awaits, {yes}?",
          }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission')) and talkState[talkUser] == 9 and (getPlayerStorageValue(cid,9966) == 1) and (getPlayerStorageValue(cid,9967) < 1) then
		setPlayerStorageValue(cid,9967,1)
		talkState[talkUser] = 0
		local msgs={
            "Excellent. To bind the earthly powers, we, I mean you, must worship at the Fireglass Altar. ...",
            "This means scattering sacred ashes from the Ember Chamber on the sacrificial stones of the Fireglass Altar. ...",
            "To gather the sacred ashes, you have to use magic chalk with the Shadow Fire in the Ember Chamber. ...",
            "Gather the resulting ashes from the Shadow Hearth, and scatter them on the Fireglass Altar's sacrificial stones. Then return here.",
          }
		doNPCTalkALot(msgs,4500)
		
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9969) == 1) and (getPlayerStorageValue(cid,9970) < 1) then
		setPlayerStorageValue(cid,9970,1)
		local msgs={
            "Ah, finally. Exceptional! Don't you feel the earth awakening to our call? No? Oh. ...",
            "Anyway, you succeeded in hallowing the Fireglass Altar! Only one altar remains to be hallowed! Shall we {proceed}?",
         }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'proceed') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9970) == 1) and (getPlayerStorageValue(cid,9971) < 1) then
		setPlayerStorageValue(cid,9971,1)
		doPlayerAddItem(cid,21448,1)
		doPlayerAddItem(cid,21482,1)
		local msgs={
            "<reverential> The final altar that remains to be hallowed... the Shadowthrone. ...",
            "Only a candle made of human tallow placed before each shadow statue in the right order, will awaken it. ...",
            "I say, are you sick? Human tallow candles are a perfectly good tool - don't look at me like that! Be professional about this, will you? ...",
            "I have some candles hidden deep down in the lich caves, east of here. Here's the key that opens the trapdoor to the cache. ...",
            "And take this parchment. Identify the right candles with it, take three with you and place one in front of the three shadowthrone statues, starting counterclockwise. Now go!",
         }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9975) == 1) and (getPlayerStorageValue(cid,9976) < 1) then
		setPlayerStorageValue(cid,9976,1)
		local msgs={
            "Yes! YES! I have felt that! The altars are alive again! Well done! ...",
            "We are close now. Only one important thing remains: the incantation itself. We need the {scroll} for that.",
         }
		doNPCTalkALot(msgs,4500)
		
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9976) == 1) and (getPlayerStorageValue(cid,9977) < 1) then
		talkState[talkUser] = 10
		local msgs={
            "Well, it is a rather long story. The short version: I had friends - no need to snigger. ...",
            "We were five highly brilliant dark summoners. We joined our forces to find the scroll of Youth and Life Eternal. ...",
            "But when we finally found it after years of toiling and danger, we quarreled over who could have it. The scroll tore. ...",
            "We each retained one piece of the scroll. Well, that was a long time ago. ...",
            " But I think I have a clue where we can find the first piece of the scroll. Would you go looking?",
         }
		doNPCTalkALot(msgs,4500)
		
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission')) and talkState[talkUser] == 10 and (getPlayerStorageValue(cid,9976) == 1) and (getPlayerStorageValue(cid,9977) < 1) then
		setPlayerStorageValue(cid,9977,1)
		talkState[talkUser] = 0
		local msgs={
            "Superb! You won't regret this. I will reward you beyond your wildest dreams! ...",
            "I know that one of my former friends joined the blood priests later on. He made it quite high before he was ritually killed. ...",
            "Go find a blood priest you can talk to. Ask him, but subtly. And never tell anyone what the scroll does!",
          }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9988) == 1) and (getPlayerStorageValue(cid,9989) < 1) then
		talkState[talkUser] = 11
		selfSay('Yes? Do you have the scroll piece? ', cid)
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 11 and (getPlayerStorageValue(cid,9988) == 1) then
		if getPlayerItemCount(cid, 21250) >= 1 then
			selfSay('This is it! This is it! Well done, well done! And now, on to the next scroll piece, yes? ', cid)
			doPlayerRemoveItem(cid,21250,1)
			setPlayerStorageValue(cid, 9989, 1)
			talkState[talkUser] = 0
		else
			selfSay('You don\'t have my scroll.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9989) == 1) and (getPlayerStorageValue(cid,9920) < 1) then
		setPlayerStorageValue(cid,9920,1)
		local msgs={
            "Hah, developed a taste for it, have you? I believe the next scroll piece was hidden somewhere, my old friend being of a somewhat distrustful nature. ...",
            "The scent may not be lost, though - ask a shadow pupil if he can help - but be careful. ...",
            "Those shadow pupils are - strange. Try to find one who will answer and not kill you!",
          }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9926) == 1) and (getPlayerStorageValue(cid,9927) < 1) then
		talkState[talkUser] = 12
		selfSay('Ah, hello! I take it you have the next scroll piece for me, {yes}?', cid)
	
	elseif msgcontains(msg, 'yes') and talkState[talkUser] == 12 and (getPlayerStorageValue(cid,9926) == 1) then
		if getPlayerItemCount(cid, 21250) >= 1 then
			selfSay('Indeed it is! The second scroll piece! Splendid! Here you go - for your trouble. And now, on to the {next} scroll piece, yes? ', cid)
			doPlayerRemoveItem(cid,21250,1)
			setPlayerStorageValue(cid, 9927, 1)
			talkState[talkUser] = 0
		else
			selfSay('You don\'t have my scroll.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'next')) and (getPlayerStorageValue(cid,9927) == 1) and (getPlayerStorageValue(cid,9928) < 1) then
		doPlayerAddItem(cid,21489,1)
		setPlayerStorageValue(cid,9928,1)
		local msgs={
            "Good! As you can imagine, I had a scroll piece, too. I hid it in my old quarters, northwest of the library. ...",
            "The door is magically sealed. Use this copper key with it to get inside. ...",
            "Beneath one of the chests is a secret stash, under a loose stone tile. The scroll piece should be inside. Off you go.",
          }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9933) == 1) and (getPlayerStorageValue(cid,9934) < 1) then
		talkState[talkUser] = 13
		selfSay('Hello - what? You have the {scroll} piece, you say?', cid)
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and talkState[talkUser] == 13 and (getPlayerStorageValue(cid,9933) == 1) and (getPlayerStorageValue(cid,9934) < 1) then
		if getPlayerItemCount(cid, 21250) >= 1 then
			doPlayerRemoveItem(cid,21250,1)
			setPlayerStorageValue(cid,9934,1)
			talkState[talkUser] = 0
			local msgs={
				"Oh, praise the Dark Lord! It is my scroll piece! Give it here! You can have this instead. ...",
				"Ahh, that feels GOOD. Now, only two pieces left to hunt down! On to the {next} scroll piece, yes?",
			  }
			doNPCTalkALot(msgs,4500)
		else
			selfSay('You don\'t have my scroll.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'next')) and (getPlayerStorageValue(cid,9934) == 1) and (getPlayerStorageValue(cid,9935) < 1) then
		doPlayerAddItem(cid,21464,1)
		setPlayerStorageValue(cid,9935,1)
		local msgs={
            "Hahah, eager for it, I like that! ...",
            "One piece stayed in the hands of a beautiful priestess. ...",
            "As they never throw anything away that looks like an incantation - you get my drift. Find out where they still keep it! ...",
            "Oh, one more thing! They only talk to you when you look like a fellow summoner. It's dangerous to go without a cape. Use this.",
          }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and (getPlayerStorageValue(cid,9940) == 1) and (getPlayerStorageValue(cid,9941) < 1) then
		doPlayerAddItem(cid,21464,1)
		talkState[talkUser] = 14
		local msgs={
            "Hello, young apprentice. Do you have that scroll piece from the priestess?",
        }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and talkState[talkUser] == 14 and (getPlayerStorageValue(cid,9940) == 1) and (getPlayerStorageValue(cid,9941) < 1) then
		if getPlayerItemCount(cid, 21250) >= 1 then
			doPlayerRemoveItem(cid,21250,1)
			setPlayerStorageValue(cid,9941,1)
			talkState[talkUser] = 0
			local msgs={
				"Ahhh, capital, capital. Good girl for keeping it for me. I'll take back my cape now, thank you. ...",
				"Now - the final part of the scroll! Ready to go retrieve it?",
			  }
			doNPCTalkALot(msgs,4500)
		else
			selfSay('You don\'t have my scroll.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and (getPlayerStorageValue(cid,9941) == 1) and (getPlayerStorageValue(cid,9942) < 1) then
		doPlayerAddItem(cid,21464,1)
		setPlayerStorageValue(cid,9942,1)
		local msgs={
            "That's the spirit! Speaking of which, you will have to look for a White Shade ...",
            "That's a ghost, in case you don't know. Goes by name of... Zarifan, if I recall correctly. ...",
            "His grave is somewhere to the south, somewhere deeper. And he only reacts to magic words. ...",
            "Err... it's embarrassing... the magic words are <mumble> <mumble> <ahem> ...",
            "'Friendship lives forever.' Silly, really. Untrue, as well. ...",
            "Anyway, say those three words - don't make me repeat them - and the old softie will tell you where the scroll is. Pathetic.",
          }
		doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and (getPlayerStorageValue(cid,9944) == 1) and (getPlayerStorageValue(cid,9945) < 1) then
		talkState[talkUser] = 15
		local msgs={
			"Welcome, welcome! Finally! The last scroll piece.... you do have it, haven't you?",
		}
			doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and talkState[talkUser] == 15 and (getPlayerStorageValue(cid,9944) == 1) and (getPlayerStorageValue(cid,9945) < 1) then
		if getPlayerItemCount(cid, 21250) >= 1 then
			doPlayerRemoveItem(cid,21250,1)
			setPlayerStorageValue(cid,9945,1)
			talkState[talkUser] = 0
			local msgs={
				"I am so excited! Finally, we - wait. What is this? That... is not the complete scroll piece. ...",
				"I don't care what you say! This is a disaster! We need a complete scr - wait. I have an idea. ...",
				"There must be a copy or something in my old library. something to use with the scroll, to find the missing words. ...",
				"There must be. Go look there. Next to the fiveserrated room, a small library. Go go go!",
			  }
			doNPCTalkALot(msgs,4500)
		else
			selfSay('You don\'t have my scroll.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and (getPlayerStorageValue(cid,9946) == 1) and (getPlayerStorageValue(cid,9947) < 1) then
		talkState[talkUser] = 16
		local msgs={
			"Don't keep me waiting. The last scroll piece - were you able to {restore} it?",
		}
			doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'restore')) and talkState[talkUser] == 16 and (getPlayerStorageValue(cid,9946) == 1) and (getPlayerStorageValue(cid,9947) < 1) then
		if getPlayerItemCount(cid, 21474) >= 1 then
			doPlayerRemoveItem(cid,21474,1)
			setPlayerStorageValue(cid,9947,1)
			talkState[talkUser] = 17
			local msgs={
				"I knew it! I knew I had made a copy! Oh, I am so clever! ...",
				"Now, watch this. <mumbles darkly> THERE. THE COMPLETE INCANTATION SCROLL. ...",
				"You have done well. Only one thing remains, and you shall be rich beyond your dreams. Ready for the really final task?",
			  }
			doNPCTalkALot(msgs,4500)
		else
			selfSay('You don\'t have my scroll.', cid)
			talkState[talkUser] = 0
		end
	
	elseif(msgcontains(msg, 'yes') or msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and talkState[talkUser] == 17 and (getPlayerStorageValue(cid,9947) == 1) and (getPlayerStorageValue(cid,9948) < 1) then
		setPlayerStorageValue(cid,9948,1)
		doPlayerAddItem(cid,21251,1)
		doPlayerAddItem(cid,21476,1)
		talkState[talkUser] = 0
		local msgs={
			"Then let's go. Take my skull and the incantation scroll to the working station in the fiveserrated room ...",
			"Where the lava flows and the southern legs of the room meet. Place the Skull on the sacrificial stone and use the scroll ...",
			"AND I shall be made whole, and YOU shall be RICH!",
		}
			doNPCTalkALot(msgs,4500)
	
	elseif(msgcontains(msg, 'mission') or msgcontains(msg, 'scroll')) and (getPlayerStorageValue(cid,9949) == 1) and (getPlayerStorageValue(cid,9876) < 1) then
		setPlayerStorageValue(cid,9876,1)
		doPlayerAddItem(cid,21452,1)
		local msgs={
			"It failed! IT FAILED! WHY? What have you done! This must be your fault! ...",
			"You... did... that was a recipe for chicken soup! No wonder the scroll failed! Now... all is lost ...",
			"<sobs drily> I never want to see you again! You and your dirty gravedigger hands! Take this, you ungrateful, useless, imbecile... human! ...",
			"Now... get out! And never, ever, dare come back! You ruined EVERYTHING!",
		}
			doNPCTalkALot(msgs,4500)
end
    return TRUE    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  