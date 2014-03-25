  function doPlayerWithdrawMoney(cid, amount)
   local balance = getPlayerBalance(cid)
   if(amount > balance or not doPlayerAddMoney(cid, amount)) then
     return false
   end

   doPlayerSetBalance(cid, balance - amount)
   return true
   end

   function doPlayerDepositMoney(cid, amount)
   if(not doPlayerRemoveMoney(cid, amount)) then
     return false
   end

   doPlayerSetBalance(cid, getPlayerBalance(cid) + amount)
   return true
   end
  
   function playerExists(name)
    local a = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = "' .. name .. '" LIMIT 1')
      if a then
       return true
      end
      return false
   end
  
   function doPlayerTransferMoneyTo(cid, target, amount)
     local balance = getPlayerBalance(cid)
     if(amount > balance) then
       return false
     end

     local tid = getPlayerByName(target)
     if(tid) then
       doPlayerSetBalance(tid, getPlayerBalance(tid) + amount)
     else
       if(playerExists(target) == false) then
         return false
       end

       db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = '" .. target .. "'")
     end

     doPlayerSetBalance(cid, getPlayerBalance(cid) - amount)
     return true
   end