-- this set of functions is derived from functions found in "__base__/prototypes/tile/tiles.lua"
local tile_transitions = {}

water_tile_type_names = water_tile_type_names or {}
water_transition_group_id = water_transition_group_id or 1
out_of_map_tile_type_names = out_of_map_tile_type_names or {}
out_of_map_transition_group_id = out_of_map_transition_group_id or 2
default_transition_group_id = default_transition_group_id or 0

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

table.insert(water_tile_type_names, "water")
table.insert(water_tile_type_names, "deepwater")
table.insert(water_tile_type_names, "water-green")
table.insert(water_tile_type_names, "deepwater-green")
table.insert(water_tile_type_names, "water-shallow")
table.insert(water_tile_type_names, "water-mud")
table.insert(water_tile_type_names, "water-wube")
table.insert(out_of_map_tile_type_names, "out-of-map")

local stone_path_to_out_of_map_transition =
{
  to_tiles = out_of_map_tile_type_names,
  transition_group = out_of_map_transition_group_id,

  background_layer_offset = 1,
  background_layer_group = "zero",
  offset_background_layer_by_tile_layer = true,

  spritesheet = "__base__/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition.png",
  layout = tile_spritesheet_layout.transition_4_4_8_1_1,
  mask_enabled = false
}

function tile_transitions.asphalt_transitions()
    return
    {
        {
            to_tiles = water_tile_type_names,
            transition_group = water_transition_group_id,

            spritesheet = "__base__/graphics/terrain/water-transitions/stone-path.png",
            layout = tile_spritesheet_layout.transition_8_8_8_4_4,
            background_enabled = false,
            effect_map_layout =
            {
            spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-mask.png",
            inner_corner_count = 1,
            outer_corner_count = 1,
            side_count = 1,
            u_transition_count = 1,
            o_transition_count = 1
            }
        },
    stone_path_to_out_of_map_transition
    }
end

function tile_transitions.asphalt_transitions_between_transitions()
    return
    {
        {
            transition_group1 = default_transition_group_id,
            transition_group2 = water_transition_group_id,

            spritesheet = "__base__/graphics/terrain/water-transitions/stone-path-transitions.png",
            layout = tile_spritesheet_layout.transition_3_3_3_1_0,
            background_enabled = false,
            effect_map_layout =
            {
            spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-land-mask.png",
            o_transition_count = 0
            }
        },
        {
            transition_group1 = default_transition_group_id,
            transition_group2 = out_of_map_transition_group_id,

            background_layer_offset = 1,
            background_layer_group = "zero",
            offset_background_layer_by_tile_layer = true,

            spritesheet = "__base__/graphics/terrain/out-of-map-transition/stone-path-out-of-map-transition-b.png",
            layout = tile_spritesheet_layout.transition_3_3_3_1_0,
            mask_enabled = false
        },
        {
            transition_group1 = water_transition_group_id,
            transition_group2 = out_of_map_transition_group_id,

            background_layer_offset = 1,
            background_layer_group = "zero",
            offset_background_layer_by_tile_layer = true,

            spritesheet = "__base__/graphics/terrain/out-of-map-transition/stone-path-shore-out-of-map-transition.png",
            layout = tile_spritesheet_layout.transition_3_3_3_1_0,
            mask_enabled = false,
            effect_map_layout =
            {
            spritesheet = "__base__/graphics/terrain/effect-maps/water-stone-to-out-of-map-mask.png",
            u_transition_count = 0,
            o_transition_count = 0
            }
        }
    }
end

return tile_transitions