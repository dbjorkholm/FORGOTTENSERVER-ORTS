local pos = {
	{x = 33385, y = 31139, z = 8},
	{x = 33385, y = 31134, z = 8},
	{x = 33385, y = 31126, z = 8},
	{x = 33385, y = 31119, z = 8},
	{x = 33385, y = 31118, z = 8},
	{x = 33380, y = 31085, z = 8},
	{x = 33380, y = 31093, z = 8}
}

function onThink(interval, lastExecution)
	for i = 1, 5 do
		if(math.random(2) == 1) then
			if(getTileItemById(pos[i], 12214).uid > 0) then
				doTransformItem(getTileItemById(pos[i], 12214).uid, 12213)
			else
				doTransformItem(getTileItemById(pos[i], 12213).uid, 12214)
			end
		end
	end
	return true
end