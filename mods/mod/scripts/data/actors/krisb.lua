local actor, super = Class(Actor, "krisb")

function actor:init()
    super.init(self)
    -- Display name (optional)
    self.name = "Kris"

    -- Width and height for this actor, used to determine its center
    self.width = 19
    self.height = 37
    self.flip = "left"
    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = { 0, 25, 19, 14 }

    -- A table that defines where the Soul should be placed on this actor if they are a player.
    -- First value is x, second value is y.
    self.soul_offset = { 10, 24 }

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = { 0, 1, 1 }

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/kris/dark"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "battle/idle"

    -- Sound to play when this actor speaks (optional)
    self.voice = nil
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = nil
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = nil

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false
    self.animations = {
        -- Battle animations
        ["battle/idle"]         = { "battle/idle", 0.2, true },
        ["battle/regular"]      = { "battle/idle", 0.2, true },

        ["battle/attack"]       = { "battle/attack", 1 / 15, false },
        ["battle/act"]          = { "battle/act", 1 / 15, false },
        ["battle/spell"]        = { "battle/act", 1 / 15, false },
        ["battle/item"]         = { "battle/item", 1 / 12, false, next = "battle/idle" },
        ["battle/spare"]        = { "battle/act", 1 / 15, false, next = "battle/idle" },

        ["battle/attack_ready"] = { "battle/attackready", 0.2, true },
        ["battle/act_ready"]    = { "battle/actready", 0.2, true },
        ["battle/spell_ready"]  = { "battle/actready", 0.2, true },
        ["battle/item_ready"]   = { "battle/itemready", 0.2, true },
        ["battle/defend_ready"] = { "battle/defend", 1 / 15, false },

        ["battle/act_end"]      = { "battle/actend", 1 / 15, false, next = "battle/idle" },

        ["battle/hurt"]         = { "battle/hurt", 1 / 15, false, temp = true, duration = 0.5 },
        ["battle/defeat"]       = { "battle/defeat", 1 / 15, false },

        ["battle/transition"]   = { "sword_jump_down", 0.2, true },
        ["battle/intro"]        = { "battle/attack", 1 / 15, true },
        ["battle/victory"]      = { "battle/victory", 1 / 10, false },
    }
    self.offsets = {
        ["battle/idle"] = { -5, -1 },

        ["battle/attack"] = { -8, -6 },
        ["battle/attackready"] = { -8, -6 },
        ["battle/act"] = { -6, -6 },
        ["battle/actend"] = { -6, -6 },
        ["battle/actready"] = { -6, -6 },
        ["battle/item"] = { -6, -6 },
        ["battle/itemready"] = { -6, -6 },
        ["battle/defend"] = { -5, -3 },

        ["battle/defeat"] = { -8, -5 },
        ["battle/hurt"] = { -5, -6 },

        ["battle/intro"] = { -8, -9 },
        ["battle/victory"] = { -3, 0 },
    }
end

return actor
