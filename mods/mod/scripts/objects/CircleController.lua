local CircleController, super = Class(Object)

function CircleController:init(x, y, radius, angle)
    super.init(self, x, y)

    -- Radius of the circle, in pixels
    self.radius = radius or 25

    -- Angle of rotation for the circle, in radians
    self.angle = angle or 0
end

function CircleController:update()
    super.update(self)

    local spacing_angle = 2*math.pi / #self.children

    for i, child in ipairs(self.children) do
        child.x = self.radius * math.cos(self.angle + spacing_angle * i)
        child.y = self.radius * math.sin(self.angle + spacing_angle * i)
    end
end


return CircleController
