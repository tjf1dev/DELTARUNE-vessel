local item, super = Class(Item, "dark_armor")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Dark Armor"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"
    -- Whether this item is for the light world
    self.light = false
    self.can_equip = {
        susie = true
    }
    -- Battle description
    self.effect = ""
    self.bonuses = {
        defense = 12,
        magic = 21,
    }
    -- Shop description
    self.shop = "DarkArmor"
    -- Menu description
    self.description = "Greatly increases magic and defense."
    -- Light world check text
    -- self.check = "It's useless"

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
end

return item
