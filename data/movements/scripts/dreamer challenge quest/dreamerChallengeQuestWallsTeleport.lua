function onStepIn(cid, item, pos)

	wall1 = {x=32760, y=32288, z=14, stackpos=1}
	wall2 = {x=32761, y=32288, z=14, stackpos=1}
	wall3 = {x=32762, y=32288, z=14, stackpos=1}
	wall4 = {x=32763, y=32288, z=14, stackpos=1}
	wall5 = {x=32764, y=32288, z=14, stackpos=1}
	wall6 = {x=32764, y=32289, z=14, stackpos=1}
	wall7 = {x=32764, y=32290, z=14, stackpos=1}
	wall8 = {x=32764, y=32291, z=14, stackpos=1}
	wall9 = {x=32764, y=32292, z=14, stackpos=1}
	wall10 = {x=32763, y=32292, z=14, stackpos=1}
	wall11 = {x=32762, y=32292, z=14, stackpos=1}
	wall12 = {x=32761, y=32292, z=14, stackpos=1}
	wall13 = {x=32760, y=32292, z=14, stackpos=1}
	wall14 = {x=32760, y=32291, z=14, stackpos=1}
	wall15 = {x=32760, y=32290, z=14, stackpos=1}
	wall16 = {x=32760, y=32289, z=14, stackpos=1}
	local hss = {x=32852, y=32287, z=14}
	local back = {x=32762, y=32305, z=14}
			


	getwall1 = getThingfromPos(wall1)
	getwall2 = getThingfromPos(wall2)
	getwall3 = getThingfromPos(wall3)
	getwall4 = getThingfromPos(wall4)
	getwall5 = getThingfromPos(wall5)
	getwall6 = getThingfromPos(wall6)
	getwall7 = getThingfromPos(wall7)
	getwall8 = getThingfromPos(wall8)
	getwall9 = getThingfromPos(wall9)
	getwall10 = getThingfromPos(wall10)
	getwall11 = getThingfromPos(wall11)
	getwall12 = getThingfromPos(wall12)
	getwall13 = getThingfromPos(wall13)
	getwall14 = getThingfromPos(wall14)
	getwall15 = getThingfromPos(wall15)
	getwall16 = getThingfromPos(wall16)


	if (item.uid == 9030 and getwall1.itemid == 0 and getwall2.itemid == 0 and getwall3.itemid == 0 and getwall4.itemid == 0 and getwall5.itemid == 0 and getwall6.itemid == 0 and getwall7.itemid == 0 and getwall8.itemid == 0 and getwall9.itemid == 0 and getwall10.itemid == 0 and getwall11.itemid == 0 and getwall12.itemid == 0 and getwall13.itemid == 0 and getwall14.itemid == 0 and getwall15.itemid == 0 and getwall16.itemid == 0) then
		doTeleportThing(cid,hss)
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)

	else
		doTeleportThing(cid,back)
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_TELEPORT)

	end
	return TRUE
end