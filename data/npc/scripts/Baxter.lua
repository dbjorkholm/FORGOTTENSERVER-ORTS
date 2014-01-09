local YELL = {
	"People of Thais, bring honour to your king by fighting in the orc war!",
	"The orcs are preparing for war!!!"
}
 
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

yell_delay = 20
frequency = 25
 
function onThink() 
	if ((os.time() - yell_delay) >= frequency) then
		yell_delay = os.time()
		doCreatureSay(getNpcCid(), YELL[math.random(#YELL)], 1)
	end
	npcHandler:onThink() 
end