function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if item.itemid == 1945 then
		Game.createMonster('dwarf henchman', Position(32570, 31858, 14))
		Game.createMonster('dwarf henchman', Position(32573, 31861, 14))
		Game.createMonster('dwarf henchman', Position(32562, 31860, 14))
		Game.createMonster('dwarf henchman', Position(32564, 31856, 14))
		Game.createMonster('dwarf henchman', Position(32580, 31860, 14))
		Game.createMonster('dwarf henchman', Position(32574, 31850, 14))
		Game.createMonster('dwarf henchman', Position(32574, 31870, 14))
		Game.createMonster('dwarf henchman', Position(32576, 31856, 14))
		Game.createMonster('dwarf henchman', Position(32562, 31858, 14))
		Game.createMonster('dwarf henchman', Position(32584, 31868, 14))
		Game.createMonster('stone golem', Position(32570, 31861, 14))
		Game.createMonster('stone golem', Position(32579, 31868, 14))
		Game.createMonster('stone golem', Position(32569, 31852, 14))
		Game.createMonster('stone golem', Position(32584, 31866, 14))
		Game.createMonster('stone golem', Position(32572, 31851, 14))
		Game.createMonster('mechanical fighter', Position(32573, 31858, 14))
		Game.createMonster('mechanical fighter', Position(32570, 31868, 14))
		Game.createMonster('mechanical fighter', Position(32579, 31852, 14))
		Game.createMonster('mad technomancer', Position(32571, 31859, 14))
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
 	return true
end
