local entity = table.deepcopy(data.raw["artillery-turret"]["artillery-turret"])
entity.name = "big-artillery-turret"
entity.minable = { mining_time = 0.5, result = "big-artillery-turret" }
entity.max_health = 7500
entity.collision_box = { { -2.9, -2.9 }, { 2.9, 2.9 } }
entity.selection_box = { { -3, -3 }, { 3, 3 } }
entity.gun = "big-artillery-wagon-cannon"
entity.manual_range_modifier = 1
entity.map_color = { 0, 255, 0, 100 }
entity.map_friendly_map_color = { 0, 255, 0, 100 }

--Scale
function scaleByTwo(tbl)
  for k, v in pairs(tbl) do
    if k == "shift" then
      tbl[k][1] = v[1] * 2.5
      tbl[k][2] = v[2] * 2.5
    elseif type(v) == "table" then
      scaleByTwo(v)
    elseif k == "scale" then
      tbl[k] = v * 2
    end
  end
end

scaleByTwo(entity)

entity.cannon_barrel_pictures.layers[1].shift = { 0*2.4, -1.75*2.4 }
entity.cannon_barrel_pictures.layers[2].shift = { 2.421875*2.4, 0.015625*2.4 }

data:extend { entity }
