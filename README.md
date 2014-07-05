FORGOTTENSERVER-ORTS
====================
**Client Version: 10.41**

**Map Version: 10.35**

Try to make the perfect open real tibia server based on The Forgotten Server 1.0, by Mark Samman!
[Here](https://github.com/otland/forgottenserver) you can find the source code and also some tutorials on compiling.

You can download TFS 1.0 Windows Binaries from [here](http://nightlies.otland.net).

To login you can use OTClient by Edubart! Find it [here](https://github.com/edubart/otclient)!

To edit the map you can use the map editor from [here](https://github.com/hjnilsson/rme), [here](https://github.com/decltype/forgottenmapeditor) or from [here](http://otland.net/threads/10-35-remeres-map-editor.211040/)(This one is already compiled).

You can use [the forum](http://otland.net/threads/best-released-rlmap-10-41-based-1-0-new-roshamuul-new-quests-optimized-bug-fixing-open-source.204514/) to discuss and report bugs.

If you need support you can post your questions in the issues area or [here](http://otland.net/forums/support.16/). Dont forget to post in good, understandable English. Feel free to use a [translator](http://translate.google.com/) if you need help.

To contribute in code to this project, [create a pull request](http://otland.net/threads/contributing-to-someones-repository-create-a-pull-request-on-github.210627/).

To contribute with a map edit, [read this](https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/wiki/Contributing-to-the-map)

**If you want to contribute by sending pull request, here are some tips.
Try to use metatables in your script. Ex.**
```lua
function metaExample(cid)
	local player = Player(cid)
	if player ~= nil then
		player:addItem(2160, 5)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Here is some cash.")
	end
end
```
**How non meta looks like:**
```lua
function nonMetaExample(cid)
	if isPlayer(cid) then
		doPlayerAddItem(cid, 2160, 5)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Here is some cash.")
	end
end
```
**[LUA METATABLE LISTS](http://pastebin.com/UPKLCSsi)**

**NOTE:**
Since the link above dosen't have all the functions in it, I will link to a compat.lua file(can be found in your ot aswell, dir/data/compat.lua), use ctrl+f and enter the old function then press enter. 

[compat.lua](https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/blob/master/data/compat.lua)

Actual map (with marked missing areas):
![minimap_floor_7](https://cloud.githubusercontent.com/assets/6708725/3487554/257cb9be-0488-11e4-94e6-2464355761c8.png)


**Remember to have fun and say thanks!**
