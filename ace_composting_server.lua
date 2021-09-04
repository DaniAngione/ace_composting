ace_composting = {}

local service_creation_order = {}

local monkey_patches = {
   ace_composting_eat_from_trough_adjacent_action = 'stonehearth_ace.ai.actions.pasture_animal.eat_from_trough_adjacent_action',
	ace_composting_eat_feed_adjacent_action = 'stonehearth.ai.actions.pasture_animal.eat_feed_adjacent_action'
}

local function monkey_patching()
   for from, into in pairs(monkey_patches) do
      local monkey_see = require('monkey_patches.' .. from)
      local monkey_do = radiant.mods.require(into)
      radiant.log.write_('ace_composting', 0, '(ACE Mod) Composting server monkey-patching sources \'' .. from .. '\' => \'' .. into .. '\'')
      radiant.mixin(monkey_do, monkey_see)
   end
end

local function create_service(name)
   local path = string.format('services.server.%s.%s_service', name, name)
   local service = require(path)()
	
   local saved_variables = ace_composting._sv[name]
   if not saved_variables then
      saved_variables = radiant.create_datastore()
      ace_composting._sv[name] = saved_variables
   end

   service.__saved_variables = saved_variables
   service._sv = saved_variables:get_data()
   saved_variables:set_controller(service)
   saved_variables:set_controller_name('ace_composting:' .. name)
   service:initialize()
   ace_composting[name] = service
end

function ace_composting:_on_init()
   ace_composting._sv = ace_composting.__saved_variables:get_data()

   for _, name in ipairs(service_creation_order) do
      create_service(name)
   end

   radiant.events.trigger_async(radiant, 'ace_composting:server:init')
   radiant.log.write_('ace_composting', 0, '(ACE Mod) Composting server initialized')
end

function ace_composting:_on_required_loaded()
	monkey_patching()
   
   radiant.events.trigger_async(radiant, 'ace_composting:server:required_loaded')
end

radiant.events.listen(ace_composting, 'radiant:init', ace_composting, ace_composting._on_init)
radiant.events.listen(radiant, 'radiant:required_loaded', ace_composting, ace_composting._on_required_loaded)

return ace_composting
