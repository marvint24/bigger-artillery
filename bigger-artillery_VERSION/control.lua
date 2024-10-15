local bmodule = require("control/bertha")
local ui = require("control/ui")

local eventFilter = {
    { filter = "name", name = "big-artillery-turret" },
    { filter = "name", name = "man-big-artillery-turret" }
}

local cloneFilter = {
    { filter = "name", name = "big-artillery-power" },
    { filter = "name", name = "big-artillery-turret" },
    { filter = "name", name = "man-big-artillery-turret" }
}

local guiFilter = {
    {}
}

if settings.startup["bigger-artillery-mod-enable-power-consumption"].value == false then
    script.on_init(bmodule.remove_allPowerInterfaces)
    script.on_configuration_changed(bmodule.remove_allPowerInterfaces)
else
    script.on_init(bmodule.config_changed)
    script.on_configuration_changed(bmodule.config_changed)

    --add
    script.on_event(defines.events.on_built_entity, bmodule.add_powerinterface, eventFilter)
    script.on_event(defines.events.on_robot_built_entity, bmodule.add_powerinterface, eventFilter)
    script.on_event(defines.events.script_raised_built, bmodule.add_powerinterface, eventFilter)
    script.on_event(defines.events.script_raised_revive, bmodule.revive_bertha, eventFilter)
    --remove
    script.on_event(defines.events.on_player_mined_entity, bmodule.remove_powerInterface, eventFilter)
    script.on_event(defines.events.on_robot_mined_entity, bmodule.remove_powerInterface, eventFilter)
    script.on_event(defines.events.on_entity_died, bmodule.remove_powerInterface, eventFilter)
    script.on_event(defines.events.script_raised_destroy, bmodule.remove_bertha, eventFilter)
    --clone
    script.on_event(defines.events.on_entity_cloned, bmodule.on_cloned, cloneFilter)

    --checkpower
    script.on_event(defines.events.on_tick, bmodule.check_power)
    script.on_nth_tick(210, bmodule.set_power)

    --ui
    script.on_event(defines.events.on_gui_opened, ui.change_bertha)
    script.on_event("close-bb-menu", ui.closegui)
    script.on_event(defines.events.on_gui_click, ui.selectfunc)
end

-- Tools
-- function tableLength(T)
--     local count = 0
--     for _ in pairs(T) do count = count + 1 end
--     return count
-- end

-- log()
-- game.print()
-- print(serpent.block(table))
-- print(serpent.dump(table))

-- function test(ev)
--     print("hiii")
-- end

-- function printTable(table)
--     for k,v in pairs(table) do
--         print(k,v)
--     end
-- end
