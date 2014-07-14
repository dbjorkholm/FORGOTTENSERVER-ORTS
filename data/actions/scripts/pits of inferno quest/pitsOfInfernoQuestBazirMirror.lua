local config = {
    [39511] = {
        fromPosition = Position(32739, 32392, 14), 
        toPosition = Position(32739, 32391, 14)
    },
    [39512] = {
        teleportPlayer = true, 
        fromPosition = Position(32739, 32391, 14), 
        toPosition = Position(32739, 32392, 14)
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local targetActionId = config[item.actionid]
    if not targetActionId then
        return true
    end

    if targetActionId.teleportPlayer then
        local player = Player(cid)
        player:teleportTo(Position(32717, 32388, 13))
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end

    local tapestry = Tile(targetActionId.fromPosition):getItemById(6434)
    if tapestry then
        tapestry:moveTo(targetActionId.toPosition)
    end
    return true
end
