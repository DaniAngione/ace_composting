local Entity = _radiant.om.Entity

local AceCompostingEatFeedAdjacent = radiant.class()

function AceCompostingEatFeedAdjacent:stop(ai, entity, args)
   local expendable_resources_component = entity:add_component('stonehearth:expendable_resources')

   if self._animal_feed_data then
      local stacks_component = args.food:get_component('stonehearth:stacks')
      local destroy = true
      if stacks_component then
         stacks_component:consume_stack()
         destroy = (stacks_component:get_stacks() <= 0)
      end
      if destroy then
         ai:unprotect_argument(args.food)
         radiant.entities.destroy_entity(args.food)
      end

      -- if we're interrupted, go ahead and immediately finish eating
      -- we decided it was not fun to leave this hanging
      -- finally, adjust calories if necessary.  this might trigger callbacks which
      -- result in destroying the action, so make sure we do it LAST! (see calorie_obserer.lua)
      expendable_resources_component:modify_value('calories', self._animal_feed_data.calorie_gain)
		
		-- Add the feed buff, if any
		if self._animal_feed_data.applied_buffs then
			for _, applied_buff in ipairs(self._animal_feed_data.applied_buffs) do
				radiant.entities.add_buff(entity, applied_buff)
			end
		end

      -- Animals that are fed get the Cared For buff.
      local equipment_component = entity:get_component('stonehearth:equipment')
      if equipment_component and equipment_component:has_item_type('stonehearth:pasture_equipment:tag') then
         radiant.entities.add_buff(entity, 'stonehearth:buffs:shepherd:compassionate_shepherd')
      end

      self._animal_feed_data = nil
   end
end

return AceCompostingEatFeedAdjacent
