function onUse(cid, item, frompos, item2, topos)
if item.uid == 3314 then
  queststatus = getPlayerStorageValue(cid,3314)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a golden key 3304.")
   item_uid = doPlayerAddItem(cid,2091,1)
   doSetItemActionId(item_uid,3304)
   setPlayerStorageValue(cid,3314,1)
  else
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The chest is empty.")
  end
else
  return 0
end
return 1
end
