-- By Vinioliveirasilva --
-- contact: vinioliveirasilva@hotmail.com --

dofile('data/lib/MissionSelect.lua')

function onLogin(cid)
	RashidConversion(cid)
end

function RashidConversion(cid)

local list = {
			[1] = {101, 1},
			[2] = {101, 2},
			
			[3] = {102, 1},
			[4] = {102, 2},
			[5] = {102, 3},
			[6] = {102, 4},
			[7] = {102, 5},
			
			[8] = {103, 1},
			[9] = {103, 2},
			[10] = {103, 3},
			
			[11] = {104, 1},
			[12] = {104, 2},
			[13] = {104, 3},
			
			[14] = {105, 1},
			[15] = {105, 2},
			[16] = {105, 3},
			
			[17] = {106, 1},
			[18] = {106, 2},
			[19] = {106, 2},
			
			[20] = {107, 1}
}
	local Old = 85
	local Old.value = getPlayerStorageValue(cid, 85)
	
	if(Old.value > 0 and getPlayerStorageValue(cid, 107) < 0) then	
		for i = 1, Old.value do
			setPlayerStorageValue(cid, list[i][1], list[i][2])
		end
	end
	return true
end
