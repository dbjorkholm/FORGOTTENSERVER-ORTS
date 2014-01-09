local d_chest =
{
	[9008] = {reward = 2495, count = 1},
	[9009] = {reward = 8905, count = 1},
	[9010] = {reward = 16111, count = 1},
	[9011] = {reward = 16112, count = 1}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (d_chest[item.uid]) then
		local t = d_chest[item.uid]
         	if(getPlayerStorageValue(cid, 1010) == 2) then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found " .. getItemName(t.reward) .. ".")
			doPlayerAddItem(cid, t.reward, t.count)
			setPlayerStorageValue(cid, 1010, 3)
			doPlayerAddExp(cid, 250000, true, true)
			if (getSex == 0) then
				doPlayerAddOutfit(cid,542,2)
			else
				doPlayerAddOutfit(cid,541,2)
			end
        	else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It's empty.")
    		end
	end
    	return true
end