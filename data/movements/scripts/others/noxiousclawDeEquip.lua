function onDeEquip(cid, item, slot)
                local player = Player(cid)

                Item(item.uid):transform(10315)
end