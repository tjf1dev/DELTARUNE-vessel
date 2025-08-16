return {
    ---@param cutscene BattleCutscene
    slash = function(cutscene, battler, enemy)
        -- first slash
        enemy:hurt(battler.chara:getStat("attack") * 5)
        cutscene:playSound("damage")
        cutscene:setAnimation(battler, "battle/attack")
        cutscene:wait(0.3)

        -- second slash
        enemy:hurt(battler.chara:getStat("attack") * 5)
        cutscene:playSound("damage")
        cutscene:setAnimation(battler, "battle/attack")
        cutscene:wait(0.3)
        -- third slash
        enemy:hurt(battler.chara:getStat("attack") * 5)
        cutscene:playSound("damage")
        cutscene:setAnimation(battler, "battle/attack")
        cutscene:wait(0.3)

        -- Return to idle afterwards
        cutscene:setAnimation(battler, "battle/idle")
    end,
    xslash = function(cutscene, battler, enemy)
        local old_health = enemy.health
        print(old_health .. ": 3 strikes per" .. old_health / 3)
        -- first slash
        for i = 1, 3 do
            enemy:hurt(old_health / 3)
            cutscene:playSound("damage")    
            cutscene:setAnimation(battler, "battle/attack")
            cutscene:wait(0.2)
        end
        cutscene:setAnimation(battler, "battle/idle")
    end,
    kill = function(cutscene, battler, enemy)
        local self = Game.battle
        -- self.current_selecting = 0

        if self.tension_bar then
            self.tension_bar:hide()
        end
        -- Game.battle.battle_ui:transitionOut()
        -- self:returnToWorld()

    end
}
