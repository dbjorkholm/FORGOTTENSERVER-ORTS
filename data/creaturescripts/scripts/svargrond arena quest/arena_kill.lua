dofile('data/lib/SvargrondArenaQuest.lua')

function onKill(cid, target)
	local player = Player(cid)
	local pit = player:getStorageValue(STORAGE_PIT)
	local arena = player:getStorageValue(STORAGE_ARENA)
	if Player(target) then return true end
	if pit < 1 or pit > 10 then return true end
	if arena < 1 then return true end
 
	if isInArray(ARENA[arena].creatures, Monster(target):getName():lower()) then
		local pillar = Tile(Position(PITS[pit].pillar))
  		local pos = PITS[pit].pillar
		local effectpos = { 
			{x=pos.x-1,y=pos.y,z=pos.z},
			{x=pos.x+1,y=pos.y,z=pos.z},
			{x=pos.x+1,y=pos.y-1,z=pos.z},
			{x=pos.x+1,y=pos.y+1,z=pos.z},
			{x=pos.x,y=pos.y,z=pos.z}
		}  
		if pillar.itemid == ITEM_STONEPILLAR then
			for i = 1, table.maxn(effectpos) do 
				Position(effectpos[i]):sendMagicEffect(12)
		    	end 
			tile:getItemById(ITEM_STONEPILLAR):remove()		
			local tpaid = Game.createItem(ITEM_TELEPORT, 1, PITS[pit].tp)
			tpaid:setActionId(25200)
		else
			print("[Svargrond Arena::CreatureEvent] Cannot remove stone pillar on position X: " .. PITS[pit].pillar.x .. ", Y: " .. PITS[pit].pillar.y .. ", Z: " .. PITS[pit].pillar.z .. ".")
		end
		player:setStorageValue(STORAGE_PIT, pit + 1)
		player:say("Victory! Head through the new teleporter into the next room.", TALKTYPE_ORANGE_1)
	end
	return true
end