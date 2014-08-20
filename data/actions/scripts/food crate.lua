local delay = {
		[1] = 984,
		[2] = 86400 -- time
	}

function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid,delay[1]) > os.time() then
doPlayerSendCancel(cid,"You already took a crate. Next will arrive in ".. getPlayerStorageValue(cid,delay[1])-os.time() .." seconds.")
else
	doPlayerAddItem(cid, 9687,1)
	doCreatureSay(cid, "You have found a food crate.", TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
	setPlayerStorageValue(cid,delay[1],os.time()+delay[2])
end
return true
end
