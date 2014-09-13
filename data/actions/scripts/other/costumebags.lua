local config = {
	[7737] = {'orc warrior', 'pirate cutthroat', 'dworc voodoomaster', 'dwarf guard', 'minotaur mage'}, -- common
	[7739] = {'serpent spawn', 'demon', 'juggernaut', 'behemoth', 'ashmunrah'}, -- uncommon
	[9076] = {'quara hydromancer', 'diabolical imp', 'banshee', 'frost giant', 'lich'} -- deluxe
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local monsterNames = config[item.itemid]
	if not monsterNames then
		return true
	end

	doSetMonsterOutfit(cid, monsterNames[math.random(#monsterNames)], 5 * 60 * 60 * 1000)
	local useItem = Item(item.uid)
	useItem:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	useItem:remove()
	return true
end
