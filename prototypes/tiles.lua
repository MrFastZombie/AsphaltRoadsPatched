local config = require "config"
local tile_transitions = require("util/new-tile-transitions")

local drive_sound = {
    sound = "__base__/sound/driving/vehicle-surface-concrete.ogg",
    fade_ticks = 6
} --InterruptibleSound

data:extend(
{
    -- asphalt tile --------------------------------------------------------------------
    {
    
        type = "tile",
        name = "Arci-asphalt",
        needs_correction = false,
        minable = {mining_time = config.asphalt_mining_speed, result = "Arci-asphalt"},
        mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
        collision_mask = { layers = {ground_tile = true} },
        walking_speed_modifier = config.asphalt_walking_speed_modifier,
        layer_group = "ground-artificial",
        layer = config.asphalt_base_layer,
        shift_layer_if_asphald_roads_is_present = false,
        decorative_removal_probability = 0.97,
        variants =
        {
            main =
            {
                {
                    picture = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt.png",
                    count = 16,
                    size = 1
                },
                {
                    picture = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt2.png",
                    count = 4,
                    size = 2,
                    probability = 0.3,
                },
                {
                    picture = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt4.png",
                    count = 4,
                    size = 4,
                    probability = 0.8,
                },
            },
            transition = {
                layout = {
                    overlay = {
                        inner_corner =
                        {
                            spritesheet = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt-inner-corner.png",
                            count = 8
                        },
                        outer_corner =
                        {
                            spritesheet = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt-outer-corner.png",
                            count = 8
                        },
                        side =
                        {
                            spritesheet = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt-side.png",
                            count = 8
                        },
                        u_transition =
                        {
                            spritesheet = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt-u.png",
                            count = 8
                        },
                            o_transition =
                        {
                            spritesheet = "__AsphaltRoadsPatched__/graphics/terrain/asphalt/asphalt-o.png",
                            count = 1
                        }
                    } -- End of mask
                } -- End of layout
            } -- end of transition
        },
        walking_sound =
        {
            {
                filename = "__base__/sound/walking/concrete-1.ogg",
                volume = 1.2
            },
            {
                filename = "__base__/sound/walking/concrete-2.ogg",
                volume = 1.2
            },
            {
                filename = "__base__/sound/walking/concrete-3.ogg",
                volume = 1.2
            },
            {
                filename = "__base__/sound/walking/concrete-4.ogg",
                volume = 1.2
            }
        },
        driving_sound = drive_sound,
        map_color = config.asphalt_colour,
        --absorptions_per_second = {pollution = 0.0, pollen = 0.0},
        absorptions_per_second = {pollution = 0.0},
        vehicle_friction_modifier = config.asphalt_vehicle_speed_modifier,
        transitions = tile_transitions.asphalt_transitions(),
        transitions_between_transitions = tile_transitions.asphalt_transitions_between_transitions()
    }
})