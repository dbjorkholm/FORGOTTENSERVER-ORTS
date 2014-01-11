function onStartup(interval)
	local gate=math.random(60)
	if gate <= 10 then
		setGlobalStorageValue(9710,1)
	elseif gate > 10 and gate <= 20 then
		setGlobalStorageValue(9711,1)
	elseif gate > 20 and gate <= 30 then
		setGlobalStorageValue(9712,1)
	elseif gate > 30 and gate <= 40 then
		setGlobalStorageValue(9713,1)
	elseif gate > 40 and gate <= 50 then
		setGlobalStorageValue(9714,1)
	elseif gate > 50 and gate <= 60 then
		setGlobalStorageValue(9716,1)
	end
end
