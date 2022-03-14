local bertha = table.deepcopy(data.raw["item"]["artillery-turret"])
bertha.name = "big-artillery-turret"
bertha.icon = "__bigger-artillery__/graphics/artillery-turret.png"
bertha.stack_size = 1
bertha.place_result = "big-artillery-turret"



local recipe = table.deepcopy(data.raw["recipe"]["artillery-turret"])
recipe.enabled = false
recipe.name = "big-artillery-turret"
recipe.ingredients =
{
  {"steel-plate", 500},
  {"concrete", 250},
  {"iron-gear-wheel", 440},
  {"advanced-circuit", 120},
  {"processing-unit", 100},
  {"electric-engine-unit", 32},
  {"low-density-structure", 50}
}
recipe.result = "big-artillery-turret"



local tech = table.deepcopy(data.raw["technology"]["artillery"])
tech.name = "big-artillery"
tech.icon = "__bigger-artillery__/graphics/artillery.png"  
tech.effects =
    {
      {
        type = "unlock-recipe",
        recipe = "big-artillery-turret"
      }
    }
tech.prerequisites = {"artillery","advanced-electronics-2","low-density-structure","electric-engine"}
tech.unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30,
      count = 2000
    }



local gun = table.deepcopy(data.raw["gun"]["artillery-wagon-cannon"])
gun.name = "big-artillery-wagon-cannon"
gun.attack_parameters.projectile_creation_parameters= require("__bigger-artillery__/artillery-cannon-muzzle-flash-shifting")

data:extend{gun}


local entity = table.deepcopy(data.raw["artillery-turret"]["artillery-turret"])
entity.name = "big-artillery-turret"
entity.minable = {mining_time = 0.5, result = "big-artillery-turret"}
entity.max_health = 7500
entity.collision_box = {{-2.9, -2.9}, {2.9, 2.9}}
entity.selection_box = {{-3, -3}, {3, 3}}
entity.gun = "big-artillery-wagon-cannon"
entity.manual_range_modifier = 1
entity.map_color={0, 255, 0, 100}
entity.map_friendly_map_color={0, 255, 0, 100}





--Scale
entity.base_shift = util.by_pixel(-0, -44)

entity.base_picture.layers[1].shift = util.by_pixel(-0, 44)
entity.base_picture.layers[1].filename = "__base__/graphics/entity/artillery-turret/hr-artillery-turret-base.png"
entity.base_picture.layers[1].width = 207
entity.base_picture.layers[1].height = 199
entity.base_picture.layers[1].hr_version.shift = util.by_pixel(-0, 44)
entity.base_picture.layers[1].hr_version.scale = 1

entity.base_picture.layers[2].shift = util.by_pixel(36, 76)
entity.base_picture.layers[2].filename = "__base__/graphics/entity/artillery-turret/hr-artillery-turret-base-shadow.png"
entity.base_picture.layers[2].width = 277
entity.base_picture.layers[2].height = 149
entity.base_picture.layers[2].hr_version.shift = util.by_pixel(36, 76)
entity.base_picture.layers[2].hr_version.scale = 1

entity.cannon_barrel_pictures.layers[1].shift = util.by_pixel(0, -112)
entity.cannon_barrel_pictures.layers[1].filenames =
{
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-1.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-2.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-3.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-4.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-5.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-6.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-7.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-8.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-9.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-10.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-11.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-12.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-13.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-14.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-15.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-16.png"
}
entity.cannon_barrel_pictures.layers[1].width = 530
entity.cannon_barrel_pictures.layers[1].height = 384
entity.cannon_barrel_pictures.layers[1].hr_version.shift = util.by_pixel(0, -112)
entity.cannon_barrel_pictures.layers[1].hr_version.scale = 1

entity.cannon_barrel_pictures.layers[2].shift = util.by_pixel(-6+116, 16+92)
entity.cannon_barrel_pictures.layers[2].filenames =
{
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-1.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-2.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-3.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-4.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-5.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-6.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-7.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-8.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-9.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-10.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-11.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-12.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-13.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-14.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-15.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-barrel-shadow-16.png"
}
entity.cannon_barrel_pictures.layers[2].width = 906
entity.cannon_barrel_pictures.layers[2].height = 626
entity.cannon_barrel_pictures.layers[2].hr_version.shift = util.by_pixel(-7+116, 15+92)
entity.cannon_barrel_pictures.layers[2].hr_version.scale = 1

entity.cannon_base_pictures.layers[1].shift = util.by_pixel(0, -80)
entity.cannon_base_pictures.layers[1].filenames =
{
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-1.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-2.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-3.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-4.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-5.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-6.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-7.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-8.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-9.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-10.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-11.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-12.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-13.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-14.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-15.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-16.png"
}
entity.cannon_base_pictures.layers[1].width = 358
entity.cannon_base_pictures.layers[1].height = 270
entity.cannon_base_pictures.layers[1].hr_version.shift = util.by_pixel(0, -81)
entity.cannon_base_pictures.layers[1].hr_version.scale = 1

entity.cannon_base_pictures.layers[2].shift = util.by_pixel(108+116, -2+92)
entity.cannon_base_pictures.layers[2].filenames =
{
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-1.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-2.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-3.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-4.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-5.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-6.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-7.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-8.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-9.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-10.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-11.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-12.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-13.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-14.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-15.png",
  "__base__/graphics/entity/artillery-wagon/hr-artillery-wagon-cannon-base-shadow-16.png"
}
entity.cannon_base_pictures.layers[2].width = 476
entity.cannon_base_pictures.layers[2].height = 340
entity.cannon_base_pictures.layers[2].hr_version.shift = util.by_pixel(109+116, -2+92)
entity.cannon_base_pictures.layers[2].hr_version.scale = 1

entity.cannon_barrel_recoil_shiftings_load_correction_matrix =	
{	
  { 0,    0.5,   0 },	
  {-0.5,    0,   0 },	
  { 0,       0,   0.5 }	
}

entity.water_reflection.pictures.shift = util.by_pixel(0, 150)
entity.water_reflection.pictures.scale = 10
--
  
data:extend{bertha,recipe,tech,entity}

local guisetting={
  type = "custom-input",
  name = "close-bb-menu",
  key_sequence = "E",
  alternative_key_sequence = "ESCAPE"
}

data:extend{guisetting}
