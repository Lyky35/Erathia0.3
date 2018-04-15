function onKill(player, target, lastHit)
    if not (taskRat:ontaskRat(player) > 0) then
        return false
    end
 
    if not player:isPlayer() then
        return false
    end
 
    taskRat:onKill(player, target)
    return true 
end