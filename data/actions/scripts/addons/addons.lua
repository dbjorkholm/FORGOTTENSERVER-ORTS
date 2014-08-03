local config = {
	[13925] = {female = 431, male = 430, addon = 1, msg = 'first afflicted'},
	[13926] = {female = 431, male = 430, addon = 2, msg = 'second afflicted'},
	[18517] = {female = 514, male = 516, msg = 'soil guardian'}, -- soil guardian (base outfit)
	[18518] = {female = 514, male = 516, addon = 1, msg = 'first soil guardian'},
	[18519] = {female = 514, male = 516, addon = 2, msg = 'second soil guardian'},
	[18520] = {female = 513, male = 512, msg = 'crystal warlord'}, -- crystal warlord (base outfit)
	[18521] = {female = 513, male = 512, addon = 1, msg = 'first crystal warlord'},
	[18522] = {female = 513, male = 512, addon = 2, msg = 'second crystal warlord'}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	if useItem.addon then
		if player:hasOutfit(player:getSex() == 0 and useItem.female or useItem.male) then
			if not player:hasOutfit(player:getSex() == 0 and useItem.female or useItem.male, useItem.addon) then
				player:addOutfitAddon(useItem.female, useItem.addon)
				player:addOutfitAddon(useItem.male, useItem.addon)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. useItem.msg .. ' addon!')
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				Item(item.uid):remove(1)
			else
				player:sendCancelMessage('You have already obtained this addon!')
			end
		else
			return false
		end
	else
		if not player:hasOutfit(player:getSex() == 0 and useItem.female or useItem.male) then
			player:addOutfit(useItem.female)
			player:addOutfit(useItem.male)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have received the ' .. useItem.msg .. ' outfit!')
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):remove(1)
		else
			player:sendCancelMessage('You have already obtained this outfit!')
		end
	end
	return true
end