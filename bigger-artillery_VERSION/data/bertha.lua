local bertha = table.deepcopy(data.raw["item"]["artillery-turret"])
bertha.name = "big-artillery-turret"
bertha.icon = "__bigger-artillery__/graphics/artillery-turret.png"
bertha.stack_size = 1
bertha.place_result = "big-artillery-turret"

data:extend { bertha }

local recipe = table.deepcopy(data.raw["recipe"]["artillery-turret"])
recipe.enabled = false
recipe.name = "big-artillery-turret"
recipe.results = {
  {
    amount = 1,
    name = "big-artillery-turret",
    type = "item"
  }
}

recipe.ingredients = {
  {
    amount = 600,
    name = "steel-plate",
    type = "item"
  },
  {
    amount = 600,
    name = "concrete",
    type = "item"
  },
  {
    amount = 400,
    name = "iron-gear-wheel",
    type = "item"
  },
  {
    amount = 200,
    name = "advanced-circuit",
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
  },
  {
    name = "artillery-turret",
    amount = 3,
    type = "item"
  }
}

if mods["space-age"] then
  recipe.ingredients = {
    {
      amount = 400,
      name = "iron-gear-wheel",
      type = "item"
    },
    {
      amount = 100,
      name = "processing-unit",
      type = "item"
    },
    {
      amount = 600,
      name = "tungsten-plate",
      type = "item"
    },
    {
      amount = 600,
      name = "refined-concrete",
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
    },
    {
      name = "artillery-turret",
      amount = 3,
      type = "item"
    }
  }
end

data:extend { recipe }

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
tech.prerequisites = { "artillery" }

tech.unit = {
  ingredients = {
    { "automation-science-pack", 1 },
    { "logistic-science-pack",   1 },
    { "chemical-science-pack",   1 },
    { "military-science-pack",   1 },
    { "utility-science-pack",    1 }
  },
  time = 30,
  count = 4000
}

if mods["space-age"] then
  tech.unit = {
    ingredients = {
      { "automation-science-pack",  1 },
      { "logistic-science-pack",    1 },
      { "military-science-pack",    1 },
      { "chemical-science-pack",    1 },
      { "utility-science-pack",     1 },
      { "space-science-pack",       1 },
      { "metallurgic-science-pack", 1 }
    },
    time = 30,
    count = 3000
  }
end

data:extend { tech }

local gun = table.deepcopy(data.raw["gun"]["artillery-wagon-cannon"])
gun.name = "big-artillery-wagon-cannon"

--Scale muzzle-flash-shifting
for k, v in pairs(gun.attack_parameters.projectile_creation_parameters) do
  v[2][1] = v[2][1] * 2.1
  v[2][2] = v[2][2] * 2.1
end

data:extend { gun }

local guisetting = {
  type = "custom-input",
  name = "close-bb-menu",
  key_sequence = "E",
  alternative_key_sequence = "ESCAPE"
}

data:extend { guisetting }
