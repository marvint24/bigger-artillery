function testobj(obj)
    if obj==nil then
        return nil
    end
end

local filter={
    {filter="name",name="big-artillery-turret"},
    {filter="name",name="man-big-artillery-turret"}
}

ammo_stack_limit=settings.startup["bigger-artillery-mod-ammo-stack"].value
inventory_size=settings.startup["bigger-artillery-mod-inventory-stack"].value


function rm_bb(a)
    if settings.startup["bigger-artillery-mod-enable-power-consumption"].value==true then
        rm_powerinterface(a)
    end
    a.entity.destroy()
end


script.on_event(defines.events.script_raised_destroy,rm_bb,filter)




if settings.startup["bigger-artillery-mod-enable-power-consumption"].value==true then
    function add_powerinterface(a)
        e=a.created_entity
        enti=e.surface.create_entity{name = "big-artillery-power", position = {x= e.position.x, y = e.position.y+1},force = e.force}
        enti.destructible=false
        enti.operable=false
        enti.rotatable=false
        global.biggerartillerypowerinterfacetable[e.unit_number] = {e,enti,0}

    end

    function revive_bb(a)
        event={created_entity=a.entity}
        add_powerinterface(event)
    end

    function rm_powerinterface(a)
        un=a.entity.unit_number
        if global.biggerartillerypowerinterfacetable[un]~=nil then
            global.biggerartillerypowerinterfacetable[un][2].destroy()
            global.biggerartillerypowerinterfacetable[un]=nil
        end
    end

    function on_cloned(a)
        if a.destination.name=="big-artillery-power" then
            a.destination.destroy()
        elseif a.destination.name=="big-artillery-turret" or a.destination.name=="man-big-artillery-turret" then
            event={created_entity=a.destination}
            add_powerinterface(event)
        end
    end


    function check_power(a)
        powerinterfacetable=global.biggerartillerypowerinterfacetable
        if (powerinterfacetable ~= nil) then
            for _,enti in pairs(powerinterfacetable) do
                if enti[1].get_inventory(defines.inventory.turret_ammo).is_empty()==false then
                    if (enti[2].is_connected_to_electric_network()==true and enti[2].energy==enti[2].electric_buffer_size) then 
                        enti[1].active=true
                    else
                        enti[1].active=false
                    end
                else
                    enti[2].power_usage=10*(50/3)
                end
            end
        end
    end


    function set_power()
        powerinterfacetable=global.biggerartillerypowerinterfacetable
        power=global.biggerartillerypowerinterfacetablepowerusage
        for _,enti in pairs(powerinterfacetable) do
            if enti[1].get_inventory(defines.inventory.turret_ammo).is_empty()==false then
                if enti[3]==enti[1].relative_turret_orientation then
                    enti[2].power_usage=10*(50/3)
                else
                    enti[2].power_usage=power
                end
                enti[3]=enti[1].relative_turret_orientation
            end
        end    
    end

    function config_changed()

        global.biggerartillerypowerinterfacetable={}
        global.biggerartillerypowerinterfacetablepowerusage=settings.startup["bigger-artillery-mod-power-consumption"].value*(50/3)
        
        for _, surface in pairs(game.surfaces) do
            for _, pwint in pairs(surface.find_entities_filtered{name="big-artillery-power"}) do
                pwint.destroy()
            end

            for _, bertha in pairs(surface.find_entities_filtered{name={"big-artillery-turret","man-big-artillery-turret"}}) do
                event={created_entity=bertha}
                add_powerinterface(event)
            end
        end
    end

    script.on_init(config_changed)
    script.on_configuration_changed(config_changed)

    local specialfilter={
        {filter="name",name="big-artillery-power"},
        {filter="name",name="big-artillery-turret"},
        {filter="name",name="man-big-artillery-turret"}
    }
    
    --add
    script.on_event(defines.events.on_built_entity,add_powerinterface,filter)
    script.on_event(defines.events.on_robot_built_entity,add_powerinterface,filter)
    script.on_event(defines.events.script_raised_built,add_powerinterface,filter)
    script.on_event(defines.events.script_raised_revive,revive_bb,filter)
    --rm
    script.on_event(defines.events.on_player_mined_entity,rm_powerinterface,filter)
    script.on_event(defines.events.on_robot_mined_entity,rm_powerinterface,filter)
    script.on_event(defines.events.on_entity_died,rm_powerinterface,filter)
    --clone
    script.on_event(defines.events.on_entity_cloned,on_cloned,specialfilter)
    

    --checkpower
    script.on_event(defines.events.on_tick,check_power)
    script.on_nth_tick(210,set_power)
    
else
   
    function remove_pw()
        global.biggerartillerypowerinterfacetable={}
        
        for _, surface in pairs(game.surfaces) do
            for _, pwint in pairs(surface.find_entities_filtered{name="big-artillery-power"}) do
                pwint.destroy()
            end

        end
    end

    script.on_init(remove_pw)
    script.on_configuration_changed(remove_pw)

end


function change_bb(ev)
    if ev.entity~=nil then
        if ev.entity.name=="big-artillery-turret" or ev.entity.name=="man-big-artillery-turret" then
            selectedbb = ev.entity
            local ply = game.players[ev.player_index]
            if ply.gui.top["bbwindow"]~=nil then
                ply.gui.top["bbwindow"].destroy()
            end
            local win=ply.gui.top.add{type="frame",name="bbwindow",direction="vertical",caption={"custom-name.bb-menu-text"}}
            local row1=win.add{type="flow",name="bbflow",direction="horizontal"}
            row1.add{type="button",name="bbmanual",caption={"custom-name.bb-menu-manual"}}
            row1.add{type="button",name="bbauto",caption={"custom-name.bb-menu-auto"}} 
            local row2=win.add{type="flow",name="bbflow2",direction="horizontal"}
            row2.add{type="button",name="bbclose",caption={"custom-name.bb-menu-close"}}
        end
    end
end

function closegui(ev)
    local ply = game.players[ev.player_index]
    if ply.gui.top["bbwindow"]~=nil then
        ply.gui.top["bbwindow"].destroy()
    end
end

function movecontent(inv1,inv2)
    local count=1
    while count<inventory_size+1 do
        inv2[count].set_stack(inv1[count])
        count=count+1
    end
end

function selectfunc(ev)
    if ev.element.name=="bbclose" then
        game.players[ev.player_index].gui.top["bbwindow"].destroy()
    
    elseif ev.element.name=="bbmanual" then        
        if pcall(function () testobj(selectedbb.name) end) then 

            local rotation=selectedbb.relative_turret_orientation
            local ent=selectedbb.surface.create_entity{name = "man-big-artillery-turret", position = {x= selectedbb.position.x, y = selectedbb.position.y},force = selectedbb.force}
            script.raise_event(defines.events.script_raised_built, {created_entity=ent,entity=ent})                
            movecontent(selectedbb.get_inventory(1),ent.get_inventory(1))
            script.raise_event(defines.events.script_raised_destroy, {entity=selectedbb})
            ent.relative_turret_orientation=rotation

        end

        game.players[ev.player_index].gui.top["bbwindow"].destroy()
      
    elseif ev.element.name=="bbauto" then
        if pcall(function () testobj(selectedbb.name) end) then

            local rotation=selectedbb.relative_turret_orientation
            local ent=selectedbb.surface.create_entity{name = "big-artillery-turret", position = {x= selectedbb.position.x, y = selectedbb.position.y},force = selectedbb.force}
            script.raise_event(defines.events.script_raised_built, {created_entity=ent,entity=ent})                
            movecontent(selectedbb.get_inventory(1),ent.get_inventory(1))
            script.raise_event(defines.events.script_raised_destroy, {entity=selectedbb})
            ent.relative_turret_orientation=rotation

        end

        game.players[ev.player_index].gui.top["bbwindow"].destroy()

    end

end

script.on_event(defines.events.on_gui_opened,change_bb)
script.on_event("close-bb-menu",closegui)
script.on_event(defines.events.on_gui_click,selectfunc)



-- Tools
-- game.print()
-- print(serpent.block(table))
-- print(serpent.dump(table))

-- function test(ev)
--     print("hiii")
-- end