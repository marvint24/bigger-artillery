local bertha = table.deepcopy(data.raw["item"]["artillery-turret"])
bertha.name = "big-artillery-turret"
bertha.icon = "__bigger-artillery__/graphics/artillery-turret.png"
bertha.stack_size = 1
bertha.place_result = "big-artillery-turret"

data:extend{bertha}

local recipe = table.deepcopy(data.raw["recipe"]["artillery-turret"])
recipe.enabled = false
recipe.name = "big-artillery-turret"
recipe.ingredients ={
  {
    name ="steel-plate", 
    amount=500,
    type = "item"
  },
  {
    name = "concrete", 
    amount = 250,
    type = "item"
  },
  {
    name = "iron-gear-wheel", 
    amount = 440,
    type = "item"
  },
  {
    name = "advanced-circuit", 
    amount = 120,
    type = "item"
  },
  {
    name = "processing-unit", 
    amount = 100,
    type = "item"
  },
  {
    name = "electric-engine-unit", 
    amount = 32,
    type = "item"
  },
  {
    name = "low-density-structure", 
    amount = 50,
    type = "item"
  }
}
recipe.results = {
  {
    amount = 1,
    name = "big-artillery-turret",
    type = "item"
  }
}

data:extend{recipe}


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
tech.prerequisites = {"artillery","utility-science-pack","low-density-structure","electric-engine"}
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

data:extend{tech}

local gun = table.deepcopy(data.raw["gun"]["artillery-wagon-cannon"])
gun.name = "big-artillery-wagon-cannon"
gun.attack_parameters.projectile_creation_parameters= require("__bigger-artillery__/artillery-cannon-muzzle-flash-shifting")

data:extend{gun}

local guisetting={
  type = "custom-input",
  name = "close-bb-menu",
  key_sequence = "E",
  alternative_key_sequence = "ESCAPE"
}

data:extend{guisetting}
