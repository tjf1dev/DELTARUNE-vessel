local Circle, super = Class(Wave)
function Circle:init()
    super.init(self)
    self.time = 10
    self.arena_width = 284
    self.arena_height = 284

    self.speed = 5 / 6
    self.sword_speed = 8 / 6
    self.circle_rps = 110
end

function Circle:onStart()
    local kris = self:getAttackers()[1]
    if self.sword_speed ~= -1 then
        self.timer:script(function(wait)
            self.timer:everyInstant(self.sword_speed, function()
                local attackers = self:getAttackers()
                attackers[1]:alert()
                wait(3 - 24 / 30)
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
            circle.radius = circle.radius - 50 * DT                      -- Decrease radius by 50 per second
            circle.angle = circle.angle + math.rad(self.circle_rps * DT) -- Turn clockwise at 90 degrees per second

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
