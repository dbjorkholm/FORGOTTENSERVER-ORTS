local function removeTeleport(position)
	local teleportItem = Tile(position):getItemById(1387)
	if teleportItem then
		teleportItem:remove()
		position:sendMagicEffect(CONST_ME_POFF)
	end
end

function onKill(cid, target)
	local azerus = Monster(target)
	if not azerus or azerus:getName():lower() ~= 'azerus' then
		return true
	end

	local position = azerus:getPosition()
	doCreateTeleport(1387, {x=32780, y=31168, z=14}, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	azerus:say('Azerus ran into teleporter! It will disappear in 2 minutes. Enter it!', TALKTYPE_MONSTER_SAY, 0, 0, position)

	--remove portal after 2 min
	addEvent(removeTeleport, 2 * 60 * 1000, position)

	--clean arena of monsters
	local monsters = Game.getSpectators(Position({x = 32783, y = 31166, z = 10}), false, false, 10, 10, 10, 10)
	for _, monster in ipairs(monsters) do
		if monster:isMonster() then
			monster:getPosition():sendMagicEffect(CONST_ME_POFF)
			monster:remove()
		end
	end
	return true
end