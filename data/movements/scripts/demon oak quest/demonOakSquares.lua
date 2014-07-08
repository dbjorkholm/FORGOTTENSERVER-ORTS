local squareStorage = 1014

local voices =
{
	[1] =
	{
		"Release me and you will be rewarded greatefully!",
		"What is this? Demon Legs lying here? Someone might have lost them!",
		"I'm trapped, come here and free me fast!!",
		"I can bring your beloved back from the dead, just release me!",
		"What a nice shiny golden armor. Come to me and you can have it!",
		"Find a way in here and release me! Pleeeease hurry!",
		"You can have my demon set, if you help me get out of here!"
	},
	[2] =
	{
		"MY ROOTS ARE SHARP AS A SCYTHE! FEEL IT?!?",
		"CURSE YOU!",
		"RISE, MINIONS, RISE FROM THE DEAD!!!!",
		"AHHHH! YOUR BLOOD MAKES ME STRONG!",
		"GET THE BONES, HELLHOUND! GET THEM!!",
		"GET THERE WHERE I CAN REACH YOU!!!",
		"ETERNAL PAIN AWAITS YOU! NICE REWARD, HUH?!?!",
		"YOU ARE GOING TO PAY FOR EACH HIT WITH DECADES OF TORTURE!!",
		"ARGG! TORTURE IT!! KILL IT SLOWLY MY MINION!!"
	}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if item.uid == 9001 and player:getStorageValue(squareStorage) < 1 then
		player:setStorageValue(squareStorage, 1)
		player:say(voices[1][math.random(#voices[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
	elseif item.uid == 9002 and player:getStorageValue(1014) == 1 then
		player:setStorageValue(squareStorage, 2)
		player:say(voices[1][math.random(#voices[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
	elseif item.uid == 9003 and player:getStorageValue(squareStorage) == 2 then
		player:setStorageValue(squareStorage, 3)
		player:say(voices[1][math.random(#voices[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
	elseif item.uid == 9004 and player:getStorageValue(squareStorage) == 3 then
		player:setStorageValue(squareStorage, 4)
		player:say(voices[1][math.random(#voices[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
	elseif item.uid == 9005 and player:getStorageValue(squareStorage) == 4 then
		player:setStorageValue(squareStorage, 5)
		player:say(voices[1][math.random(#voices[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or player:getPosition()))
	end
	return true
end
