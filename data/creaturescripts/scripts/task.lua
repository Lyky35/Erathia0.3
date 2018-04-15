function onKill(player, target, lastHit)
    if not (task:onTask(player) > 0) then
        return false
    end
 
    if not player:isPlayer() then
        return false
    end
 
    task:onKill(player, target)
    return true 
end