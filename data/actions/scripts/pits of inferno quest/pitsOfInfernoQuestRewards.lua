-- 10544 = PoI Arcane Staff.
-- 10545 = PoI Avenger.
-- 10546 = PoI Arbalest.
-- 10547 = PoI Soft Boots.
-- 10548 = PoI BackPack of Holding.
-- 10549 = PoI Stuffed Dragon.
-- 10550 = PoI Frozen Starlight.
-- 10551 = PoI Ceremonial Ankh
-- 10552 = Holy Tible

function onUse(cid, item, frompos, item2, topos)

	if item.uid == 10544 then
if getPlayerStorageValue(cid,10544) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have chosen an arcane staff.")
 	doPlayerAddItem(cid,2453,1)
 	setPlayerStorageValue(cid,10544,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
 
	elseif item.uid == 10545 then
if getPlayerStorageValue(cid,10544) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have chosen the avenger.")
 	doPlayerAddItem(cid,6528,1)
 	setPlayerStorageValue(cid,10544,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
 
 	elseif item.uid == 10546 then
if getPlayerStorageValue(cid,10544) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have chosen an arbalest.")
 	doPlayerAddItem(cid,5803,1)
 	setPlayerStorageValue(cid,10544,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
 
	elseif item.uid == 10547 then
if getPlayerStorageValue(cid,10547) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a pair of soft boots.")
 	doPlayerAddItem(cid,6132,1)
 	setPlayerStorageValue(cid,10547,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
	elseif item.uid == 10549 then
if getPlayerStorageValue(cid,10549) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a stuffed dragon.")
 	doPlayerAddItem(cid,5791,1)
 	setPlayerStorageValue(cid,10549,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
	elseif item.uid == 10550 then
if getPlayerStorageValue(cid,10550) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a frozen starlight.")
 	doPlayerAddItem(cid,2361,1)
 	setPlayerStorageValue(cid,10550,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
 elseif item.uid == 10559 then
if getPlayerStorageValue(cid,10559) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found 100 platinum coins.")
 	doPlayerAddItem(cid,2152,100)
 	setPlayerStorageValue(cid,10559,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
  elseif item.uid == 10548 then
if getPlayerStorageValue(cid,10548) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a backpack of holding.")
 	doPlayerAddItem(cid,2365,1)
 	setPlayerStorageValue(cid,10548,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end
	elseif item.uid == 10552 then
 
if getPlayerStorageValue(cid,10552) == -1 then
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found the holy Tible.")
 	local book = doPlayerAddItem(cid,1970,1)
 	doSetItemText(book,"Banor I praise your name.\nBe with me in the battle.\nBe my shield, let me be your sword.\nI will honour the godly spark in my soul. May it flourish and grow.")
 	setPlayerStorageValue(cid,10552,1)
 else
 	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
 end

end
return TRUE
end