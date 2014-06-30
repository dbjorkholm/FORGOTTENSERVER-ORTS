local config = {
	Position({x = 33258, y = 31080, z = 8}),
	Position({x = 33266, y = 31084, z = 8}),
	Position({x = 33259, y = 31089, z = 8}),
	Position({x = 33263, y = 31093, z = 8})
}
function doClearMissionArea()
	Game.setStorageValue(Storage.ChildrenoftheRevolution.Mission05, -1)
	local spectators = Game.getSpectators(Position({x = 33268, y = 31119, z = 7}), false, true, 26, 26, 20, 20)
		if spectators ~= nil then
			for _, spectator in ipairs(spectators) do
				spectator:teleportTo({x = 33353, y = 31410, z = 8})
				spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				if spectator:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 19 then
					spectator:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 20)
				end
			end
		end
	local monsters = Game.getSpectators(Position({x = 33268, y = 31119, z = 7}), false, false, 26, 26, 20, 20)
		if monsters ~= nil then
			for _, monster in ipairs(monsters) do
				monster:getPosition():sendMagicEffect(CONST_ME_POFF)
				monster:remove()
			end
		end
	return true
end

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then 
		return true
	end
	startwavesCotR = false
	if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 19 then
		if Game.getStorageValue(Storage.ChildrenoftheRevolution.Mission05) ~= 1 then
			for i = 1, 4 do
				local otherplayer = Tile(Position(config[i])):getTopCreature() if otherplayer == nil or not otherplayer:isPlayer() then return true end
				otherplayer:say("A clicking sound tatters the silence.", TALKTYPE_ORANGE_1)
				startwavesCotR = true
			end
		end				
		if(startwavesCotR == true) then				
			Tile(Position({x = 33265, y = 31116, z = 8})):getItemById(3653):transform(3687)
			addEvent(function() Tile(Position({x = 33265, y = 31116, z = 8})):getItemById(3687):transform(3653) end, 30 * 1000) -- 30 sec until stair disappear
			Game.setStorageValue(Storage.ChildrenoftheRevolution.Mission05, 1)
			creatureCotR = ""
			for k = 1, 4 do
				for j = 1, 20 do
					addEvent(function() 
					if k < 3 then
						creatureCotR = "eternal guardian"
					else
						creatureCotR = "lizard chosen"
					end					
					CotRsummonPos = {x = math.random(33252, 33288), y = math.random(31105, 31134), z = 7} 
					Game.createMonster(creatureCotR, CotRsummonPos) 
					Position(CotRsummonPos):sendMagicEffect(CONST_ME_TELEPORT)
					end, k * 30 * 1000) -- 30 sec
				end
			end
			addEvent(doClearMissionArea, 5 * 30 * 1000)
		end
	end
	return true
end
