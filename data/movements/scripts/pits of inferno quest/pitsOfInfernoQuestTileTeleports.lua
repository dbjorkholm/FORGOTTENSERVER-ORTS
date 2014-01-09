--[[local teleports = {
	[2100] = {x = , y = , z = },
	[2101] = {x = , y = , z = },
	[2102] = {x = , y = , z = },
	[2103] = {x = , y = , z = },
	[2104] = {x = , y = , z = },
	[2105] = {x = , y = , z = },
	[2106] = {x = , y = , z = },
	[2107] = {x = , y = , z = },
	[2108] = {x = , y = , z = },
	[2109] = {x = , y = , z = }
}]]--


function onStepIn(cid, item, position, lastPosition)
	doTeleportThing(cid, teleports[item.uid])
	return true
end
