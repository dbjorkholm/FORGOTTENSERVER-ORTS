local text = '--Addon List--\n!addon "citizen\n!addon "hunter\n!addon "mage\n!addon "knight\n!addon "summoner\n!addon "warrior\n!addon "barbarian\n!addon "druid\n!addon "wizard\n!addon "oriental\n!addon "pirate\n!addon "assassin\n!addon "beggar\n!addon "beggar\n!addon "shaman\n!addon "norseman\n!addon "nightmare\n!addon "jester\n!addon "brotherhood\n!addon "warmaster\n--Addon List End--'

function onSay(cid, words, param)
        local cfg = {
                ["citizen"] = {
                        outfit = {
                                male = 128,
                                female = 136,
                                addon = 3,
                                storage = 10031
                        },
                        items = {
                                {5878,100}
                        }
                },
                ["hunter"] = {
                        outfit = {
                                male = 129,
                                female = 137,
                                addon = 3,
                                storage = 10032
                        },
                        items = {
                                {5876, 100},{5948, 100}
                        }
                },
                ["mage"] = {
                        outfit = {
                                male = 130,
                                female = 138,
                                addon = 3,
                                storage = 10033
                        },
                        items = {
                                {2160,1000}
                        }
                },
                ["knight"] = {
                        outfit = {
                                male = 131,
                                female = 139,
                                addon = 3,
                                storage = 10034
                        },
                        items = {
                                {5880,100},{5893, 100}
                        }
                },
                ["summoner"] = {
                        outfit = {
                                male = 133,
                                female = 141,
                                addon = 3,
                                storage = 10035
                        },
                        items = {
                                {2160,1000}
                        }
                },
                ["warrior"] = {
                        outfit = {
                                male = 134,
                                female = 142,
                                addon = 3,
                                storage = 10036
                        },
                        items = {
                                {5925, 100},{5899, 100},{5919, 1},{5880, 100}
                        }
                },
                ["barbarian"] = {
                        outfit = {
                                male = 147,
                                female = 143,
                                addon = 3,
                                storage = 10037
                        },
                        items = {
                                {5911, 50},{5910, 50},{5879, 100}
                        }
                },
                ["druid"] = {
                        outfit = {
                                male = 148,
                                female = 144,
                                addon = 3,
                                storage = 10038
                        },
                        items = {
                                {5896, 50},{5897, 50}
                        }
                },
                ["wizard"] = {
                        outfit = {
                                male = 149,
                                female = 145,
                                addon = 3,
                                storage = 10039
                        },
                        items = {
                                {2536, 1},{2492, 1},{2488, 1},{2123, 1},{5922, 50}
                        }
                },
                ["oriental"] = {
                        outfit = {
                                male = 150,
                                female = 146,
                                addon = 3,
                                storage = 10040
                        },
                        items = {
                                {5883, 100},{5895, 100},{5912, 100}
                        }
                },
                ["pirate"] = {
                        outfit = {
                                male = 151,
                                female = 155,
                                addon = 3,
                                storage = 10041
                        },
                        items = {
                                {6098, 100},{6126, 100},{6097, 100}
                        }
                },
                ["assassin"] = {
                        outfit = {
                                male = 152,
                                female = 156,
                                addon = 3,
                                storage = 10042
                        },
                        items = {
                                {5898, 30},{5882, 10},{5881, 30},{5895, 20},{5905, 10}
                        }
                },
                ["beggar"] = {
                        outfit = {
                                male = 153,
                                female = 157,
                                addon = 3,
                                storage = 10043
                        },
                        items = {
                                {5878, 50},{2743, 30},{5913, 20},{5894, 10}
                        }
                },
                ["shaman"] = {
                        outfit = {
                                male = 154,
                                female = 158,
                                addon = 3,
                                storage = 10044
                        },
                        items = {
                                {3955,5},{5810, 5},{3966, 5},{3967, 5}
                        }
                },
                ["norseman"] = {
                        outfit = {
                                male = 251,
                                female = 252,
                                addon = 3,
                                storage = 10045
                        },
                        items = {
                                {7290,15}
                        }
                },
                ["nightmare"] = {
                        outfit = {
                                male = 268,
                                female = 269,
                                addon = 3,
                                storage = 10046
                        },
                        items = {
                                {6500,200}
                        }
                },
                ["jester"] = {
                        outfit = {
                                male = 273,
                                female = 270,
                                addon = 3,
                                storage = 10047
                        },
                        items = {
                                {2160, 25}
                        }
                },
                ["brotherhood"] = {
                        outfit = {
                                male = 278,
                                female = 279,
                                addon = 3,
                                storage = 10048
                        },
                        items = {
                                {6500,200}
                        }
                }
        }
        local v, removeItems = cfg[param], 0, 0
              if(param == "") then
                Player(cid):sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Please type !addon "outfit')
                Player(cid):showTextDialog(5914, text)
        return false
        end
        if(v == nil) then
                Player(cid):sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "There is no such as outfit named "..param..", here is the list of available outfit.")
                Player(cid):showTextDialog(5914, text)
        return false
        end        
        if(Player(cid):getStorageValue(v.outfit.storage) < 1) then
                for i = 1, #v.items do
                        if(Player(cid):getItemCount(v.items[i][1]) >= v.items[i][2]) then
                                removeItems = removeItems+1
                        end
                end
                if(removeItems == #v.items) then
                        if(getPlayerSex(cid) == 1) then
                                doPlayerAddOutfit(cid, v.outfit.male, v.outfit.addon)
                        elseif(getPlayerSex(cid) == 0) then
                                doPlayerAddOutfit(cid, v.outfit.female, v.outfit.addon)
                        end
                        for i = 1, #v.items do
                                doPlayerRemoveItem(cid, v.items[i][1], v.items[i][2])
                        end
                        Player(cid):sendTextMessage(MESSAGE_INFO_DESCR, "Enjoy your new addons to your "..param.." outfit!")
						Player(getThingPos(cid)):sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
                        Player(cid):setStorageValue(v.outfit.storage, 1)
                else
                        for i = 1, #v.items do
                                Player(cid):sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You need " .. v.items[i][2] .. "x " .. ItemType(v.items[i][1]):getName() .. " for the whole "..param.." addon.")
                        end
                end
        else
                Player(cid):sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You have already obtained addons to your "..param..".")
        end
        return false
end
