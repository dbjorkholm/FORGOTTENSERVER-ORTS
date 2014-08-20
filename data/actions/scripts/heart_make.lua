
function onUse(cid, item, fromPosition, itemEx, toPosition)
if itemEx.itemid == 15560 then
doRemoveItem(item.uid)
doSetItemSpecialDescription(doPlayerAddItem(cid, 15431, 1), "This formidable gem was hand-cut by " .. getPlayerName(cid) .. ".")
doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_BUBBLES)
return true
end
return false
end
