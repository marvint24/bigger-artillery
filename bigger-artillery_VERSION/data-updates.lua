local rotationspeed = settings.startup["bigger-artillery-mod-rotation-speed-setting"].value
local shootingspeed = settings.startup["bigger-artillery-mod-shooting-speed-setting"].value
local power = settings.startup["bigger-artillery-mod-power-consumption"].value

local disablecolor = settings.startup["bigger-artillery-mod-disable-range-color"].value

data.raw["artillery-turret"]["big-artillery-turret"].ammo_stack_limit = settings.startup["bigger-artillery-mod-ammo-stack"].value
data.raw["artillery-turret"]["man-big-artillery-turret"].ammo_stack_limit = settings.startup["bigger-artillery-mod-ammo-stack"].value

data.raw["artillery-turret"]["big-artillery-turret"].inventory_size = settings.startup["bigger-artillery-mod-inventory-stack"].value
data.raw["artillery-turret"]["man-big-artillery-turret"].inventory_size = settings.startup["bigger-artillery-mod-inventory-stack"].value

data.raw["electric-energy-interface"]["big-artillery-power"].energy_usage=tostring(power).."kW"
data.raw["electric-energy-interface"]["big-artillery-power"].energy_source.buffer_capacity=tostring(17*power*10).."J"

data.raw["gun"]["big-artillery-wagon-cannon"].attack_parameters.range = settings.startup["bigger-artillery-mod-range-setting"].value

data.raw["gun"]["big-artillery-wagon-cannon"].attack_parameters.cooldown = data.raw["gun"]["big-artillery-wagon-cannon"].attack_parameters.cooldown/(shootingspeed/100)

data.raw["artillery-turret"]["big-artillery-turret"].turn_after_shooting_cooldown = data.raw["artillery-turret"]["big-artillery-turret"].turn_after_shooting_cooldown/(shootingspeed/100)
data.raw["artillery-turret"]["man-big-artillery-turret"].turn_after_shooting_cooldown = data.raw["artillery-turret"]["man-big-artillery-turret"].turn_after_shooting_cooldown/(shootingspeed/100)

data.raw["artillery-turret"]["big-artillery-turret"].turret_rotation_speed = data.raw["artillery-turret"]["big-artillery-turret"].turret_rotation_speed*(rotationspeed/100)
data.raw["artillery-turret"]["man-big-artillery-turret"].turret_rotation_speed = data.raw["artillery-turret"]["man-big-artillery-turret"].turret_rotation_speed*(rotationspeed/100)

if disablecolor == true then
    data.raw["utility-constants"].default.chart.artillery_range_color={0,0,0,0}
end



