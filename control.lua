-- check mod state
script.on_configuration_changed(function(data)
    -- midgame installation
    if data.mod_changes ~= nil and data.mod_changes["AsphaltRoadsPatched"] ~= nil and data.mod_changes["AsphaltRoadsPatched"].old_version == nil then
        -- anounce installation
        notification({"AR-notification.AR-notification-midgame-update", {"AR-notification.AR-prefix"}, data.mod_changes["AsphaltRoadsPatched"].new_version})

    -- midgame update
    elseif data.mod_changes ~= nil and data.mod_changes["AsphaltRoadsPatched"] ~= nil and data.mod_changes["AsphaltRoadsPatched"].old_version ~= nil then
        local oldver = data.mod_changes["AsphaltRoadsPatched"].old_version
        local newver = data.mod_changes["AsphaltRoadsPatched"].new_version
        notification({"AR-notification.AR-notification-new-version", {"AR-notification.AR-prefix"}, oldver, newver})
		
		for index, force in pairs(game.forces) do
            force.reset_recipes()
			force.reset_technologies()
			force.reset_technology_effects()
        end
    
    -- if other mods changed or prototypes changes
    elseif data.mod_changes ~= nil or data.mod_startup_settings_changed then
        for index, force in pairs(game.forces) do
            --force.recipes["Arci-asphalt"].reload()
			force.reset_recipes()
			force.reset_technologies()
			force.reset_technology_effects()
        end
	end
end)

function notification(txt, force)
    if force ~= nil then
        force.print(txt)
    else
        for k, p in pairs (game.players) do
            game.players[k].print(txt)
        end
    end
end

require "tile_reconverter"

-- if the player presses the respective key, this event is fired to revert the tiles the player is holding in his hand back to basic tiles
script.on_event("AR-event-revert-tiles", function(event)
    local player = game.get_player(event.player_index)
    local connecting_stock = false
    if player ~= nil then
        if settings.global["AR-enable-tile-reconverter"].value and player.is_cursor_empty() == false then
            if player.vehicle ~= nil then
                if player.vehicle.type == "locomotive" then
                    local i = 1
                    local frontEnd = player.vehicle.train.front_end
                    local backEnd = player.vehicle.train.back_end
                    while i <= 2 do
                        i = i + 1
                        frontEnd.move_natural()
                        backEnd.move_natural()
                        local front_trains = game.surfaces[player.vehicle.surface_index].find_entities_filtered{area=frontEnd.rail.bounding_box, type={"locomotive", "cargo-wagon", "fluid-wagon"}}
                        local back_trains = game.surfaces[player.vehicle.surface_index].find_entities_filtered{area=backEnd.rail.bounding_box, type={"locomotive", "cargo-wagon", "fluid-wagon"}}
                        
                        for index, stock in ipairs(front_trains) do
                            if stock.train.id == player.vehicle.train.id then
                                table.remove(front_trains, index)
                            end
                        end

                        for index, stock in ipairs(back_trains) do
                            if stock.train.id == player.vehicle.train.id then
                                table.remove(back_trains, index)
                            end
                        end
                        
                        if #front_trains > 0 or #back_trains > 0 then
                            connecting_stock = true
                            break
                        end
                    end
                end
            end
            if connecting_stock == false then revert_tiles(event) end
        end
    end
end)