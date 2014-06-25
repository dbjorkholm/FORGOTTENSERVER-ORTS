local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local storeTable = ""
local tokenId = 6527
local itemsTable = {
	["Gingerbreadman"] = {itemId = 6501, tokens = 1},
	--["Christmas Cookie Tray"] = {itemId = , tokens = 1},
	["Gingerbread Recipe"] = {itemId = 6523, tokens = 10},
	["Jewel Case"] = {itemId = 8261, tokens = 25},
	["Santa Hat"] = {itemId = 6531, tokens = 50},
	["Santa Backpack"] = {itemId = 11263, tokens = 75},
	["Snowflake Tapestry"] = {itemId = 22649, tokens = 75},
	["Santa Doll"] = {itemId = 6512, tokens = 100},
	["Snowman Doll"] = {itemId = 11256, tokens = 150},
	["Snow Globe"] = {itemId = 22645, tokens = 150},
	["Frazzlemaw Santa"] = {itemId = 22642, tokens = 250},
	--["Leaf Golem Santa"] = {itemId = , tokens = 250},
	["Santa Music Box"] = {itemId = 22647, tokens = 250},
	["Santa Teddy"] = {itemId = 11255, tokens = 500},
	["Present Bag"] = {itemId = 6497, tokens = 1}
}

local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	local table = itemsTable[msg]
	if not npcHandler:isFocused(cid) then
		return false
	elseif table and npcHandler.topic[cid] == 0 then
		npcHandler:say("So you want to exchange "..msg..", for "..table["tokens"].." christmas tokens?", cid)
		storeTable = msg
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 1 then
		if player:removeItem(tokenId, itemsTable[storeTable]["tokens"]) then
			npcHandler:say("Thank you, here is your "..storeTable..".", cid)
			player:addItem(itemsTable[storeTable]["itemId"], 1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You don't have enough of tokens.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] > 0 then
		npcHandler:say("Come back when you are ready to trade some tokens!", cid)
	elseif msgcontains(msg, "santa claus") then
		npcHandler:say({"Well, he does not really like it if someone tells his story ... but I do! A long, long time ago Santa was nothing but a greedy little dwarf. A real miser, I tell ya ...",
				"He was greedy even by dwarven standards. He would never share anything or give away the cheapest thing in his possession ...",
				"One day a woman came to his house and asked him for a cup of water ...",
				"Of course he refused. He even mocked her for being so naive. But what he did not know was that this woman was some kind of mighty faery or perhaps a goddess in disguise ...",
				"Be it as it may, the woman cursed old Santa, forcing him to share his fortune with everyone he met ...",
				"Santa was horrified. Of course, he could not bear the thought of sharing anything at all. So he went into hiding ...",
				"He hid in the most remote places in the world, but time and again someone found him out, and the curse made him share his wealth ...",
				"And know something? Old Santa actually came to like it! He saw the joy his presents brought, and this opened his old stony heart ...",
				"And he learned that this way his fortune gave him more joy and pleasure than it ever did when he locked it away. ...",
				"Over the years he turned it into a game. He hid somewhere to reward those who found him ...",
				"But once every year, on a very special day which happens to be his curse's anniversary, he goes out and brings presents to the people, and especially to the children ...",
				"Well, that is his story ... Nah, that's not a tear in my eye. It's just the wind, you know."
			}, cid, 0, 1, 5000)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
