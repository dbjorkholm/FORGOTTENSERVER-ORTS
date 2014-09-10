-- only usedi in "getTileItemById"
function pushThing(thing)
	local t = {uid = 0, itemid = 0, type = 0, actionid = 0}
	if thing ~= nil then
		if thing:isItem() then
			t.uid = thing:getUniqueId()
			t.itemid = thing:getId()
			if ItemType(t.itemid):hasSubType() then
				t.type = thing:getSubType()
			end
			t.actionid = thing:getActionId()
		elseif thing:isCreature() then
			t.uid = thing:getId()
			t.itemid = 1
			if thing:isPlayer() then
				t.type = 1
			elseif thing:isMonster() then
				t.type = 2
			else
				t.type = 3
			end
		end
	end
	return t
end

function doCreatureSay(cid, text, type, ...) local c = Creature(cid) return c ~= nil and c:say(text, type, ...) or false end

-- used by Npcs
function doPlayerAddItemEx(cid, uid, ...) local p = Player(cid) return p ~= nil and p:addItemEx(Item(uid), ...) or false end

function doTransformItem(uid, newItemId, ...) local i = Item(uid) return i ~= nil and i:transform(newItemId, ...) or false end
function doRemoveItem(uid, ...) local i = Item(uid) return i ~= nil and i:remove(...) or false end

function doSendMagicEffect(pos, magicEffect, ...) return Position(pos):sendMagicEffect(magicEffect, ...) end

function getPromotedVocation(vocationId)
	local vocation = Vocation(vocationId)
	if vocation == nil then
		return 0
	end

	local promotedVocation = vocation:getPromotion()
	if promotedVocation == nil then
		return 0
	end
	return promotedVocation:getId()
end

function getTileItemById(position, itemId, ...)
	local t = Tile(position)
	if t == nil then
		return pushThing(nil)
	end
	return pushThing(t:getItemById(itemId, ...))
end

function doTeleportThing(uid, dest, pushMovement)
	if type(uid) == "userdata" then
		if uid:isCreature() then
			return uid:teleportTo(dest, pushMovement or false)
		else
			return uid:moveTo(dest)
		end
	else
		if uid >= 0x10000000 then
			local creature = Creature(uid)
			if creature ~= nil then
				return creature:teleportTo(dest, pushMovement or false)
			end
		else
			local item = Item(uid)
			if item ~= nil then
				return item:moveTo(dest)
			end
		end
	end
	return false
end

function getConfigInfo(info)
	if type(info) ~= "string" then
		return nil
	end
	dofile('config.lua')
	return _G[info]
end

function doCreateTeleport(itemId, destination, position)
	local item = Game.createItem(itemId, 1, position)
	if not item:isTeleport() then
		item:remove()
		return false
	end
	item:setDestination(destination)
	return item:getUniqueId()
end

function broadcastMessage(message, messageType)
	Game.broadcastMessage(message, messageType)
	print("> Broadcasted message: \"" .. message .. "\".")
end
