local Basic, super = Class(Wave)
function Basic:init()
    super.init(self)
    self.arena_width = 250
end

function Basic:onStart()
    self.time = 10
    local attackers = self:getAttackers()

    for _, attacker in ipairs(attackers) do
        attacker:setSprite("battle/act")
    end
    self.timer:every(0.6, function()
        local x = SCREEN_WIDTH + 20
        local start_val = Game.battle.arena.top
        local end_val = Game.battle.arena.bottom
        local points = 7
        local skip_val = math.floor(Utils.random(1, points - 1))
        for i = 0, points - 1 do
            print("skip: " .. skip_val .. " current: " .. i)
            local val = start_val + i * (end_val - start_val) / (points - 1)
            if i ~= skip_val then
                self:spawnBullet("smallbullet", x, val, math.rad(180), 10)
            end
        end
    end)
end

function Basic:onEnd()
    local attackers = self:getAttackers()
    for _, attacker in ipairs(attackers) do
        attacker:setAnimation("battle/idle")
    end
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
