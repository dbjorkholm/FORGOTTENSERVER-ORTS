local levers = {
	{uniqueId = 50108, actionId = 50122, wagonPos = Position(32696, 31495, 11)}
	{uniqueId = 50109, actionId = 50123, wagonPos = Position(32694, 31495, 11)}
	{uniqueId = 50110, actionId = 50124, wagonPos = Position(32692, 31495, 11)}
	{uniqueId = 50111, actionId = 50125, wagonPos = Position(32690, 31495, 11)}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	for i = 1, #config do
		local table = config[i]
		if item.uid == table.uniqueId and Tile(Position(32699, 31494, 11)):getItemById(8641):getActionId(50121) then
			local wagon = Game.createItem(7132, table.wagonPos)
			wagon:setActionId(table.actionId)
			Tile(Position(32699, 31494, 11)):getItemById(8641):transform(8642)
		end
	end
	Item(item.uid):transform(item.itemid == 10044 and 10045 or 10044)
	return true
end
