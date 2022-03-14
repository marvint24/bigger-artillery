local powerinterface = table.deepcopy(data.raw["electric-energy-interface"]["electric-energy-interface"])
powerinterface.name="big-artillery-power"
powerinterface.energy_production="0KW"
powerinterface.energy_usage="10000KW"
powerinterface.energy_source = {
  type = "electric",
  usage_priority = "secondary-input",
  buffer_capacity = "1700000J",
  output_flow_limit = "0kW"
}
powerinterface.collision_box = nil
powerinterface.selection_priority=80
powerinterface.selection_box = {{-1.5, -0.5}, {1.5, 2}}
powerinterface.minable=nil
powerinterface.icons={{icon="__bigger-artillery__/graphics/artillery-turret.png"}}
powerinterface.picture=nil


data:extend{powerinterface}