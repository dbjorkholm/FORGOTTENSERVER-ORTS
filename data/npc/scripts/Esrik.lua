local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end


function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and (not npcHandler:isFocused(cid)) then
		npcHandler:say("Hello, ".. getCreatureName(cid) .." and welcome to my little forge.", cid, TRUE)
		npcHandler:addFocus(cid)
	elseif(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("Bye.", cid, TRUE)
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "trade") then
		local items = {
			{name="axe", id=2386, buy=20, sell=7},
			{name="battle hammer", id=2417, buy=350},
			{name="brass armor", id=2465, buy=450, sell=150},
			{name="chain armor", id=2464, buy=200, sell=70},
			{name="chain helmet", id=2458, buy=52, sell=17},
			{name="chain legs", id=2648, buy=80, sell=25},
			{name="dagger", id=2351, buy=5},
			{name="hand axe", id=2380, buy=8, sell=4},
			{name="leather armor", id=2467, buy=35, sell=12},
			{name="leather helmet", id=2461, buy=12},
			{name="mace", id=2398, buy=90, sell=30},
			{name="rapier", id=2384, buy=15, sell=5},
			{name="sabre", id=2385, buy=35, sell=12},
			{name="spear", id=2389, buy=10, sell=3},
			{name="steel shield", id=2509, buy=240, sell=80},
			{name="sword", id=2376, buy=85, sell=25},
			{name="throwing knife", id=2410, buy=25},
			{name="wooden shield", id=2512, buy=15, sell=3},
			{name="battle axe", id=2378, sell=80},
			{name="battle shield", id=2513, sell=95},
			{name="halberd", id=2381, sell=400},
			{name="morning star", id=2394, sell=90},
			{name="plate armor", id=2463, sell=400},
			{name="steel helmet", id=2457, sell=190},
			{name="two handed sword", id=2377, sell=450},
			{name="warmaster's wristguards", id=11316, sell=200}
		}
		if getPlayerStorageValue(cid, 85300) >= 3 then
			table.insert(items, {name="lizard weapon rack kit", id=11120, buy=500})
		end
		if getPlayerStorageValue(cid, 85300) >= 9 then
			table.insert(items, {name="twin hooks", id=11303, buy=1100, sell=500})
			table.insert(items, {name="zaoan halberd", id=11317, buy=1200, sell=500})
			table.insert(items, {name="bone shoulderplate", id=11315, sell=150})
			table.insert(items, {name="broken halberd", id=11329, sell=100})
			table.insert(items, {name="cursed shoulder spikes", id=11321, sell=320})
			table.insert(items, {name="drachaku", id=11302, sell=10000})
			table.insert(items, {name="drakinata", id=11299, sell=10000})
			table.insert(items, {name="draken boots", id=12621, sell=40000})
			table.insert(items, {name="guardian boots", id=11234, sell=35000})
			table.insert(items, {name="high guard's shoulderplates", id=11327, sell=130})
			table.insert(items, {name="legionnaire flags", id=11328, sell=500})
			table.insert(items, {name="sais", id=11300, sell=16500})
			table.insert(items, {name="spiked iron ball", id=11319, sell=100})
			table.insert(items, {name="trashed draken boots", id=12607, sell=40000})
			table.insert(items, {name="twiceslicer", id=12574, sell=28000})
			table.insert(items, {name="wailing widow's necklace", id=11323, sell=3000})
			table.insert(items, {name="zaoan armor", id=11295, sell=14000})
			table.insert(items, {name="zaoan helmet", id=11296, sell=45000})
			table.insert(items, {name="zaoan legs", id=11298, sell=14000})
			table.insert(items, {name="zaoan shoes", id=11297, sell=5000})
			table.insert(items, {name="zaoan sword", id=11301, sell=30000})
			table.insert(items, {name="zaogun's shoulderplates", id=11325, sell=150})
		end
		openShopWindow(cid, items,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnSell(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end
		)
		npcHandler:say("Of course, just browse through my wares.", cid)
	end
	return TRUE
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)