local character, super = Class(PartyMember, "vessel")

function character:init()
    super.init(self)
    -- Display name
    name = Game.save_name
    if Game.save_name == "PLAYER" then
        name = "You"
    end
    self.name = name

    self:setActor("vessel")
    self.level = 7
    self.title = "Vessel\nContains it's\nvery own soul."

    self.soul_priority = 1
    self.soul_color = { 1, 0, 0 }
    self.has_act = true
    self.has_spells = false
    self.has_xact = false
    -- self.xact_name = "X-Action"

    self.health = 400
    self.stats = {
        health = 400,
        attack = 16,
        defense = 13,
        magic = 14
    }
    self.max_stats = {
        health = 410
    }

    self.weapon_icon = "ui/menu/equip/sword"

    self:setWeapon("shadow_knife")
    self:setArmor(1, "dark_armor")


    -- Character color (for action box outline and hp bar)
    self.color = { 1, 1, 1 }
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = { 1, 0, 0 }
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = { 1, 1, 1 }
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = { 0.4, 0.4, 0.4 }
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = { 1, 0, 0 }

    -- Head icon in the equip / power menu
    self.menu_icon = "party/kris/head"
    -- Path to head icons used in battle
    self.head_icons = "party/vessel/icon"
    -- Name sprite
    self.name_sprite = "party/vessel/name"

    -- Effect shown above enemy after attacking it
    -- self.attack_sprite = "effects/attack/shot"
    -- Sound played when this character attacks
    -- self.attack_sound = "heartshot_dr_b"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = { 2, 1 }
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil
end

return character
