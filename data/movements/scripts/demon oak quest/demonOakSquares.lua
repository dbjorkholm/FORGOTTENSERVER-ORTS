local square_storage = 1014

local vocies =
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

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local player = Player(cid)
	local creature = Creature(cid)
	if not player then
		return true
	end

	if item.uid == 9001 and player:getStorageValue(square_storage) < 1 then
		player:setStorageValue(square_storage, 1)
		creature:say(vocies[1][math.random(1, #vocies[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or creature:getPosition()))
	elseif item.uid == 9002 and player:getStorageValue(1014) == 1 then
		player:setStorageValue(square_storage, 2)
		creature:say(vocies[1][math.random(1, #vocies[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or creature:getPosition()))
	elseif item.uid == 9003 and player:getStorageValue(square_storage) == 2 then
		player:setStorageValue(square_storage, 3)
		creature:say(vocies[1][math.random(1, #vocies[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or creature:getPosition()))
	elseif item.uid == 9004 and player:getStorageValue(square_storage) == 3 then
		player:setStorageValue(square_storage, 4)
		creature:say(vocies[1][math.random(1, #vocies[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or creature:getPosition()))
	elseif item.uid == 9005 and player:getStorageValue(square_storage) == 4 then
		player:setStorageValue(square_storage, 5)
		creature:say(vocies[1][math.random(1, #vocies[1])], TALKTYPE_ORANGE_2, false, cid, (positions.demonOak or creature:getPosition()))
	end
	return true
end
