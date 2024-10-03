local entity = table.deepcopy(data.raw["artillery-turret"]["big-artillery-turret"])
entity.name = "man-big-artillery-turret"
entity.minable = {mining_time = 0.5, result = "big-artillery-turret"}
entity.map_color={0, 255, 255, 100}
entity.disable_automatic_firing=true
data:extend{entity}

local item = table.deepcopy(data.raw["item"]["big-artillery-turret"])
item.name = "man-big-artillery-turret"
item.place_result = "man-big-artillery-turret"
data:extend{item}
