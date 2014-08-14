local config = {
		[5908] = {
				-- Minotaurs
				[2830] = {value = 25000, newItem = 5878},
				[2871] = {value = 25000, newItem = 5878},
				[2866] = {value = 25000, newItem = 5878},
				[2876] = {value = 25000, newItem = 5878},
				[3090] = {value = 25000, newItem = 5878},

				-- Low Class Lizards
				[4259] = {value = 25000, newItem = 5876},
				[4262] = {value = 25000, newItem = 5876},
				[4256] = {value = 25000, newItem = 5876},

				-- High Class Lizards
				[11288] = {value = 25000, newItem = 5876},
				[11280] = {value = 25000, newItem = 5876},
				[11272] = {value = 25000, newItem = 5876},
				[11284] = {value = 25000, newItem = 5876},

				-- Dragons
				[3104] = {value = 25000, newItem = 5877},
				[2844] = {value = 25000, newItem = 5877},

				-- Dragon Lords
				[2881] = {value = 25000, newItem = 5948},

				-- Behemoths
				[2931] = { {value = 10000, newItem = 5930 }, {value = 35000, newItem = 5893 } },

				-- Bone Beasts
				[3031] = {value = 25000, newItem = 5925},

				-- The Mutated Pumpkin
				[8961] = { { value = 5000, newItem = 7487 }, { value = 10000, newItem = 7737 }, { value = 20000, 6492 }, { value = 30000, newItem = 8860 }, { value = 45000, newItem = 2683 }, { value = 60000, newItem = 2096 }, { value = 90000, newItem = 9005, amount = 50 } },

				-- Marble
				[11343] = { {value = 10000, newItem = 11345, desc = "This shoddy work was made by |PLAYERNAME|." }, {value = 35000, newItem = 11345, desc = "This little figurine made by |PLAYERNAME| has some room for improvement." }, { value = 60000, newItem = 11346, desc = "This little figurine of Tibiasula was masterfully sculpted by |PLAYERNAME|." } },

				-- Ice Cube
				[7441] = {value = 25000, newItem = 7442},
				[7442] = {value = 25000, newItem = 7444},
				[7444] = {value = 25000, newItem = 7445},
				[7445] = {value = 25000, newItem = 7446},
		},
		[5942] = {
				-- Demon
				[2916] = {value = 25000, newItem = 5906},

				-- Vampires
				[2956] = {value = 25000, newItem = 5905},
				[9654] = {value = 25000, newItem = 5905, after = 9658},
				[8938] = {value = 25000, newItem = 5905},
				[21275] = {value = 25000, newItem= 5905}
		}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
		local player = Player(cid)
		local skin = config[item.itemid][itemEx.itemid]
		if not skin then
				player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
				return true
		end

		local random, effect, transform = math.random(1, 100000), CONST_ME_MAGIC_GREEN, true
		if type(skin.value) == 'table' then
				local added = false
				for _, _skin in ipairs(skin) do
						if random <= _skin.value then
								if itemEx.itemid == 11343 then
										effect = CONST_ME_ICEAREA
										local goblet = player:addItem(_skin.newItem, _skin.amount or 1)
										goblet:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, skin.desc)
										added = true
								elseif isInArray({7441, 7442, 7444, 7445}, itemEx.itemid) then
										player:addItem(_skin.newItem, _skin.amount or 1)
										effect = CONST_ME_HITAREA
										added = true
								else
										player:addItem(_skin.newItem, _skin.amount or 1)
										added = true
								end
								break
						end
				end

				if not added and itemEx.itemid == 8961 then
						effect = CONST_ME_POFF
						transform = false
				end
		elseif random <= skin.value then
				if itemEx.itemid == 11343 then
						effect = CONST_ME_ICEAREA
						local goblet = player:addItem(skin.newItem, skin.amount or 1)
						goblet:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, skin.desc)
				elseif isInArray({7441, 7442, 7444, 7445}, itemEx.itemid) then
						player:addItem(skin.newItem, skin.amount or 1)
						effect = CONST_ME_HITAREA
				else
						player:addItem(skin.newItem, skin.amount or 1)
				end
		else
				if isInArray({7441, 7442, 7444, 7445}, itemEx.itemid) then
						player:say('The attempt of sculpting failed miserably.', TALKTYPE_MONSTER_SAY)
						effect = CONST_ME_HITAREA
				else
						effect = CONST_ME_POFF
				end
		end

		toPosition:sendMagicEffect(effect)
		if transform then
				Item(itemEx.uid):transform(skin.after or itemEx.itemid + 1)
		end

		return true
end
