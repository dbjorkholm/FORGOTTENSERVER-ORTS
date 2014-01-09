function onUse(cid, item, frompos, item2, topos)
	wall1 = {x=33226, y=31721, z=11, stackpos=1}
	wall2 = {x=33227, y=31721, z=11, stackpos=1}
	wall3 = {x=33228, y=31721, z=11, stackpos=1}
	wall4 = {x=33229, y=31721, z=11, stackpos=1}
	wall5 = {x=33230, y=31721, z=11, stackpos=1}
	wall6 = {x=33231, y=31721, z=11, stackpos=1}
	wall7 = {x=33232, y=31721, z=11, stackpos=1}
	wall8 = {x=33233, y=31721, z=11, stackpos=1}
	wall9 = {x=33234, y=31721, z=11, stackpos=1}
	wall10 = {x=33235, y=31721, z=11, stackpos=1}
	wall11 = {x=33236, y=31721, z=11, stackpos=1}
	wall12 = {x=33237, y=31721, z=11, stackpos=1}
	wall13 = {x=33238, y=31721, z=11, stackpos=1}
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
	

	if item.itemid == 1945 and getwall1.itemid == 1524 then
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doRemoveItem(getwall3.uid,1)
		doRemoveItem(getwall4.uid,1)
		doRemoveItem(getwall5.uid,1)
		doRemoveItem(getwall6.uid,1)
		doRemoveItem(getwall7.uid,1)
		doRemoveItem(getwall8.uid,1)
		doRemoveItem(getwall9.uid,1)
		doRemoveItem(getwall10.uid,1)
		doRemoveItem(getwall11.uid,1)
		doRemoveItem(getwall12.uid,1)
		doRemoveItem(getwall13.uid,1)
		
		doCreateItem(1050,1,wall1)
		doCreateItem(1050,1,wall2)
		doCreateItem(1050,1,wall3)
		doCreateItem(1050,1,wall4)
		doCreateItem(1050,1,wall5)
		doCreateItem(1050,1,wall6)
		doCreateItem(1050,1,wall7)
		doCreateItem(1050,1,wall8)
		doCreateItem(1050,1,wall9)
		doCreateItem(1050,1,wall10)
		doCreateItem(1050,1,wall11)
		doCreateItem(1050,1,wall12)
		doCreateItem(1050,1,wall13)
		doTransformItem(item.uid,item.itemid+1)
	elseif item.itemid == 1946 then
	
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doRemoveItem(getwall3.uid,1)
		doRemoveItem(getwall4.uid,1)
		doRemoveItem(getwall5.uid,1)
		doRemoveItem(getwall6.uid,1)
		doRemoveItem(getwall7.uid,1)
		doRemoveItem(getwall8.uid,1)
		doRemoveItem(getwall9.uid,1)
		doRemoveItem(getwall10.uid,1)
		doRemoveItem(getwall11.uid,1)
		doRemoveItem(getwall12.uid,1)
		doRemoveItem(getwall13.uid,1)
		doTransformItem(item.uid,item.itemid-1)	
		
		doCreateItem(1524,1,wall1)
		doCreateItem(1524,1,wall2)
		doCreateItem(1524,1,wall3)
		doCreateItem(1524,1,wall4)
		doCreateItem(1524,1,wall5)
		doCreateItem(1524,1,wall6)
		doCreateItem(1524,1,wall7)
		doCreateItem(1524,1,wall8)
		doCreateItem(1524,1,wall9)
		doCreateItem(1524,1,wall10)
		doCreateItem(1524,1,wall11)
		doCreateItem(1524,1,wall12)
		doCreateItem(1524,1,wall13)
		
		
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end