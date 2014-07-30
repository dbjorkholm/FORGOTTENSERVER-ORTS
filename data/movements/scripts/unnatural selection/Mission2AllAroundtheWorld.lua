local config = {
	[1] = {text = "You hold the skull up high. You can resist the urge to have it look through a telescope though.", highestpos = Position({x = 33263, y = 31834, z = 1})},
	[2] = {text = "You hold up the skull and let it take a peek over the beautiful elven town through the dense leaves.", highestpos = Position({x = 32711, y = 31668, z = 1})},
	[3] = {text = "Thanita gives you a really strange look as you hold up the skull, but oh well.", highestpos = Position({x = 32537, y = 31772, z = 1})},
	[4] = {text = "That was a real easy one. And you are used to getting strange looks now, so whatever!", highestpos = Position({x = 33216, y = 32450, z = 1})},
	[5] = {text = "Wow, it's hot up here. Luckily the skull can't get a sunburn any more, but you can, so you better descend again!", highestpos = Position({x = 33151, y = 32845, z = 2})},
	[6] = {text = "Considering that higher places around here aren't that easy to reach, you think the view from here is tolerably good.", highestpos = Position({x = 32580, y = 32743, z = 4})},
	[7] = {text = "Yep, that's a pretty high spot. If Lazaran ever sees what the skull sees, he'd be pretty satisfied with that nice view.", highestpos = Position({x = 32346, y = 32808, z = 2})},
	[8] = {text = "Well, there are higher spots around here, but none of them is as easily reachable as this one. It just has to suffice.", highestpos = Position({x = 32789, y = 31238, z = 3})},
	[9] = {text = "Nice! White in white as far as the eye can see. Time to leave before your fingers turn into icicles.", highestpos = Position({x = 32236, y = 31096, z = 2})},
	[10] = {text = "That's definitely one of the highest spots in whole Tibia. If that's not simply perfect you don't know what it is.", highestpos = Position({x = 32344, y = 32265, z = 0})},
	[11] = {text = "What a beautiful view. Worthy of a Queen indeed! Time to head back to Lazaran and show him what you got.", highestpos = Position({x = 32316, y = 31752, z = 0})}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	local Value =  player:getStorageValue(Storage.UnnaturalSelection.Mission02)
	if Value >= 1 and Value <= 11 then
		if #config[Value] then
			if player:getPosition() == config[Value].highestpos and player:getItemCount(11076) >= 1 then
				player:say(config[Value].text, TALKTYPE_MONSTER_SAY)
				player:setStorageValue(Storage.UnnaturalSelection.Mission02, player:getStorageValue(Storage.UnnaturalSelection.Mission02) + 1) --Questlog, Unnatural Selection Quest "Mission 2: All Around the World"
			end
		end
	end
	return true
end


