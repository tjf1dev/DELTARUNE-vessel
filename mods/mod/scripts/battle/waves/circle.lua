local Circle, super = Class(Wave)
function Circle:init()
    super.init(self)
    self.time = 10
    self.arena_width = 284
    self.arena_height = 284
    self.phase = 1

    -- default values
    self.speed = 2
    self.sword_speed = -1

    if self.phase == 1 then
        self.speed = 1.5
    elseif self.phase == 2 then
        self.speed = 7 / 8
    elseif self.phase == 3 then
        self.speed = 4 / 6
        self.sword_speed = 3
    elseif self.phase == 4 then
        self.speed = 5 / 6
        self.sword_speed = 1.5
    end
end

function Circle:onStart()
    if self.sword_speed ~= -1 then
        self.timer:everyInstant(self.sword_speed, function()
            local attackers = self:getAttackers()

            -- Loop through all attackers
            for _, attacker in ipairs(attackers) do
                -- attacker.setAnimation("battle/attack_ready")
                -- Get the attacker's center position
                local x, y = attacker:getRelativePos(attacker.width / 2, attacker.height / 2)
                -- Get the angle between the bullet position and the soul's position
                local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

                -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
                local bullet = self:spawnBullet("sword", x, y, angle, 28)
                bullet.rotation = angle + math.rad(90)
            end
        end)
    end

    self.timer:everyInstant(self.speed, function()
        local x, y = Game.battle.arena:getCenter()
        local soul_x = Game.battle.soul.x
        local soul_y = Game.battle.soul.y

        local radius = 120
        local angle = Utils.random(0, 2 * math.pi)

        local circle = CircleController(soul_x, soul_y, radius, angle)
        self:addChild(circle)

        for i = 1, 6 do
            local bullet = self:spawnBulletTo(circle, "bullets/smallbullet", 640, 640)
            local angle = Utils.angle(bullet.x, bullet.y, Game.battle.soul.x, Game.battle.soul.y)
            bullet.rotation = angle
            bullet.remove_offscreen = false
        end

        self.timer:doWhile(function() return not circle:isRemoved() end, function()
            circle.radius = circle.radius - 50 * DT         -- Decrease radius by 50 per second
            circle.angle = circle.angle + math.rad(90 * DT) -- Turn clockwise at 90 degrees per second

            if circle.radius <= 0 then
                circle:remove()
            end
        end)
    end)
end

function Circle:update()
    super.update(self)
end

return Circle
