-- ordered as in creaturescripts.xml
local events = {
	'TutorialCockroach',
	'ElementalSpheresOverlords',
	'BigfootBurdenVesperoth',
	'BigfootBurdenWarzone',
	'BigfootBurdenWeeper',
	'BigfootBurdenWiggler',
	'SvargrondArenaKill',
	'NewFrontierShardOfCorruption',
	'NewFrontierTirecz',
	'ServiceOfYalaharDiseasedTrio',
	'ServiceOfYalaharAzerus',
	'ServiceOfYalaharQuaraLeaders',
	'InquisitionBosses',
	'InquisitionUngreez',
	'KillingInTheNameOfKills',
	'MastersVoiceServants',
	'PharaoKillPortal',
	'PlayerDeath',
	'AdvanceSave'
}

function onLogin(cid)
	local player = Player(cid)

	local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Please choose your outfit.'
		player:sendTutorial(1)
	else
		if loginStr ~= '' then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	for i = 1, #events do
		player:registerEvent(events[i])
	end
	return true
end
