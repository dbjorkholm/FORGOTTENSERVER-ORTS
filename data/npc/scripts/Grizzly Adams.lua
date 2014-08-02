local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end
 
local choose = {}
local cancel = {}
local available = {}

local grizzlyAdamsConfig = {
							ranks = {
									huntsMan_rank = {
													{id=11208, buy=0, sell=50, name='antlers'},
													{id=10549, buy=0, sell=100, name='bloody pincers'},
													{id=11183, buy=0, sell=35, name='crab pincers'},
													{id=10573, buy=0, sell=55, name='cyclops toe'},
													{id=10564, buy=0, sell=30, name='frosty ear of a troll'},
													{id=11193, buy=0, sell=600, name='hydra head'},
													{id=11366, buy=0, sell=80, name='lancer beetle shell'},
													{id=10578, buy=0, sell=420, name='mutated bat ear'},
													{id=11222, buy=0, sell=400, name='sabretooth'},
													{id=11367, buy=0, sell=20, name='sandcrawler shell'},
													{id=10547, buy=0, sell=280, name='scarab pincers'},
													{id=11365, buy=0, sell=60, name='terramite legs'},
													{id=11363, buy=0, sell=170, name='terramite shell'},
													{id=11184, buy=0, sell=95, name='terrorbird beak'},
													
													{id=7398, buy=0, sell=500, name='cyclops trophy'},
													{id=11315, buy=0, sell=15000, name='draken trophy'},
													{id=11330, buy=0, sell=8000, name='lizard trophy'},
													{id=7401, buy=0, sell=500, name='minotaur trophy'}
													},

									bigGameHunter_rank = {
													{id=7397, buy=0, sell=3000, name='deer trophy'},
													{id=7400, buy=0, sell=3000, name='lion trophy'},
													{id=7394, buy=0, sell=3000, name='wolf trophy'}
													},

									trophyHunter_rank = {
													{id=7393, buy=0, sell=40000, name='demon trophy'},
													{id=7396, buy=0, sell=20000, name='behemoth trophy'},
													{id=7399, buy=0, sell=10000, name='dragon lord trophy'},
													
													{id=10518, buy=1000, sell=0, name='demon backpack'},
													},
							        }
							}

local Topic = {}
local function greetCallback(cid)
	Topic[cid] = 0
	return true
end

local function setNewTradeTable(table)
	local items = {}
	for _, v in ipairs(table) do
		items[v.id] = {itemId = v.id, buyPrice = v.buy, sellPrice = v.sell, subType = 0, realName = v.name}
	end
	return items
end

local function setNewLineTable(oldTable, newTable)
	for k, v in pairs(oldTable) do
		table.insert(newTable, k, v)
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if (msgcontains(msg, "hi") or msgcontains(msg, "hello")) and (not npcHandler:isFocused(cid)) then
		if (player:getStorageValue(JOIN_STOR) == -1) then
			npcHandler:say("Welcome "..getCreatureName(cid)..". Would you like to join the 'Paw and Fur - Hunting Elite'?", cid)
			npcHandler:addFocus(cid)
			npcHandler.topic[cid] = 5
		else
			npcHandler:say("Welcome back old chap. What brings you here this time?", cid)
			npcHandler:addFocus(cid)
			npcHandler.topic[cid] = 0
			end
			return true
		end
	 
		if(not npcHandler:isFocused(cid)) then
			return false
		end
		
		if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
			npcHandler:say("Happy hunting, old chap!", cid, TRUE)
			Topic[talkUser] = 0
			npcHandler:releaseFocus(cid)
			npcHandler:resetNpc(cid)
		end
		
		if (isInArray({"yes", "join"}, msg:lower()) and npcHandler.topic[cid] == 5) then 
			player:setStorageValue(JOIN_STOR, 1)
			npcHandler:say("Great! A warm welcome to our newest member: "..getCreatureName(cid).."! Ask me for a {task} if you want to go on a hunt.", cid)
			npcHandler.topic[cid] = 0
		elseif (msg:lower() == "no" and npcHandler.topic[cid] == 5) then
			npcHandler:say("No problem old chap. Come back if you change your mind.", cid)  
		end

		if (player:getStorageValue(JOIN_STOR) == -1) then
				npcHandler:say("You'll have to {join} us to get more information.",cid)
	return false
end
if isInArray({"offer", "trade"}, msg:lower()) then
	if getPlayerRank(cid) >= 2 then 
		if getPlayerRank(cid) == 2 or getPlayerRank(cid) == 3 then
			tradeRank = grizzlyAdamsConfig.ranks.huntsMan_rank
		elseif getPlayerRank(cid) == 4 then
			tradeRank = grizzlyAdamsConfig.ranks.bigGameHunter_rank
			setNewLineTable(grizzlyAdamsConfig.ranks.huntsMan_rank, grizzlyAdamsConfig.ranks.bigGameHunter_rank)
		elseif getPlayerRank(cid) == 5 or getPlayerRank(cid) == 6 then
			tradeRank = grizzlyAdamsConfig.ranks.trophyHunter_rank
			setNewLineTable(grizzlyAdamsConfig.ranks.huntsMan_rank, grizzlyAdamsConfig.ranks.bigGameHunter_rank)
			setNewLineTable(grizzlyAdamsConfig.ranks.huntsMan_rank, grizzlyAdamsConfig.ranks.trophyHunter_rank)
		end
		local items = setNewTradeTable(tradeRank)
		local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if ignoreCap == false and (player:getFreeCapacity() < getItemWeight(items[item].itemId, amount) or inBackpacks and player:getFreeCap() < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1))) then
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You don\'t have enough cap.')
			end
			if items[item].buyPrice then
				player:removeMoney(amount * items[item].buyPrice)
				for i = 1, amount do
					if inBackpacks then
						local backpack = doCreateItemEx(1988, 1)
						doAddContainerItem(backpack, items[item].itemId, amount)
					else
						player:addItem(items[item].itemId, amount, true)
					end
				end
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
			end
			return true
			end
			 
		local function onSell(cid, item, subType, amount, ignoreCap, inBackpacks)
			if items[item].sellPrice then
				player:addMoney(items[item].sellPrice * amount)
				player:removeItem(items[item].itemId, amount)
				return player:sendTextMessage(cid, MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
		end
		openShopWindow(cid, tradeRank, onBuy, onSell)
		return npcHandler:say('It\'s my offer.', cid)
	else
		return npcHandler:say('You don\'t have any rank.', cid)
		end
end
 
	if isInArray({"tasks", "task", "mission"}, msg:lower()) then
		local can = getTasksByPlayer(cid)
		if (player:getStorageValue(JOIN_STOR) == -1) then
 	        return (npcHandler:say("You'll have to {join}, to get any {tasks}.",cid))
        end
		if #can > 0 then
			local text = ""
			local sep = ", "
			table.sort(can, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(can) do
				t = t + 1
				if t == #can - 1 then
					sep = " and "
				elseif t == #can then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
			npcHandler:say("The current task" .. (#can > 1 and "s" or "") .. " that you can choose " .. (#can > 1 and "are" or "is") .. " " .. text, cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("I don't have any task for you right now.", cid)
		end
	elseif msg ~= "" and canStartTask(cid, msg) then
		if #getPlayerStartedTasks(cid) >= tasksByPlayer then
			npcHandler:say("Sorry, but you already started " .. tasksByPlayer .. " tasks. You can check their {status} or {cancel} a task.", cid)
			return true
		end
		local task = getTaskByName(msg)
		if task and player:getStorageValue(QUESTSTORAGE_BASE + task) > 0 then  
			return false
		end
		npcHandler:say("In this task you must defeat " .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Are you sure that you want to start this task?", cid)
		choose[cid] = task
		npcHandler.topic[cid] = 1
	elseif msg:lower() == "yes" and npcHandler.topic[cid] == 1 then
		player:setStorageValue(QUESTSTORAGE_BASE + choose[cid], 1)
		player:setStorageValue(KILLSSTORAGE_BASE + choose[cid], 0)
		npcHandler:say("Excellent! You can check the {status} of your task saying {report} to me. Also you can {cancel} tasks to.", cid)
		choose[cid] = nil
		npcHandler.topic[cid] = 0	
	elseif (msg:lower() == "report" or msg:lower() == "status") then
		local started = getPlayerStartedTasks(cid)
		local finishedAtLeastOne = false
		local finished = 0
		if started and #started > 0 then
			for _, id in ipairs(started) do
				if player:getStorageValue(KILLSSTORAGE_BASE + id) >= tasks[id].killsRequired then
					for _, reward in ipairs(tasks[id].rewards) do
						local deny = false
						if reward.storage then
							if player:getStorageValue(reward.storage[1]) >= reward.storage[2] then
								deny = true
							end
						end
						if isInArray({REWARD_MONEY, "money"}, reward.type:lower()) and not deny then
							doPlayerAddMoney(cid, reward.value[1])
						elseif isInArray({REWARD_EXP, "exp", "experience"}, reward.type:lower()) and not deny then
							doPlayerAddExp(cid, reward.value[1], false, reward.value[1], false, true)
							doPlayerSendDefaultCancel(cid, "You gained " .. reward.value[1] .. " experience points.")
						elseif isInArray({REWARD_ACHIEVEMENT, "achievement", "ach"}, reward.type:lower()) and not deny then
						elseif isInArray({REWARD_STORAGE, "storage", "stor"}, reward.type:lower()) and not deny then
							player:setStorageValue(reward.value[1], reward.value[2])
						elseif isInArray({REWARD_POINT, "points", "point"}, reward.type:lower()) and not deny then
							player:setStorageValue(POINTSSTORAGE, player:getStorageValue(POINTSSTORAGE) + reward.value[1])
						elseif isInArray({REWARD_ITEM, "item", "items", "object"}, reward.type:lower()) and not deny then
							doPlayerAddItem(cid, reward.value[1], reward.value[2])
						end
 
						if reward.storage then
							player:setStorageValue(reward.storage[1], reward.storage[2])
						end
					end
 
					if tasks[id].norepeatable then
						player:setStorageValue(QUESTSTORAGE_BASE + id, 2)
					else
						player:setStorageValue(QUESTSTORAGE_BASE + id, 0)
					end
					player:setStorageValue(KILLSSTORAGE_BASE + id, 0)
					if player:getStorageValue(REPEATSTORAGE_BASE + id) < 1 then
						player:setStorageValue(REPEATSTORAGE_BASE + id, 0)
					end
					player:setStorageValue(REPEATSTORAGE_BASE + id, player:getStorageValue(REPEATSTORAGE_BASE + id) + 1)
					finishedAtLeastOne = true
					finished = finished + 1
				end
			end
	if (not finishedAtLeastOne) then
 		local started = getPlayerStartedTasks(cid)
		if (started and #started > 0) then	
			local text = ""
			local sep = ", "
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(started) do
				t = t + 1
				if (t == #started - 1) then
					sep = " and "
				elseif (t == #started) then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
			    npcHandler:say("The current task" .. (#started > 1 and "s" or "") .. " that you started " .. (#started > 1 and "are" or "is") .. " " .. text, cid)
			    Topic[cid] = 1
			else
				npcHandler:say("Awesome! you finished " .. (finished > 1 and "various" or "a") .. " task" .. (finished > 1 and "s" or "") .. ". Talk to me again if you want to start a {task}.", cid)
			end
		else
			npcHandler:say("You haven't started any task yet.", cid)
		end
	end
	elseif msg:lower() == "started" then
		local started = getPlayerStartedTasks(cid)
		if started and #started > 0 then
			local text = ""
			local sep = ", "
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(started) do
				t = t + 1
				if t == #started - 1 then
					sep = " and "
				elseif t == #started then
					sep = "."
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
 
			npcHandler:say("The current task" .. (#started > 1 and "s" or "") .. " that you started " .. (#started > 1 and "are" or "is") .. " " .. text, cid)
		else
			npcHandler:say("You haven't started any task yet.", cid)
		end
	elseif msg:lower() == "cancel" then
		local started = getPlayerStartedTasks(cid)
		local task = getTaskByName(msg)
		local text = ""
			local sep = ", "
			table.sort(started, (function(a, b) return (a < b) end))
			local t = 0
			for _, id in ipairs(started) do
				t = t + 1
				if t == #started - 1 then
					sep = " or "
				elseif t == #started then
					sep = "?"
				end
				text = text .. "{" .. (tasks[id].name or tasks[id].raceName) .. "}" .. sep
			end
		if started and #started > 0 then
			npcHandler:say("Cancelling a task will make the counter restart. Which of these tasks you want cancel?" .. (#started > 1 and "" or "") .. " " .. text, cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("You haven't started any task yet.", cid)
		end
	elseif getTaskByName(msg) and npcHandler.topic[cid] == 2 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if player:getStorageValue(KILLSSTORAGE_BASE + task) > 0 then
			npcHandler:say("You currently killed " .. player:getStorageValue(KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Cancelling this task will restart the count. Are you sure you want to cancel this task?", cid)
		else
			npcHandler:say("Are you sure you want to cancel this task?", cid)
		end
		npcHandler.topic[cid] = 3
		cancel[cid] = task
	elseif getTaskByName(msg) and Topic[cid] == 1 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if player:getStorageValue(KILLSSTORAGE_BASE + task) > 0 then
			npcHandler:say("You currently killed " .. player:getStorageValue(KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".", cid)
			Topic[cid] = 0
		else
		    npcHandler:say("You currently killed 0/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".", cid)
		end
	elseif msg:lower() == "yes" and npcHandler.topic[cid] == 3 then
		player:setStorageValue(QUESTSTORAGE_BASE + cancel[cid], -1)
		player:setStorageValue(KILLSSTORAGE_BASE + cancel[cid], -1)
		npcHandler:say("You have cancelled the task " .. (tasks[cancel[cid]].name or tasks[cancel[cid]].raceName) .. ".", cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"points", "rank"}, msg:lower()) then
	    if player:getStorageValue(POINTSSTORAGE) < 1 then
		npcHandler:say("At this time, you have 0 Paw & Fur points. You " .. (getPlayerRank(cid) == 6 and "are an Elite Hunter" or getPlayerRank(cid) == 5 and "are a Trophy Hunter" or getPlayerRank(cid) == 4 and "are a Big Game Hunter" or getPlayerRank(cid) == 3 and "are a Ranger" or getPlayerRank(cid) == 2 and "are a Huntsman" or getPlayerRank(cid) == 1 and "are a Member"  or "haven't been ranked yet") .. ".", cid)
		elseif player:getStorageValue(POINTSSTORAGE) >= 1 then 
		npcHandler:say("At this time, you have " .. player:getStorageValue(POINTSSTORAGE) .. " Paw & Fur points. You " .. (getPlayerRank(cid) == 6 and "are an Elite Hunter" or getPlayerRank(cid) == 5 and "are a Trophy Hunter" or getPlayerRank(cid) == 4 and "are a Big Game Hunter" or getPlayerRank(cid) == 3 and "are a Ranger" or getPlayerRank(cid) == 2 and "are a Huntsman" or getPlayerRank(cid) == 1 and "are a Member"  or "haven't been ranked yet") .. ".", cid)
		end
		npcHandler.topic[cid] = 0
elseif isInArray({"special task"}, msg:lower()) then
	    if player:getStorageValue(POINTSSTORAGE) >= 90 then -- Tiquandas Revenge 90 points
			if player:getStorageValue(22222) == 1 then  -- Check if he has already started the task.
				npcHandler:say("You have already started the task. Go find Tiquandas Revenge and take revenge yourself!", cid)
				else
				npcHandler:say({"Have you heard about Tiquandas Revenge? It is said that the jungle itself is alive and takes revenge for all the bad things people have done to it. ...", "I myself believe that there is some truth in this clap trap. Something 'real' which therefore must have a hideout somewhere. Go find it and take revenge yourself!"}, cid)
				setPlayerStorageValue(cid, 22555, 1) -- Task needed to enter Tiquandas Revenge TP
				setPlayerStorageValue(cid, 22222, 1) -- Won't give this task again.
			end
		end
		if player:getStorageValue(POINTSSTORAGE) >= 100 then -- Demodras 100 points
			if player:getStorageValue(22223) == 1 then  -- Check if he has already started the task.
			npcHandler:say("You have already started the special task. Find Demodras and kill it.", cid)
				else
				npcHandler:say("This task is a very dangerous one. I want you to look for Demodras' hideout. It might be somewhere under the Plains of Havoc. Good luck, old chap.", cid)
				setPlayerStorageValue(cid, 22556, 1) -- Task needed to enter Demodras TP
				setPlayerStorageValue(cid, 22223, 1) -- Won't give this task again.
			end
		end
		npcHandler.topic[cid] = 0
	end
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Happy hunting, old chap!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
