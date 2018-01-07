function check_if_transport_entity(entity)
	if (entity.type == "transport-belt" or (entity.type == "entity-ghost" and entity.ghost_type == "transport-belt"))
	or (entity.type == "underground-belt" or (entity.type == "entity-ghost" and entity.ghost_type == "underground-belt"))
	or (entity.type == "splitter" or (entity.type == "entity-ghost" and entity.ghost_type == "splitter")) then
		return true
	end
	return false
end

function check_if_vacuum_entity(entity)
	if entity then
		if (entity.name == "vacuum-transport-belt" or (entity.type == "entity-ghost" and entity.ghost_name == "vacuum-transport-belt"))
		or (entity.name == "vacuum-underground-belt" or (entity.type == "entity-ghost" and entity.ghost_name == "vacuum-underground-belt"))
		or (entity.name == "vacuum-splitter" or (entity.type == "entity-ghost" and entity.ghost_name == "vacuum-splitter")) then
			return true
		end
	end
	return false
end

--Orientation - Up = 0 - Right = 2 - Down = 4 - Left = 6
function get_position_in_direction(entity, modifier)
	local pos = entity.position
	local deltaX = 0
	local deltaY = 0
	local dir = (entity.direction + modifier) % 8
	if dir == 0 then
		deltaY = -1
	elseif dir == 2 then
		deltaX = 1
	elseif dir == 4 then
		deltaY = 1
	elseif dir == 6 then
		deltaX = -1
	end
	pos = {x=pos.x+deltaX, y=pos.y+deltaY}
	return pos
end

function get_entity_in_direction(entity, modifier)
	local pos = get_position_in_direction(entity, modifier)
	
	ea = game.surfaces[1].find_entities_filtered{position=pos}
	if ea then
		ea = ea[1]
	end
	return ea
end



script.on_event({defines.events.on_built_entity}, 
	function(event)
		if settings.global["vacuum-remove-restriction"].value then 
			return
		end
		local player = game.players[event.player_index]
		local entity = event.created_entity
		
		--Inserter placement
		if entity.type == "inserter" or (entity.type == "entity-ghost" and entity.ghost_type == "inserter") then
			local edp = game.surfaces[1].find_entities_filtered{position=entity.drop_position}
			local epp = game.surfaces[1].find_entities_filtered{position=entity.pickup_position}
			if edp then
				edp = edp[1]
			end
			if epp then
				epp = epp[1]
			end
			if check_if_vacuum_entity(edp) or check_if_vacuum_entity(epp) then
				game.print("Inserters can't interact with vacuum belts.")
				if entity.type ~= "entity-ghost" then
					player.insert{name=entity.name, health=entity.health}
				end
				entity.destroy()
			end
		elseif check_if_vacuum_entity(entity) then
			--Check for inserters
			for index, inserter in pairs(game.surfaces[1].find_entities_filtered{area={{entity.position.x - 3, entity.position.y - 3}, {entity.position.x + 3, entity.position.y + 3}}, type="inserter"}) do
				local edp = game.surfaces[1].find_entities_filtered{position=inserter.drop_position}
				local epp = game.surfaces[1].find_entities_filtered{position=inserter.pickup_position}
				if edp then
					edp = edp[1]
				end
				if epp then
					epp = epp[1]
				end
				if check_if_vacuum_entity(edp) or check_if_vacuum_entity(epp) then
					game.print("Inserters can't interact with vacuum belts.")
					if entity.type ~= "entity-ghost" then
						player.insert{name=entity.name, health=entity.health}
					end
					entity.destroy()
					return
				end
            end
			
			--Check for other belts
			if entity.name ~= "vacuum-splitter" then
				local invalid_placement = false
				local entity_ahead = get_entity_in_direction(entity, 0)
				if entity_ahead and not check_if_vacuum_entity(entity_ahead, 0) and check_if_transport_entity(entity_ahead) then
					invalid_placement = true
				end

				for i=1, 3 do
					local entity_beside = get_entity_in_direction(entity, i*2)
					local entity_beside_direction_pos = 0
					if entity_beside then
						entity_beside_direction_pos = get_position_in_direction(entity_beside, 0)
					end
					
					if entity_beside and not check_if_vacuum_entity(entity_beside, 0) and check_if_transport_entity(entity_beside) 
					and entity_beside_direction_pos.x == entity.position.x and entity_beside_direction_pos.y == entity.position.y then
						invalid_placement = true
					end
				end
				if invalid_placement then
					game.print("Vacuum belts have to go through a vacuum splitter first in order to interact with belts.")
					if entity.type ~= "entity-ghost" then
						player.insert{name=entity.name, health=entity.health}
					end
					entity.destroy()
				end
			end
		--Belt placement
		elseif check_if_transport_entity(entity) then
			local invalid_placement = false
			local entity_ahead = get_entity_in_direction(entity, 0)
			if entity_ahead and entity_ahead.name ~= "vacuum-splitter" and check_if_vacuum_entity(entity_ahead, 0) then
				invalid_placement = true
			end

			for i=1, 3 do
				local entity_beside = get_entity_in_direction(entity, i*2)
				local entity_beside_direction_pos = 0
				if entity_beside then
					entity_beside_direction_pos = get_position_in_direction(entity_beside, 0)
				end
				
				if entity_beside and entity_beside.name ~= "vacuum-splitter" and check_if_vacuum_entity(entity_beside, 0) 
				and entity_beside_direction_pos.x == entity.position.x and entity_beside_direction_pos.y == entity.position.y then
					invalid_placement = true
				end
			end
			
			if invalid_placement then
				game.print("Belts have to go through a vacuum splitter first in order to interact with vacuum belts.")
				if entity.type ~= "entity-ghost" then
					player.insert{name=entity.name, health=entity.health}
				end
				entity.destroy()
			end
		end
	end
)