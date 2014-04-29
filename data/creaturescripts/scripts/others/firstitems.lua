-- With Rookgaard

--[[ 
local firstItems = {2050, 2382}

function onLogin(cid)
	local player = Player(cid)
	if player:getLastLoginSaved() <= 0 then
		for i = 1, #firstItems do
			player:addItem(firstItems[i], 1)
		end
		player:addItem(player:getSex() == 0 and 2651 or 2650, 1)
		player:addItem(1987, 1)
		player:addItem(2674, 1)
	end
	return true
end
]]--

-- Without Rookgaard

local config = {
    [1] = {
        --equipment spellbook, wand of vortex, magician's robe, mage hat
        {{2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}},
        --container rope, shovel, mana potion
        {{2120, 1}, {2554, 1}, {7620, 1}}
    },
    [2] = {
        --equipment spellbook, snakebite rod, magician's robe, mage hat
        {{2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}},
        --container rope, shovel, mana potion
        {{2120, 1}, {2554, 1}, {7620, 1}}
    },
    [3] = {
        --equipment steel shield, 5 spear, ranger's cloak, ranger legs
        {{2509, 1}, {2389, 5}, {2660, 1}, {8923, 1}},
        --container rope, shovel, health potion, bow, 50 arrow
        {{2120, 1}, {2554, 1}, {7618, 1}, {2456, 1}, {2544, 50}}
    },
    [4] = {
        --equipment steel shield, steel axe, brass armor, soldier helmet, brass legs
        {{2509, 1}, {8601, 1}, {2465, 1}, {2481, 1}, {2478, 1}},
        --container jagged sword, daramian mace, rope, shovel, health potion
        {{8602, 1}, {2439, 1}, {2120, 1}, {2554, 1}, {7618, 1}}
    }
}

function onLogin(cid)
    local player = Player(cid)
    local targetVocation = config[player:getVocation():getId()]
    if not targetVocation then
        return true
    end
 
    if player:getLastLoginSaved() == 0 then
        for i = 1, #targetVocation[1] do
            player:addItem(targetVocation[1][i][1], targetVocation[1][i][2])
        end
     
        local backpack = player:addItem(1988)
        for i = 1, #targetVocation[2] do
            backpack:addItem(targetVocation[2][i][1], targetVocation[2][i][2])
        end
    end
    return true
end
