return {
    afk_cam = true, -- true per default, false to desactivate
    cross_hit = true, -- true per default, false to desactivate
    can_do_drive_by = true, -- true per default, false to desactivate (on true player can use weapon driver seat in vehicle)
    can_ragdoll = true, -- true per default, false to desactivate
    can_damaged_only_by_player = false, -- false per default, true to activate

    flags = { -- https://docs.fivem.net/natives/?_0x9CFBE10D
        enable = true, -- false per default, true to active this component
        list = { -- only if enable = true
            {value = false, id = 35}, -- imagine SetPedConfigFlag(PlayerPedId(), id, value)
            {value = true, id = 439}
        }
    },

    hide_hud = { -- https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
        enable = false, -- false per default, true to activate
        list = {3,4,6,7,8,9,13,14},
        scope_list = {
            [`WEAPON_SNIPERRIFLE`] = true,
            [`WEAPON_HEAVYSNIPER`] = true,
            [`WEAPON_MARKSMANRIFLE`] = true,
            [`WEAPON_HEAVYSNIPER_MKII`] = true,
            [`WEAPON_MARKSMANRIFLE_MK2`] = true
        }
    },

    show_radar = {
        type = true, -- true active radar, false desactive radar, 'vehicle' active radar only player inside vehicle
        vehicle = { -- if type = 'vehicle' then all vehicle in this table are blacklisted to show radar inside them
            [`bmx`] = true,
            [`sanchez`] = true,
        }
    },
}