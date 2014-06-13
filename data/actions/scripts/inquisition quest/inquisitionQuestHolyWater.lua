local pos = {x=32260,y=32791,z =7}

local time = 10

local function OpenDoor()
	return (doTransformItem(getTileItemById( pos,8696 ).uid, 8697))
end

local function transformBack1()
	return (doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8754).uid, 8755))
end

local function transformBack2()
	return (doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8756).uid, 8757))
end

local function transformBack3()
	return (doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8758).uid, 8759))
end

local function transformBack4()
	return (doTransformItem(getTileItemById( {x=33115,y=31702,z =12},8759).uid, 8753))
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	-- Eclipse
	if(itemEx.actionid == 2000) then
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_FIREAREA)
		setPlayerStorageValue(cid, Storage.TheInquisition.Questline, 5)
		Player(cid):setStorageValue(Storage.TheInquisition.Mission02, 2) -- The Inquisition Questlog- "Mission 2: Eclipse"
	end
	-- Haunted Ruin
	if(itemEx.actionid == 2003) then
		if(getPlayerStorageValue(cid, Storage.TheInquisition.Questline) == 12) then
			doSummonCreature("Pirate Ghost", toPosition)
			doRemoveItem(item.uid, 1)
			setPlayerStorageValue(cid, Storage.TheInquisition.Questline, 13)
			Player(cid):setStorageValue(Storage.TheInquisition.Mission04, 2) -- The Inquisition Questlog- "Mission 4: The Haunted Ruin"
			doTransformItem(getTileItemById( pos,8697 ).uid, 8696)
			addEvent(OpenDoor, 10*1000)
		end
	end
	-- Shadow Nexus
	if(itemEx.itemid == 8753) then
		doTransformItem(itemEx.uid, 8754)
		addEvent(transformBack1, time*1000)
		doCreatureSay(cid,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_ORANGE_2, false, cid, getThingPos(itemEx.uid)) 
	elseif(itemEx.itemid == 8755) then
		doTransformItem(itemEx.uid, 8756)
		addEvent(transformBack2, time*1000)
		doCreatureSay(cid,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_ORANGE_2, false, cid, getThingPos(itemEx.uid)) 
	elseif(itemEx.itemid == 8757) then
		doTransformItem(itemEx.uid, 8758)
		addEvent(transformBack3, time*1000)
		doCreatureSay(cid,""..getCreatureName(cid).." damaged the shadow nexus! You can't damage it while it's burning.",TALKTYPE_ORANGE_2, false, cid, getThingPos(itemEx.uid)) 
	elseif(itemEx.itemid == 8759) then
		if(getGlobalStorageValue(210) < 1) then
			addEvent(setGlobalStorageValue, 20 * 1000, 210, 0)
		end
		if(getPlayerStorageValue(cid, Storage.TheInquisition.Questline) < 22) then
			setPlayerStorageValue(cid, Storage.TheInquisition.Questline, 22)
			Player(cid):setStorageValue(Storage.TheInquisition.Mission07, 2) -- The Inquisition Questlog- "Mission 7: The Shadow Nexus"
		end
		doCreatureSay(cid,""..getCreatureName(cid).." destroyed the shadow nexus! In 20 seconds it will return to its original state.",TALKTYPE_ORANGE_2, false, cid, getThingPos(itemEx.uid))
		doRemoveItem(item.uid, 1)
		addEvent(transformBack4, 60*1000)
	end
	return true
end