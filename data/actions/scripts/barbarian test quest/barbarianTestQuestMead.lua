function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3110) then
		if(getPlayerStorageValue(cid, 120) == 2 and getPlayerStorageValue(cid, 118) < 0) then
			if(math.random(1, 5) > 1) then
				doCreatureSay(cid, "The world seems to spin but you manage to stay on your feet.", TALKTYPE_ORANGE_1)
				if(getPlayerStorageValue(cid, 119) == 10) then
					setPlayerStorageValue(cid, 120, 3)
					return true
				end
				setPlayerStorageValue(cid, 119, getPlayerStorageValue(cid, 119) < 0 and 0 or getPlayerStorageValue(cid, 119) + 1)
			else
				doCreatureSay(cid, "The mead was too strong. You passed out for a moment.", TALKTYPE_ORANGE_1)
				setPlayerStorageValue(cid, 119, 0)
				setPlayerStorageValue(cid, 120, 1)
			end
			setPlayerStorageValue(cid, 118, getPlayerStorageValue(cid, 118) < 0 and 0 or getPlayerStorageValue(cid, 118) + 1)
		elseif(getPlayerStorageValue(cid, 120) == 1) then
			doCreatureSay(cid, "Ask Sven for another round.", TALKTYPE_ORANGE_1)
		elseif(getPlayerStorageValue(cid, 120) == 3) then
			doCreatureSay(cid, "You already passed the test, no need to torture yourself anymore.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end