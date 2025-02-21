local ui = {}

local inventory_size = settings.startup["bigger-artillery-mod-inventory-stack"].value

function ui.testobj(obj)
    if obj == nil then
        return nil
    end
end

function ui.change_bertha(ev)
    if ev.entity ~= nil then
        if ev.entity.name == "big-artillery-turret" or ev.entity.name == "man-big-artillery-turret" then
            selectedbb = ev.entity
            local ply = game.players[ev.player_index]
            if ply.gui.top["bbwindow"] ~= nil then
                ply.gui.top["bbwindow"].destroy()
            end
            local win = ply.gui.top.add { type = "frame", name = "bbwindow", direction = "vertical", caption = { "custom-name.bb-menu-text" } }
            local row1 = win.add { type = "flow", name = "bbflow", direction = "horizontal" }
            row1.add { type = "button", name = "bbmanual", caption = { "custom-name.bb-menu-manual" } }
            row1.add { type = "button", name = "bbauto", caption = { "custom-name.bb-menu-auto" } }
            local row2 = win.add { type = "flow", name = "bbflow2", direction = "horizontal" }
            row2.add { type = "button", name = "bbclose", caption = { "custom-name.bb-menu-close" } }
        end
    end
end

function ui.closegui(ev)
    local ply = game.players[ev.player_index]
    if ply.gui.top["bbwindow"] ~= nil then
        ply.gui.top["bbwindow"].destroy()
    end
end

function ui.moveInventory(inv1, inv2)
    local count = 1
    while count < inventory_size + 1 do
        inv2[count].set_stack(inv1[count])
        count = count + 1
    end
end

function ui.selectfunc(ev)
    if ev.element.name == "bbclose" then
        game.players[ev.player_index].gui.top["bbwindow"].destroy()
    elseif ev.element.name == "bbmanual" then
        if pcall(function() ui.testobj(selectedbb.name) end) then
            local rotation = selectedbb.relative_turret_orientation
            local ent = selectedbb.surface.create_entity { name = "man-big-artillery-turret", position = { x = selectedbb.position.x, y = selectedbb.position.y }, force = selectedbb.force }
            script.raise_event(defines.events.script_raised_built, { created_entity = ent, entity = ent })
            ui.moveInventory(selectedbb.get_inventory(1), ent.get_inventory(1))
            script.raise_event(defines.events.script_raised_destroy, { entity = selectedbb })
            ent.relative_turret_orientation = rotation
        end
        game.players[ev.player_index].gui.top["bbwindow"].destroy()
    elseif ev.element.name == "bbauto" then
        if pcall(function() ui.testobj(selectedbb.name) end) then
            local rotation = selectedbb.relative_turret_orientation
            local ent = selectedbb.surface.create_entity { name = "big-artillery-turret", position = { x = selectedbb.position.x, y = selectedbb.position.y }, force = selectedbb.force }
            script.raise_event(defines.events.script_raised_built, { created_entity = ent, entity = ent })
            ui.moveInventory(selectedbb.get_inventory(1), ent.get_inventory(1))
            script.raise_event(defines.events.script_raised_destroy, { entity = selectedbb })
            ent.relative_turret_orientation = rotation
        end
        game.players[ev.player_index].gui.top["bbwindow"].destroy()
    end
end

return ui
