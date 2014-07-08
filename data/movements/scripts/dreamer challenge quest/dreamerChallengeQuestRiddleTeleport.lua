function onStepIn(cid, item, position, fromPosition)
	--[[for x = 0, 2 do
		for y = 0, 2 do
			if(getTileItemById({x = 32818 + x, y = 32334 + y, z = 9}, 1686).uid < 1) then
				doTeleportThing(cid, fromPosition)
				return true
			end	
		end
	end
	for x = 0, 2 do
		for y = 0, 2 do
			if(getTileItemById({x = 32818 + x, y = 32337 + y, z = 9}, 1687).uid < 1) then
				doTeleportThing(cid, fromPosition)
				return true
			end	
		end
	end
	for x = 0, 2 do
		for y = 0, 2 do
			if(getTileItemById({x = 32821 + x, y = 32337 + y, z = 9}, 1689).uid < 1) then
				doTeleportThing(cid, fromPosition)
				return true
			end	
		end
	end
	for x = 0, 2 do
		for y = 0, 2 do
			if(getTileItemById({x = 32821 + x, y = 32334 + y, z = 9}, 1688).uid < 1) then
				doTeleportThing(cid, fromPosition)
				return true
			end	
		end
	end
	doTeleportThing(cid, {x = 32766, y = 32275, z = 14})
	doSendMagicEffect({x = 32766, y = 32275, z = 14}, CONST_ME_TELEPORT)	
	blue = 0
	red = 0
	yellow = 0
	green = 0
	id = 0
	for x = 0, 5 do
		for y = 0, 5 do
			loop = true
			while(loop) do
				id = math.random(1686, 1689)
				if(id == 1686) then
					if(blue < 9) then
						doTransformItem(getThingfromPos({x = 32818 + x, y = 32334 + y, z = 9, stackpos = 1}).uid, id)
						blue = blue + 1
						loop = false
					end
				elseif(id == 1687) then
					if(red < 9) then
						doTransformItem(getThingfromPos({x = 32818 + x, y = 32334 + y, z = 9, stackpos = 1}).uid, id)
						red = red + 1
						loop = false
					end
				elseif(id == 1688) then
					if(green < 9) then
						doTransformItem(getThingfromPos({x = 32818 + x, y = 32334 + y, z = 9, stackpos = 1}).uid, id)
						green = green + 1
						loop = false
					end
				elseif(id == 1689) then
					if(yellow < 9) then
						doTransformItem(getThingfromPos({x = 32818 + x, y = 32334 + y, z = 9, stackpos = 1}).uid, id)
						yellow = yellow + 1
						loop = false
					end
				end
			end
		end
	end
	return true]]--
	doTeleportThing(cid, {x = 32766, y = 32275, z = 14})
	doSendMagicEffect({x = 32766, y = 32275, z = 14}, CONST_ME_TELEPORT)
end