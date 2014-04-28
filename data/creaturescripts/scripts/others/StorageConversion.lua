-- By Vinioliveirasilva --
-- contact: vinioliveirasilva@hotmail.com --

function onLogin(cid)
	RashidConversion(cid)
	GreenDjinnConversion(cid)
	BlueDjinnConversion(cid)
	return true
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
	local player = Player(cid)
	local Old = 85
	local OldValue = player:getStorageValue(85)
	
	if(OldValue > 0 and player:getStorageValue(107) < 0) then	
		for i = 1, OldValue do
			player:setStorageValue(list[i][1], list[i][2])
		end
	end
	if(OldValue == 20) then
		player:setStorageValue(Old, -1)
	end
	return true
end

function GreenDjinnConversion(cid)

local list = {
			[1] = {121, 1},
			
			[2] = {122, 1},
			[3] = {122, 2},
			[4] = {122, 3},
			[5] = {122, 4},
			
			[6] = {123, 1},
			[7] = {123, 2},
			[8] = {123, 3},
			
			[9] = {124, 1},
			[10] = {124, 2},
			[11] = {124, 3},
			[12] = {124, 4}
}
	local player = Player(cid)
	local Old = 81
	local OldValue = player:getStorageValue(81)
	
	if(OldValue > 0 and player:getStorageValue(124) <= 4) then	
		for i = 1, OldValue do
			player:setStorageValue(list[i][1], list[i][2])
		end
	end
	if(OldValue == 12) then
		player:setStorageValue(Old, -1)
	end
	return true
end

function BlueDjinnConversion(cid)

local list = {
			[1] = {111, 1},
			
			[2] = {112, 1},
			[3] = {112, 2},
			[4] = {112, 3},
			
			[5] = {113, 1},
			[6] = {113, 2},
			[7] = {113, 3},

			[8] = {114, 1},
			[9] = {114, 2},
			[10] = {114, 3},
			[11] = {114, 4}
}
	local player = Player(cid)
	local Old = 82
	local OldValue = player:getStorageValue( 82)
	
	if(OldValue > 0 and player:getStorageValue(114) <= 3) then	
		for i = 1, OldValue do
			player:setStorageValue(list[i][1], list[i][2])
		end
	end
	if(OldValue == 11) then
		player:setStorageValue(Old, -1)
	end
	return true
end