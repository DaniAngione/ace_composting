local item_quality_lib = require 'stonehearth_ace.lib.item_quality.item_quality_lib'
local Entity = _radiant.om.Entity
local log = radiant.log.create_logger('eat_trough_feed')

local AceCompostingEatTroughFeedAdjacent = radiant.class()

function AceCompostingEatTroughFeedAdjacent:stop(ai, entity, args)
   local expendable_resources_component = entity:add_component('stonehearth:expendable_resources')

   if self._animal_feed_data then
      local quality_chances = self._animal_feed_data.quality_chances
      if quality_chances then
         if self._feed_quality and self._feed_quality > 1 then
            quality_chances = item_quality_lib.modify_quality_table(quality_chances, self._feed_quality)
         end
         item_quality_lib.apply_quality(entity, quality_chances)
      end

      log:debug('%s successfully ate, gaining %s calories', entity, self._animal_feed_data.calorie_gain)

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
      self._feed_quality = nil
   end
end

return AceCompostingEatTroughFeedAdjacent
