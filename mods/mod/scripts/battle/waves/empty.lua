local Empty, super = Class(Wave)

function Empty:onStart()
    self.time = 0
    -- self:setArenaSize(0,0)
    -- self.spawn_soul = false
    -- Game.battle:startCutscene("kris","kill")
end
function Empty:onEnd()
end
function Empty:update()
    -- Code here gets called every frame

    super.update(self)
end

return Empty
