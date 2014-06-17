function onUse(cid, item, frompos, item2, topos)
if item.uid == 3311 then
  queststatus = getPlayerStorageValue(cid,3311)
  if queststatus == -1 then
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a copper key 3301.")
   item_uid = doPlayerAddItem(cid,2089,1)
   doSetItemActionId(item_uid,3301)
   setPlayerStorageValue(cid,3311,1)
  else
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"The dead tree is empty.")
  end
else
  return 0
end
return 1
end
