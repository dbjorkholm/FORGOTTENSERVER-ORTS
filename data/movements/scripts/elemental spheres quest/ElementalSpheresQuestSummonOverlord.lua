local t = {
	[8568] = {
		corpse = 8967,
		charged = 1495,
		inactive = 0,
		boss = 'Energy Overlord',
		effect = CONST_ME_BIGCLOUDS,
		summonPos = {x=33095, y=32194, z=13},
		pos = {
			{x=33094, y=32189, z=13},
			{x=33097, y=32189, z=13},
			{x=33099, y=32191, z=13},
			{x=33099, y=32194, z=13},
			{x=33097, y=32196, z=13},
			{x=33094, y=32196, z=13},
			{x=33092, y=32194, z=13},
			{x=33092, y=32191, z=13}
		}
	},
	[8569] = {
		corpse = 8969,
		charged = 8575,
		inactive = 8573,
		boss = 'Fire Overlord',
		effect = CONST_ME_FIREAREA,
		summonPos = {x=33199, y=32103, z=13},
		pos = {
			{x=33198, y=32102, z=13},
			{x=33201, y=32102, z=13},
			{x=33203, y=32104, z=13},
			{x=33203, y=32107, z=13},
			{x=33201, y=32109, z=13},
			{x=33198, y=32109, z=13},
			{x=33196, y=32107, z=13},
			{x=33196, y=32104, z=13}
		}
	},
	[8570] = {
		corpse = 8968,
		charged = 8574,
		inactive = 8571,
		boss = 'Ice Overlord',
		effect = CONST_ME_ICETORNADO,
		summonEffect = CONST_ME_ICEAREA,
		summonPos = {x=33286, y=32102, z=13},
		pos = {
			{x=33285, y=32097, z=13},
			{x=33288, y=32097, z=13},
			{x=33290, y=32099, z=13},
			{x=33290, y=32102, z=13},
			{x=33288, y=32104, z=13},
			{x=33285, y=32104, z=13},
			{x=33283, y=32102, z=13},
			{x=33283, y=32099, z=13}
		}
	},
	[8578] = {
		corpse = 8934,
		charged = 8576,
		inactive = 8572,
		boss = 'Earth Overlord',
		effect = CONST_ME_BIGPLANTS,
		summonPos = {x=33347, y=32208, z=13},
		pos = {
			{x=33346, y=32203, z=13},
			{x=33349, y=32203, z=13},
			{x=33351, y=32205, z=13},
			{x=33351, y=32208, z=13},
			{x=33349, y=32210, z=13},
			{x=33346, y=32210, z=13},
			{x=33344, y=32208, z=13},
			{x=33344, y=32205, z=13}
		}
	}
}
function onAddItem(moveitem, tileitem, position)
	local v = t[tileitem.itemid]
	if (v and v.corpse == moveitem.itemid and getGlobalStorageValue(tileitem.itemid) < 1) then
		for i = 1, #v.pos do
			if (getTileItemById(v.pos[i], v.charged).uid < 1) then
				return
			end
		end
		doRemoveItem(moveitem.uid)
		doSendMagicEffect(position, v.effect)
		doSendMagicEffect(v.summonPos, v.summonEffect or v.effect)
		doSummonCreature(v.boss, v.summonPos)
		setGlobalStorageValue(tileitem.itemid, 1)
	end
	return true
end