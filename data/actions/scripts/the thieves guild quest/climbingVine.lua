local config = {
    [] = Position(32336, 31813, 6), -- to the room
    [] = Position(32337, 31815, 7) -- outside the room
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local useItem = config[item.actionid]
    if not useItem then
        return true
    end

    Player(cid):teleportTo(useItem)

    return true
end
