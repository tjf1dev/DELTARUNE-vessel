local Aiming, super = Class(Wave)

function Aiming:onStart()
    self.tp = 7.5
    local last_side
    self.timer:every(3 / 4, function()
        local offset = 40
        local arena = Game.battle.arena

        local side = math.floor(Utils.random(1, 4))
        if side == last_side then
            print("regenerating side")
            side = math.floor(Utils.random(1, 4))
        end
        last_side = side
        print("side: " .. side)
        local x, y

        if side == 1 then
            x = arena.left - offset
            y = Utils.random(arena.top, arena.bottom)
        elseif side == 2 then
            x = arena.right + offset
            y = Utils.random(arena.top, arena.bottom)
        elseif side == 3 then
            x = Utils.random(arena.left, arena.right)
            y = arena.top - offset
        elseif side == 4 then
            x = Utils.random(arena.left, arena.right)
            y = arena.bottom + offset
        end

        -- Capture soul position at spawn time
        local soul_x = Game.battle.soul.x
        local soul_y = Game.battle.soul.y

        -- Spawn stationary sword bullet
        local angle = Utils.angle(x, y, soul_x, soul_y)
        local bullet = self:spawnBullet("sword", x, y, angle)
        self.timer:every(1 / 15, function()
            -- Cancel timer if the bullet is removed
            if bullet:isRemoved() then
                return false
            end

            -- Spawn a new afterimage with 0.4 starting alpha
            local after_image = AfterImage(bullet.sprite, 0.4)
            bullet:addChild(after_image)
        end)
        bullet.rotation = angle + math.rad(90)

        -- After 1 second, launch bullet toward the saved soul position
        self.timer:after(3 / 4, function()
            bullet.physics.speed = 28
        end)
    end)
end

function Aiming:update()
    super.update(self)
end

function Aiming:onEnd()
    local attackers = self:getAttackers()
    for _, attacker in ipairs(attackers) do
    end
end

return Aiming
