local spell, super = Class(Spell, "heal")

function spell:init()
    super.init(self)
    self.name = "Heal"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Heal\nAlly"
    -- Menu description
    self.description = "Incredible healing, creafted by trial and error."

    -- TP cost
    self.cost = 60

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = { "heal" }
end

function spell:onCast(user, target)
    target:heal(user.chara:getStat("magic") * 50)
end

return spell
