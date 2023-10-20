data:extend({

    {
        type = "bool-setting",
        order = "001",
        name = "bigger-artillery-mod-enable-power-consumption",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "int-setting",
        order = "002",
        name = "bigger-artillery-mod-power-consumption",
        setting_type = "startup",
        default_value = 10000,
        minimum_value = 10,
        maximum_value = 21400000000     
    },
    {
        type = "int-setting",
        order = "01",
        name = "bigger-artillery-mod-range-setting",
        setting_type = "startup",
        default_value = 2800,
        minimum_value = 32,
        maximum_value = 21400000000
    },
    {
        type = "int-setting",
        order = "02",
        name = "bigger-artillery-mod-rotation-speed-setting",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 21400000000          
    },
    {
        type = "int-setting",
        order = "03",
        name = "bigger-artillery-mod-shooting-speed-setting",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 1,
        maximum_value = 21400000000     
    },
    {
        type = "bool-setting",
        order = "06",
        name = "bigger-artillery-mod-disable-range-color",
        setting_type = "startup",
        default_value = false
    },
    {
        type = "int-setting",
        order = "90",
        name = "bigger-artillery-mod-ammo-stack",
        setting_type = "startup",
        hidden = true,
        default_value = 50,
        minimum_value = 1,
        maximum_value = 255     
    },
    {
        type = "int-setting",
        order = "90",
        name = "bigger-artillery-mod-inventory-stack",
        setting_type = "startup",
        hidden = true,
        default_value = 5,
        minimum_value = 1,
        maximum_value = 255     
    }

})