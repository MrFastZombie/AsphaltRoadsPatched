require "tile_reconverter_config"

function revert_tiles (event)
	if event.player_index == nil then return end --I don't see how this could happen, but may as well be safe.
    local player = game.players[event.player_index]
	local position = player.position
	position.y = position.y - 1

	-- check if the player holds something in his hands that is an item to place tiles with
    if player.cursor_stack == nil then
		log("[Asphalt Roads] Somehow got a nil cursor_stack!")
		return
	end

	if player.cursor_stack.valid_for_read then
		if player.cursor_stack.prototype.place_as_tile_result ~= nil then
			local item = player.cursor_stack.prototype.name
			-- check if the tile is made from only one ingredient
			if AR_reconverter_basic_ingredients[item] == true then
				player.create_local_flying_text{text = {"AR-notification.AR-revert-error-is-already-basic-tile", "[img=item/"..item.."]"}, position = position}
				player.play_sound{path = "utility/cannot_build"}	
			elseif #player.force.recipes[item]["ingredients"] == 1 then
				--#data.raw["recipie"][item]["ingredients"] == 1 then
				-- check if the tile is made from one of the listed ingredients
				local ingredient = player.force.recipes[item]["ingredients"][1].name or player.force.recipes[item]["ingredients"][1][1]
				if AR_reconverter_basic_ingredients[ingredient] == true then
					-- reconvert: create a new stack for the reconverted tiles
					local input_count = player.cursor_stack.count
					local input_prototype = player.cursor_stack.prototype
					local newstack = {name = ingredient, count = input_count}		
					-- this will always revert 1:1 - sufficient for vanilla and AR
					if player.cursor_stack.can_set_stack(newstack) then 
						player.cursor_stack.set_stack(newstack)
						-- put the stack from the cursor back into main inventory
						player.create_local_flying_text{text = {"AR-notification.AR-revert-completed", input_count, "[img=item/"..input_prototype.name.."]", newstack.count, "[img=item/"..newstack.name.."]"}, position = position}
						player.play_sound{path = "utility/inventory_move"}
						player.clear_cursor()
					end
				else
					player.create_local_flying_text{text = {"AR-notification.AR-revert-error-invalid-tile", "[img=item/"..item.."]", ingredient}, position = position}
					player.play_sound{path = "utility/cannot_build"}
				end
			else
				if #player.force.recipes[item]["ingredients"] == 0 then
					-- no ingredient detected? normal / expensive recipes?
				else
					player.create_local_flying_text{text = {"AR-notification.AR-revert-error-multiple-ingredients", "[img=item/"..item.."]", #player.force.recipes[item]["ingredients"]}, position = position}
					player.play_sound{path = "utility/cannot_build"}	
				end
			end
		else
			player.create_local_flying_text{text = {"AR-notification.AR-revert-error-invalid-item", "[img=item/"..player.cursor_stack.prototype.name.."]"}, position = position}
			player.play_sound{path = "utility/cannot_build"}
		end      
	end
end

