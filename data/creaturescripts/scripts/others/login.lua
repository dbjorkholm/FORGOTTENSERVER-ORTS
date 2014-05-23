function onLogin(cid)
	local player = Player(cid)

	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	player:registerEvent("PlayerDeath")
	player:registerEvent("bigfootBurdenQuestVesperoth")
	player:registerEvent("bigfootBurdenQuestWarzone")
	player:registerEvent("bigfootBurdenQuestWeeper")
	player:registerEvent("bigfootBurdenQuestWiggler")
	player:registerEvent("bossSummoning")
	player:registerEvent("theNewFrontierQuestShardOfCorruption")
	player:registerEvent("inServiceOfYalaharQuestsDiseased")
	player:registerEvent("inServiceOfYalaharQuestsMorik")
	player:registerEvent("inServiceOfYalaharQuestsQuara")
	player:registerEvent("inquisitionQuestBosses")
	player:registerEvent("inquisitionQuestUngreez")
	player:registerEvent("killingInTheNameOfQuestKills")
	player:registerEvent("masterVoiceQuest")
	player:registerEvent("elementalspheresquestOverlords")
	player:registerEvent("SvargrondArenaKill")
	player:registerEvent("AdvanceSave")
	player:registerEvent("StorageConversion")
	return true
end
