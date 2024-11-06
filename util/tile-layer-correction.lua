local tile_layer_correction = {}

-- shift every tile layer with a layer that is greater or equal to "base_layer" by "offset"
function tile_layer_correction.shift_tile_layer(base_layer, offset)
    for k,tileset in pairs(data.raw["tile"]) do
        if tileset.layer ~= nil and base_layer ~= nil then
            if tileset.shift_layer_if_asphald_roads_is_present ~= false and tileset.layer >= base_layer then 
                data.raw["tile"][tileset.name].layer = tileset.layer + offset
            end
        elseif tileset.name ~= nil then 
            log("Tried shifting " .. tileset.name .. " but it had a nil layer value.")
        end
    end
end

return tile_layer_correction
