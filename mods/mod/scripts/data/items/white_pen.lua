local item, super = Class(Item, "white_pen")

function item:init()
    super.init(self)

    -- Display name
    self.name = "White Pen"
    -- Name displayed when used in battle (optional)
    self.use_name = nil

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/axe"
    -- Whether this item is for the light world
    self.light = false
    self.can_equip = {
        susie = true
    }
    -- Battle description
    self.effect = ""
    self.bonuses = {
        attack = 16
    }
    -- Shop description
    self.shop = "W. Pen"
    -- Menu description
    self.description = "Crafted with hope"
    -- Light world check text
    -- self.check = "It's useless"

    -- Default shop price (sell price is halved)
    self.price = 0
    -- Whether the item can be sold
    self.can_sell = false
    self.reactions = {
        susie = "..."
    }
    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
end

return item
