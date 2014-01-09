dofile('data/lib/killingInTheNameOfQuest.lua')
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
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
													{id=11184, buy=0, sell=30000, name='terrorbird beak'},
													
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
function greetCallback(cid)
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

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
if (msgcontains(msg, "hi") or msgcontains(msg, "hello")) and (not npcHandler:isFocused(cid)) then
if (getPlayerStorageValue(cid, 100157) == -1) then
        npcHandler:say("Welcome "..getCreatureName(cid)..". Would you like to join the 'Paw and Fur - Hunting Elite'?", cid)
		npcHandler:addFocus(cid)
		talkState[talkUser] = 5
  else
        npcHandler:say("Welcome back old chap. What brings you here this time?", cid)
        npcHandler:addFocus(cid)
        talkState[talkUser] = 0
		end
		return true
	end
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		selfSay("Happy hunting, old chap!", cid, TRUE)
		Topic[talkUser] = 0
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	end
	
	if (isInArray({"yes", "join"}, msg:lower()) and talkState[talkUser] == 5) then 
	    setPlayerStorageValue(cid, 100157, 1)
	    npcHandler:say("Great! A warm welcome to our newest member: "..getCreatureName(cid).."! Ask me for a {task} if you want to go on a hunt.", cid)
	    talkState[talkUser] = 0
   elseif (msg:lower() == "no" and talkState[talkUser] == 5) then
        npcHandler:say("No problem old chap. Come back if you change your mind.", cid)  
   end

if (getPlayerStorageValue(cid, 100157) == -1) then
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
			if ignoreCap == false and (getPlayerFreeCap(cid) < getItemWeightById(items[item].itemId, amount) or inBackpacks and getPlayerFreeCap(cid) < (getItemWeightById(items[item].itemId, amount) + getItemWeightById(1988, 1))) then
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You don\'t have enough cap.')
			end
			if items[item].buyPrice then
				doPlayerRemoveMoney(cid, amount * items[item].buyPrice)
				for i = 1, amount do
					if inBackpacks then
						local backpack = doCreateItemEx(1988, 1)
						doAddContainerItem(backpack, items[item].itemId, amount)
					else
						doPlayerAddItem(cid, items[item].itemId, amount, true)
					end
				end
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
			end
			return true
			end
			 
			local function onSell(cid, item, subType, amount, ignoreCap, inBackpacks)
			if items[item].sellPrice then
				doPlayerAddMoney(cid, items[item].sellPrice * amount)
				doPlayerRemoveItem(cid, items[item].itemId, amount)
				return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
			end
		openShopWindow(cid, tradeRank, onBuy, onSell)
		return selfSay('It\'s my offer.', cid)
	else
		return selfSay('You don\'t have any rank.', cid)
		end
end
 
	if isInArray({"tasks", "task", "mission"}, msg:lower()) then
		local can = getTasksByPlayer(cid)
		if (getPlayerStorageValue(cid, 100157) == -1) then
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
			selfSay("The current task" .. (#can > 1 and "s" or "") .. " that you can choose " .. (#can > 1 and "are" or "is") .. " " .. text, cid)
			talkState[talkUser] = 0
		else
			selfSay("I don't have any task for you right now.", cid)
		end
	elseif msg ~= "" and canStartTask(cid, msg) then
		if #getPlayerStartedTasks(cid) >= tasksByPlayer then
			selfSay("Sorry, but you already started " .. tasksByPlayer .. " tasks. You can check their {status} or {cancel} a task.", cid)
			return true
		end
		local task = getTaskByName(msg)
		if task and getPlayerStorageValue(cid, QUESTSTORAGE_BASE + task) > 0 then  
			return false
		end
		selfSay("In this task you must defeat " .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Are you sure that you want to start this task?", cid)
		choose[cid] = task
		talkState[talkUser] = 1
	elseif msg:lower() == "yes" and talkState[talkUser] == 1 then
		setPlayerStorageValue(cid, QUESTSTORAGE_BASE + choose[cid], 1)
		selfSay("Excellent! You can check the {status} of your task saying {report} to me. Also you can {cancel} tasks to.", cid)
		choose[cid] = nil
		talkState[talkUser] = 0	
	elseif (msg:lower() == "report" or msg:lower() == "status") then
		local started = getPlayerStartedTasks(cid)
		local finishedAtLeastOne = false
		local finished = 0
		if started and #started > 0 then
			for _, id in ipairs(started) do
				if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + id) >= tasks[id].killsRequired then
					for _, reward in ipairs(tasks[id].rewards) do
						local deny = false
						if reward.storage then
							if getPlayerStorageValue(cid, reward.storage[1]) >= reward.storage[2] then
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
							setPlayerStorageValue(cid, reward.value[1], reward.value[2])
						elseif isInArray({REWARD_POINT, "points", "point"}, reward.type:lower()) and not deny then
							setPlayerStorageValue(cid, POINTSSTORAGE, getPlayerStorageValue(cid, POINTSSTORAGE) + reward.value[1])
						elseif isInArray({REWARD_ITEM, "item", "items", "object"}, reward.type:lower()) and not deny then
							doPlayerAddItem(cid, reward.value[1], reward.value[2])
						end
 
						if reward.storage then
							setPlayerStorageValue(cid, reward.storage[1], reward.storage[2])
						end
					end
 
					if tasks[id].norepeatable then
						setPlayerStorageValue(cid, QUESTSTORAGE_BASE + id, 2)
					else
						setPlayerStorageValue(cid, QUESTSTORAGE_BASE + id, 0)
					end
					setPlayerStorageValue(cid, KILLSSTORAGE_BASE + id, 0)
					if getPlayerStorageValue(cid, REPEATSTORAGE_BASE + id) < 1 then
						setPlayerStorageValue(cid, REPEATSTORAGE_BASE + id, 0)
					end
					setPlayerStorageValue(cid, REPEATSTORAGE_BASE + id, getPlayerStorageValue(cid, REPEATSTORAGE_BASE + id) + 1)
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
			    selfSay("The current task" .. (#started > 1 and "s" or "") .. " that you started " .. (#started > 1 and "are" or "is") .. " " .. text, cid)
			    Topic[cid] = 1
			else
				selfSay("Awesome! you finished " .. (finished > 1 and "various" or "a") .. " task" .. (finished > 1 and "s" or "") .. ". Talk to me again if you want to start a {task}.", cid)
			end
		else
			selfSay("You haven't started any task yet.", cid)
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
 
			selfSay("The current task" .. (#started > 1 and "s" or "") .. " that you started " .. (#started > 1 and "are" or "is") .. " " .. text, cid)
		else
			selfSay("You haven't started any task yet.", cid)
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
			selfSay("Cancelling a task will make the counter restart. Which of these tasks you want cancel?" .. (#started > 1 and "" or "") .. " " .. text, cid)
			talkState[talkUser] = 2
		else
			selfSay("You haven't started any task yet.", cid)
		end
	elseif getTaskByName(msg) and talkState[talkUser] == 2 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) > 0 then
			selfSay("You currently killed " .. getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ". Cancelling this task will restart the count. Are you sure you want to cancel this task?", cid)
		else
			selfSay("Are you sure you want to cancel this task?", cid)
		end
		talkState[talkUser] = 3
		cancel[cid] = task
	elseif getTaskByName(msg) and Topic[cid] == 1 and isInArray(getPlayerStartedTasks(cid), getTaskByName(msg)) then
		local task = getTaskByName(msg)
		if getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) > 0 then
			selfSay("You currently killed " .. getPlayerStorageValue(cid, KILLSSTORAGE_BASE + task) .. "/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".", cid)
			Topic[cid] = 0
		else
		    selfSay("You currently killed 0/" .. tasks[task].killsRequired .. " " .. tasks[task].raceName .. ".", cid)
		end
	elseif msg:lower() == "yes" and talkState[talkUser] == 3 then
		setPlayerStorageValue(cid, QUESTSTORAGE_BASE + cancel[cid], -1)
		setPlayerStorageValue(cid, KILLSSTORAGE_BASE + cancel[cid], -1)
		selfSay("You have cancelled the task " .. (tasks[cancel[cid]].name or tasks[cancel[cid]].raceName) .. ".", cid)
		talkState[talkUser] = 0
	elseif isInArray({"points", "rank"}, msg:lower()) then
	    if getPlayerStorageValue(cid, POINTSSTORAGE) < 1 then
		selfSay("At this time, you have 0 Paw & Fur points. You " .. (getPlayerRank(cid) == 6 and "are an Elite Hunter" or getPlayerRank(cid) == 5 and "are a Trophy Hunter" or getPlayerRank(cid) == 4 and "are a Big Game Hunter" or getPlayerRank(cid) == 3 and "are a Ranger" or getPlayerRank(cid) == 2 and "are a Huntsman" or getPlayerRank(cid) == 1 and "are a Member"  or "haven't been ranked yet") .. ".", cid)
		elseif getPlayerStorageValue(cid, POINTSSTORAGE) >= 1 then 
		selfSay("At this time, you have " .. getPlayerStorageValue(cid, POINTSSTORAGE) .. " Paw & Fur points. You " .. (getPlayerRank(cid) == 6 and "are an Elite Hunter" or getPlayerRank(cid) == 5 and "are a Trophy Hunter" or getPlayerRank(cid) == 4 and "are a Big Game Hunter" or getPlayerRank(cid) == 3 and "are a Ranger" or getPlayerRank(cid) == 2 and "are a Huntsman" or getPlayerRank(cid) == 1 and "are a Member"  or "haven't been ranked yet") .. ".", cid)
		end
		talkState[talkUser] = 0
	end
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, "Happy hunting, old chap!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)