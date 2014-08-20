function onUse(cid, item, frompos, item2, topos)
	local chest_rew_cfg = {
		[15640] = {stor = 963,name = "Tanjis", rewards = {
				{2148, {1, 100}, 8000},{2148, {1, 100}, 8000},{2152, {1, 10}, 8000},{2667, {1, 5}, 8000},
				{15620, 1, 4000},{15452, {1, 2}, 4000},{15423, {1, 2}, 4000},{15426, {1, 2}, 4000},
				{15454, 1, 2000},{15647, 1, 2000},
				{15422, 1, 1000},{2143, {1, 5}, 1000},{2144, {1, 5}, 1000},{5910, {1, 2}, 1000},
				{7632, {1, 2}, 500},{7633, {1, 2}, 500},{15404, 1, 500},{8871, 1, 500},
				{10220, 1, 250},{7892, 1, 250},{7902, 1, 250},{15453, 1, 250},
				{7897, 1, 125},{8878, 1, 125},{15644, 1, 125},{7896, 1, 125},{15435, 1, 125},
				{15409, 1, 30},{15573, 1, 30},{15574, 1, 30},{15575, 1, 30}
			}
		},
		
		[15641] = {stor = 964,name = "Obujos", rewards = {
				{2148, {1, 100}, 8000},{2148, {1, 100}, 8000},{2152, {1, 30}, 8000},{2667, {1, 5}, 8000},
				{15619, 1, 4000},{15452, {1, 2}, 4000},{15423, {1, 2}, 4000},{15426, {1, 2}, 4000},
				{15403, 1, 2000},{15400, 1, 2000},{2479, 1, 2000},{2145, {1, 2}, 2000},
				{15422, 1, 1000},{2143, {1, 5}, 1000},{2144, {1, 5}, 1000},{5914, {1, 2}, 1000},
				{7632, {1, 2}, 500},{7633, {1, 2}, 500},{15647, 1, 500},{15454, 1, 500},
				{9822, 1, 250},{9810, 1, 250},{9813, 1, 250},{15451, 1, 250},
				{5461, 1, 125},{15409, 1, 125},{15436, 1, 125},
				{15573, 1, 60},{15574, 1, 60},{15575, 1, 60},
				{15638, 1, 30},
				{15412, 1, 15},{15411, 1, 15},{15545, 1, 15}
			}
		},
		
		[15642] = {stor = 965,name = "Jaul", rewards = {
				{2148, {1, 100}, 8000},{2148, {1, 100}, 8000},{2152, {1, 10}, 8000},{2667, {1, 5}, 8000},
				{15621, 1, 4000},{15452, {1, 2}, 4000},{15423, {1, 2}, 4000},{15426, {1, 2}, 4000},
				{15422, 1, 2000},{5022, {1, 15}, 2000},{2147, {1, 5}, 2000},{2669, {1, 2}, 2000},
				{5669, 1, 1000},{2143, {1, 5}, 1000},{2144, {1, 5}, 1000},{5911, {1, 2}, 1000},
				{7632, {1, 2}, 500},{7633, {1, 2}, 500},{2171, 1, 500},{2156, 1, 500},
				{9822, 1, 250},{9810, 1, 250},{9813, 1, 250},{2214, 1, 250},
				{9807, 1, 125},{9816, 1, 125},{9819, 1, 125},{2160, {1, 5}, 125},{15434, 1, 125},
				{15573, 1, 60},{15574, 1, 60},{15575, 1, 60},
				{15408, 1, 30},{15414, 1, 30},{15638, 1, 30},{15412, 1, 30},{15411, 1, 30},
				{8884, 1, 15},{15545, 1, 15},{15406, 1, 15},{15407, 1, 15},{15413, 1, 15},{15410, 1, 15}
			}
		}
	}
	deep_chest_rew_add = 0
	local deep_t_items = {}
	if getPlayerStorageValue(cid, chest_rew_cfg[item.itemid].stor) == 1 then
		setPlayerStorageValue(cid, chest_rew_cfg[item.itemid].stor, 0)
		if chest_rew_cfg[item.itemid].rewards ~= nil then
			for i = 1, #chest_rew_cfg[item.itemid].rewards do
				if math.random(1,10000) <= chest_rew_cfg[item.itemid].rewards[i][3] then
						if tonumber(chest_rew_cfg[item.itemid].rewards[i][2]) == nil then
							local ch_i_amount = math.random(chest_rew_cfg[item.itemid].rewards[i][2][1], chest_rew_cfg[item.itemid].rewards[i][2][2])
							doPlayerAddItem(cid, chest_rew_cfg[item.itemid].rewards[i][1], ch_i_amount)
							if ch_i_amount > 1 then
								table.insert(deep_t_items, ch_i_amount .. " " .. ItemType(chest_rew_cfg[item.itemid].rewards[i][1]):getPluralName())
							else
								table.insert(deep_t_items, ItemType(chest_rew_cfg[item.itemid].rewards[i][1]):getArticle() .. " " .. getItemName(chest_rew_cfg[item.itemid].rewards[i][1]))
							end
						else
							doPlayerAddItem(cid, chest_rew_cfg[item.itemid].rewards[i][1], chest_rew_cfg[item.itemid].rewards[i][2])
							if chest_rew_cfg[item.itemid].rewards[i][2] > 1 then
								table.insert(deep_t_items, chest_rew_cfg[item.itemid].rewards[i][2] .. " " .. ItemType(chest_rew_cfg[item.itemid].rewards[i][1]):getPluralName())
							else
								table.insert(deep_t_items, ItemType(chest_rew_cfg[item.itemid].rewards[i][1]):getArticle() .. " " .. getItemName(chest_rew_cfg[item.itemid].rewards[i][1]))
							end
						end
				end
			end
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"Loot: " .. table.concat(deep_t_items, ", "))
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, chest_rew_cfg[item.itemid].name .. " fights for his belongings and will not let you have them.")
	end
return true
end
