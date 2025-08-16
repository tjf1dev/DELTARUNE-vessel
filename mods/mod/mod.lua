function Mod:init()
    Game.chapter = 7
    print("Loaded " .. self.info.name .. "!")
end

function Mod:postInit()
    Game:setFlag("shadow_crystals", 6)
    print(Game.save_name)
    local susie = Game:getPartyMember("susie")
    susie:addStatBuff("magic", 21, 21)
    susie:addSpell("heal")
end
