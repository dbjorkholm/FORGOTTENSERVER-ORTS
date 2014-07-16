### What is FORGOTTENSERVER-ORTS
We are trying to create the perfect open real tibia server based on [The Forgotten Server 1.0](https://github.com/otland/forgottenserver) by [Mark Samman](https://github.com/marksamman).

For more information about TFS 1.0 (including compiling guides) visit the link above.

You can download TFS 1.0 Windows binaries from http://nightlies.otland.net.

To login you can use [Otclient](https://github.com/edubart/otclient) by [edubart](https://github.com/edubart).

- Client Version: **10.41**
- Map Version: **10.35**
- The map is available as a rar archive in data/world/ which you have to unpack before running the server.

To edit the map you can use [Remere's Map Editor (Github)](https://github.com/hjnilsson/rme), [Remere's Map Editor 10.35 (Otland, compiled)](http://otland.net/threads/10-35-remeres-map-editor.211040/) or [Forgotten Map Editor](https://github.com/decltype/forgottenmapeditor).
You can use our [forum thread](http://otland.net/threads/best-released-rlmap-10-41-based-1-0-new-roshamuul-new-quests-optimized-bug-fixing-open-source.204514/) at Otland to discuss and report bugs.

If you need support you can post your questions in the issues area or use [Otland's support board](http://otland.net/forums/support.16/). Do not forget to post in good, understandable English and include all the information needed to solve the problem.

### Script Contribution
In order to contribute scripts to this project [create a pull request](http://otland.net/threads/contributing-to-someones-repository-create-a-pull-request-on-github.210627/).

**Important:**
- Scripts should follow this [lua style guide](https://github.com/Olivine-Labs/lua-style-guide) and be as efficient as possible.
- Use tabs as indentation.
- Use new metatable function whenever possible or you might have to revise your pull request.

**Example script (using metatables):**
```lua
local player = Player(cid)
if not player then
	return true
end

player:addItem(2160, 5)
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Here is some cash.')
```
**Example script (not using metatables):**
```lua
if not isPlayer(cid) then
	return true
end

doPlayerAddItem(cid, 2160, 5)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Here is some cash.')
```

**Scripting related links:**
- [List of metatable functions](http://pastebin.com/nws8xHmK)
- [compat.lua](https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/blob/master/data/compat.lua) (which contains additional functions)

### Map Contributions
In order to contribute map updates read this [article](https://github.com/PrinterLUA/FORGOTTENSERVER-ORTS/wiki/Contributing-to-the-map) first.

Current map (missing areas are marked):
![minimap_floor](https://cloud.githubusercontent.com/assets/6708725/3603499/a3069e62-0d17-11e4-8ed5-8442f892dbfa.png)


**Remember to have fun and say thanks!**
