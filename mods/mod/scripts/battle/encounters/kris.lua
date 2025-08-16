local Kris, super = Class(Encounter)

function Kris:init()
    super.init(self)

    self.text = "* Kris attacks."
    self.default_xactions = nil
    self.music = "mus_kris_fight"
    self.background = false
    self.no_end_message = true
    self:addEnemy("kris")
end

return Kris
