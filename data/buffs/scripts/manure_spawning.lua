local rng = _radiant.math.get_default_rng()
local log = radiant.log.create_logger('manure_spawning_script')

local ManureSpawningBuffScript = class()

function ManureSpawningBuffScript:on_buff_removed(entity, buff)
   local data = radiant.entities.get_entity_data(entity, 'stonehearth:pasture_animal')
   local buff_uri = buff:get_uri()
   local script = buff:get_json().script_info
   local efficiency = script.efficiency or 0.6

   if data.no_manure then 
      return
   elseif radiant.entities.has_buff(entity, 'stonehearth:buffs:sleeping') then
      radiant.entities.add_buff(entity, buff_uri)
      return
   end

   -- check if there will be poop
   if rng:get_real(0, 1) > efficiency then
      -- no poop
      return
   end

   -- There will be poop! Let us proceed...
   local owner = radiant.entities.get_player_id(entity)
   local location = radiant.entities.get_world_grid_location(entity)
   local manure_data = data and data.manure_data or {}
   local tiny_manure = manure_data.tiny or 'ace_composting:resources:manure_tiny'
   local small_manure = manure_data.small or 'ace_composting:resources:manure_small'
   local large_manure = manure_data.large or 'ace_composting:resources:manure'
   local selected_size = nil
   
   if script.size == 'both' then
      selected_size = rng:get_int(0, 1)
      if selected_size == 1 then
         selected_size = large_manure
      else
         selected_size = small_manure
      end
   elseif script.size == 'large' then
      selected_size = large_manure
   else
      selected_size = small_manure
   end
   
   -- Check the chance for a chonkier poop
   if script.probability then
      if rng:get_real(0, 1) > script.probability then
         selected_size = tiny_manure
      end      
   end
   
   if location then
      local manure = radiant.entities.create_entity(selected_size, { owner = owner })
      local placement_point = radiant.terrain.find_placement_point(location, 0, 2)
      local random_facing = rng:get_int(0, 3) * 90
      radiant.terrain.place_entity(manure, placement_point, { facing = random_facing })
      local effect = radiant.effects.run_effect(manure, 'ace_composting:effects:poop_effect')
   else
		log:detail('Invalid location for %s: %s', tostring(entity), tostring(location))
   end
end

return ManureSpawningBuffScript
