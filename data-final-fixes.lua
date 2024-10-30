--This is to fix a compat issue with Alien biomes.
local tile_list = data.raw.tile
local layer_target = tile_list["stone-path"].layer-2

data.raw.tile["Arci-asphalt"].layer = layer_target

for _, tile in pairs(data.raw.tile) do
    if tile.name:find("^Arci") then
        if tile.name ~= "Arci-asphalt" then
            data.raw.tile[tile.name].layer = layer_target+1
        end
    end
end