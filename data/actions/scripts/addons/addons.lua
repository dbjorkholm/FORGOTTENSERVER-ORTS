local config = {
	[13925] = {female = 431, male = 430, addon = 1, msg = "first afflicted"},
	[13926] = {female = 431, male = 430, addon = 2, msg = "second afflicted"},
	[18517] = {female = 514, male = 516, msg = "soil guardian"}, -- soil guardian (base outfit)
	[18518] = {female = 514, male = 516, addon = 1, msg = "first soil guardian"},
	[18519] = {female = 514, male = 516, addon = 2, msg = "second soil guardian"},
	[18520] = {female = 513, male = 512, msg = "crystal warlord"}, -- crystal warlord (base outfit)
	[18521] = {female = 513, male = 512, addon = 1, msg = "first crystal warlord"},
	[18522] = {female = 513, male = 512, addon = 2, msg = "second crystal warlord"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[item.itemid]
	if not targetItem then
		return true
	end
	
	local player = Player(cid)
	if targetItem['addon'] then
		if player:hasOutfit(player:getSex() == 0 and targetItem['female'] or targetItem['male']) then
			if not player:hasOutfit(player:getSex() == 0 and targetItem['female'] or targetItem['male'], targetItem['addon']) then
				player:addOutfitAddon(targetItem['female'], targetItem['addon'])
				player:addOutfitAddon(targetItem['male'], targetItem['addon'])
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. targetItem['msg'] .. ' addon!')
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				Item(item.uid):remove(1)
			else
				player:sendCancelMessage('You have already obtained this addon!')
			end
		else
			return false
		end
	else
		if not player:hasOutfit(player:getSex() == 0 and targetItem['female'] or targetItem['male']) then
			player:addOutfit(targetItem['female'])
			player:addOutfit(targetItem['male'])
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. targetItem['msg'] .. ' outfit!')
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
		else
			player:sendCancelMessage('You have already obtained this outfit!')
		end
	end
	return true
end