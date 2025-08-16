local Kris, super = Class(EnemyBattler)

function Kris:init()
    super.init(self)

    self.name = "Kris"
    self:setActor("krisb")
    self.cycle = 1
    self.turn = 0
    self.dead = false
    self.max_health = 7200
    self.health = 7200
    self.last_logged_turn = 0
    self.attack = 31
    self.defense = 0
    self.tired_percentage = -1
    self.exit_on_defeat = false
    self.money = 0
    self.spare_val = 0
    self.spare_points = 0
    self.waves = {
        -- "walls",
        -- "sword_throw",
        -- "movingarena",
        "circle"
    }

    self.dialogue = {}

    self.check = "AT 31 DF 25\nA human, not a cage."
    self.idea_state = 0
    self.text = {
        "* The air crackles with Kris's freedom.",
        "* With you in the dark.",
    }

    self:registerAct("Talk")
    self:registerAct("Slash", "Damage\nEnemy", { "vessel" }, 40)
    self:registerAct("Kill", "WHAT THE FUCK")
end

-- function Kris:update()
--     -- print(self.state)
--     if self.dead then
--         self.waves = { "empty" }
--     end
--     if self.dead then
--         if Game.battle.state == "DEFENDINGBEGIN" then
--             print("starting cutscene, cause: state")
--             -- self:defeat()
--             -- Game.battle:nextTurn()
--         end
--     end

--     super.update(self)
-- end
function Kris:update()
    self:updateWaves()
    super.update(self)
end

function Kris:updateWaves()
    local turns_per_cycle = 4
    local turn = Game.battle.turn_count

    -- Calculate current cycle based on turn count
    self.cycle = math.floor((turn - 1) / turns_per_cycle) + 1

    -- Normalize turn within the cycle (1 to 4)
    local cycle_turn = ((turn - 1) % turns_per_cycle) + 1

    if self.dead then
        self.waves = { "empty" }
        return
    end

    if self.cycle == 1 then
        if cycle_turn == 1 then
            self.waves = { "walls" }
        elseif cycle_turn == 2 then
            self.waves = { "sword_throw" }
        elseif cycle_turn == 3 then
            self.waves = { "circle" }
        elseif cycle_turn == 4 then
            self.waves = { "movingarena" }
        end
    elseif self.cycle == 2 then
        if cycle_turn == 1 then
            self.waves = { "walls" }
        elseif cycle_turn == 2 then
            self.waves = { "sword_throw" }
        elseif cycle_turn == 3 then
            self.waves = { "circle_phase_2" }
        elseif cycle_turn == 4 then
            self.waves = { "movingarena" }
        end
    elseif self.cycle == 3 then
        if cycle_turn == 1 then
            self.waves = { "walls" }
        elseif cycle_turn == 2 then
            self.waves = { "sword_throw" }
        elseif cycle_turn == 3 then
            self.waves = { "circle_phase_3" }
        elseif cycle_turn == 4 then
            self.waves = { "movingarena" }
        end
    elseif self.cycle == 4 then
        if cycle_turn == 1 then
            self.waves = { "walls" }
        elseif cycle_turn == 2 then
            self.waves = { "sword_throw" }
        elseif cycle_turn == 3 then
            self.waves = { "circle_phase_4" }
        elseif cycle_turn == 4 then
            self.waves = { "movingarena" }
        end
    end
    if Game.battle.turn_count ~= self.last_logged_turn then
        self.last_logged_turn = Game.battle.turn_count
        print(string.format(
            "[Kris] Cycle: %d, Turn in cycle: %d, Global turn: %d, Selected wave: %s",
            self.cycle, cycle_turn, turn, self.waves[1] or "nil"
        ))
    end
end

function Kris:onAct(battler, name)
    if name == "Talk" then
        return {
            "* You talked to Kris.",
            "* They don't seem much for conversation."
        }
    elseif name == "Slash" then
        Game.battle:startActCutscene("kris", "slash")
        return
    elseif name == "Kill" then
        Game.battle:startActCutscene("kris", "xslash")
        return
    elseif name == "Standard" then
        return "* But nobody came."
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Kris:onDefeat(battler)
    local b = Game.battle
    -- b.current_selecting = 0
    for _, enemy in ipairs(b.enemies) do
        enemy:setSprite("battle/defeat")
        enemy.comment = "(dead)"
    end
    -- for _,battler in ipairs(b.party) do
    --     battler:setSleeping(false)
    --     battler.defending = false
    --     battler.action = nil

    --     battler.chara:resetBuffs()

    --     if battler.chara:getHealth() <= 0 then
    --         battler:revive()
    --         battler.chara:setHealth(battler.chara:autoHealAmount())
    --     end

    --     battler:setAnimation("battle/victory")

    --     local box = b.battle_ui.action_boxes[b:getPartyIndex(battler.chara.id)]
    --     box:resetHeadIcon()
    -- end

    if b.tension_bar then
        b.tension_bar:hide()
    end

    b.music:fade(0, 20 / 30)
    for _, battler in ipairs(b.party) do
        local index = b:getPartyIndex(battler.chara.id)
        if index then
            b.battler_targets[index] = { battler:getPosition() }
        end
    end
    -- b.encounter:onBattleEnd()
    -- if b.resume_world_music then
    -- Game.world.music:resume()
    -- end
    self.dead = true
end

function Kris:onTurnStart()
    self.turn = self.turn + 1
    print("turn " .. self.turn .. " started")
end

function Kris:onTurnEnd()
    print("turn ended")
end

return Kris
