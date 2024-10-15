local biggerArtillery = {}

local kW = (50 / 3)
local power= settings.startup["bigger-artillery-mod-power-consumption"].value * kW
local idlePower=10*kW

function biggerArtillery.remove_powerInterface(a)
    un=a.entity.unit_number
    if storage.powerInterfaceTable[un]~=nil then
        storage.powerInterfaceTable[un][2].destroy()
        storage.powerInterfaceTable[un]=nil
    end
end

function biggerArtillery.remove_bertha(a)
    biggerArtillery.remove_powerInterface(a)
    a.entity.destroy()
end

function biggerArtillery.add_powerinterface(a)
    local e=a.entity
    enti=e.surface.create_entity{name = "big-artillery-power", position = {x= e.position.x, y = e.position.y+1},force = e.force}
    enti.destructible=false
    enti.operable=false
    enti.rotatable=false
    storage.powerInterfaceTable[e.unit_number] = {e,enti,0}
end

function biggerArtillery.revive_bertha(a)
    event={entity=a.entity}
    biggerArtillery.add_powerinterface(event)
end



function biggerArtillery.check_power(a)
    if (storage.powerInterfaceTable ~= nil) then
        for _,enti in pairs(storage.powerInterfaceTable) do
            if enti[1].valid==false or enti[2].valid==false then
                biggerArtillery.config_changed()
            else
                if enti[1].get_inventory(defines.inventory.turret_ammo).is_empty()==false then
                    if (enti[2].is_connected_to_electric_network()==true and enti[2].energy==enti[2].electric_buffer_size) then 
                        enti[1].active=true
                    else
                        enti[1].active=false
                    end
                else
                    enti[2].power_usage=idlePower
                end
            end
        end
    end
end


function biggerArtillery.set_power()  --TODO combine power functions?
    for _,enti in pairs(storage.powerInterfaceTable) do
        if enti[1].get_inventory(defines.inventory.turret_ammo).is_empty()==false then
            if enti[3]==enti[1].relative_turret_orientation then
                enti[2].power_usage=idlePower 
            else
                enti[2].power_usage=power
            end
            enti[3]=enti[1].relative_turret_orientation
        end
    end    
end

function biggerArtillery.config_changed()
    log("Recreating power interfaces")

    storage.powerInterfaceTable={}
    
    for _, surface in pairs(game.surfaces) do
        for _, pwint in pairs(surface.find_entities_filtered{name="big-artillery-power"}) do
            pwint.destroy()
        end

        for _, bertha in pairs(surface.find_entities_filtered{name={"big-artillery-turret","man-big-artillery-turret"}}) do
            event={entity=bertha}
            biggerArtillery.add_powerinterface(event)
        end
    end
end

function biggerArtillery.remove_allPowerInterfaces()
    log("Removing power interfaces")
    storage.powerInterfaceTable={}
    
    for _, surface in pairs(game.surfaces) do
        for _, pwint in pairs(surface.find_entities_filtered{name="big-artillery-power"}) do
            pwint.destroy()
        end

    end
end

function biggerArtillery.on_cloned(a)
    if a.destination.name=="big-artillery-power" then
        a.destination.destroy()
    elseif a.destination.name=="big-artillery-turret" or a.destination.name=="man-big-artillery-turret" then
        event={entity=a.destination}
        biggerArtillery.add_powerinterface(event)
    end
end

return biggerArtillery