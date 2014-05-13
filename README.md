FORGOTTENSERVER-ORTS
====================
Client Version: 10.37
Try to make the perfect open real tibia server based on forgottenserver by Mark Samman!
Here you can find the sources and also some compile tutorials: https://github.com/otland/forgottenserver

You can download TFS 1.0 Windows Binaries from: http://nightlies.otland.net

To login you can use otclient by Edubart!
https://github.com/edubart/otclient

Also you can use the forum to discuss and report:
http://otland.net/threads/best-released-real-map-10-31-based-1-0.204514/

**If you want to edit the map, here some rules to report your status:**
- report your status here [Map Edit Status](https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/issues/447)
- post a Checkbox |- [X] Working now on map| which you can click when you want work on it
- check if other user already have a X in his controllbox
- if nobody have one, so you can check your box and start editing the map
- if you finish your map edit pull it and uncheck you box

**If you want to contribute by sending pull request, here is some tips.
Try to use metatables in your script. Ex.**
```
function metaExample(cid)
	local player = Player(cid)
	if player ~= nil then
		player:addItem(2160, 5)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Here is some cash.")
	end
end
```
**How non meta looks like:**
```
function nonMetaExample(cid)
	if isPlayer(cid) then
		doPlayerAddItem(cid, 2160, 5)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Here is some cash.")
	end
end
```
**LUA METATABLE LISTS:**

http://pastebin.com/UPKLCSsi

**NOTE:**
Due to that the link above dosen't have all the functions in it, I will link to a compat.lua file(can be found in your ot aswell, dir/data/compat.lua), use ctrl+f and enter the old function then press enter. 

https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/blob/master/data/compat.lua

Actual map (with marked missing areas):
![minimap_floor](https://cloud.githubusercontent.com/assets/6708725/2932230/7519de00-d7ad-11e3-8cad-fe610b7912f9.png)