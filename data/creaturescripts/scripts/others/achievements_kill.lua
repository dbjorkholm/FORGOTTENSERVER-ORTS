--onKill event for misc functions like achievements, etc.

function onKill(cid, target)

	--ACHIEVEMENTS //
	local achievements_list = --achievements to be added when killing a certain creature
	{
		--	Achievement Name		target = Monster Name		count = Required kills		share = Add achievement to all players in death list or only the first one (used for bosses)?
		--'share' option won't work on achievements with 'count'
		
		["Askarak Nemesis"] = {targets = {"Askarak Prince"}, count = 100},
		["Back from the Dead"] = {targets = {"Zanakeph"}, share = true},
		["Back into the Abyss"] = {targets = {"Thul"}, share = true},
		["Bibby's Bloodbath"] = {targets = {"Bibby Bloodbath"}, share = true},
		["Blood-Red Snapper"] = {targets = {"The Snapper"}, share = true},
		["Choking on Her Venom"] = {targets = {"The Old Widow"}, share = true},
		["Cocoon of Doom"] = {targets = {"Bloom of Doom"}, share = true},
		["Crawling Death"] = {targets = {"Fleshcrawler"}, share = true},
		["Death Song"] = {targets = {"Deepling Spellsinger"}, count = 300},
		["Deer Hunt"] = {targets = {"Enraged White Deer", "Desperate White Deer"}, count = 400},
	}
	if Player(cid) and Creature(target) then --killer: player, target: monster
		local player, creature = Player(cid), Creature(target)
		for aname, info in pairs(achievements_list) do
			for t = 1, #info.targets do
				if string.lower(creature:getName()) == string.lower(info.targets[t]) then
					local achievement = getAchievementInfoByName(aname)
					if not achievement then return true end --achievement not found
					if info.count then
						player:setStorageValue(achievement.actionStorage, math.max(0, player:getStorageValue(achievement.actionStorage)) + 1)
						if player:getStorageValue(achievement.actionStorage) >= info.count then 
							return player:addAchievement(aname)
						end
					end
					
					if info.share then
						for id, damage in pairs(creature:getDamageMap()) do
							if Player(id) then
								Player(id):addAchievement(aname)
							end
						end
					else
						player:addAchievement(aname)
					end
					return true
				end
			end
		end			
	end
		
	
	--///////
	return true
end
