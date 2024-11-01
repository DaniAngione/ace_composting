# [ACE Mod] Composting
### by Daniel Angione
v1.6 for Stonehearth ACE 0.9.6.18+
https://stonehearth.net/ 

## DESCRIPTION
Composting, also known as "The Poop Mod", aims to give even more options for your farming enhancement while also adding some humorous new mechanic: pasture animal pooping. Or *ahem* manure. This mod will allow your Shepherd to use composting bins to treat organic matter into compost which can then be used for fertilizers.

## CONTENTS

# COMPOSTING BIN
The Composting Bin can be created by the Shepherd and operated by anyone with hauling capabilities. Different items can be placed in it: manure, rotten foodstuffs or crafted mulch made from fresh veggies - and over time they will become compost which can then be directly used for crafting larger compost chunks or fertilizers. In the future, there might be other uses for compost.

# MANURE
Additionally, pasture animals will now digest food and give it back to you... as manure. Manure can come in various sizes and can be directly taken to a Compost Bin for, well, composting. The manure your animals produce depends on their feeding habits; well fed animals tend to produce larger and better manure while animals relying on grass or basic fodder shall disappoint you with smaller droppings. The maximum size of an animal's "production" is limited by their species, however.

# MANURE DRYING RACK
The Shepherd can also craft a rack that allows you to dry manure or compost into their dried versions that can be used as fuel. Small Manure and Manure will be transformed into Dry Manure, a lower grade fuel; Bits o' Compost will be transformed into Dry Bit o' Compost, also a lower grade fuel; Chunk o' Compost will be transformed into Dry Chunk o' Compost, a good grade fuel.

## REQUIREMENTS & PATCHES
[ACE Mod] Compost requires the following mods:

- Dani's Core Mod
https://steamcommunity.com/sharedfiles/filedetails/?id=1403214892
	
- Authorized Community Expansion (ACE)
https://steamcommunity.com/sharedfiles/filedetails/?id=1577375188
	
## COMPATIBILITY
This mod should be compatible with all other mods unless they override animal feeding actions. This mod DOESN'T WORK without ACE.

## LOCALIZATION
This mod is completely compatible with Stonehearth's localization, it is in English (en) by default but also includes a Brazillian Portuguese (pt-BR) translation and a Japanese (ja-JP) translation provided by ghostcrap!

If you're willing to translate this mod to any other language and would like to see the localization supported on the official mod itself, contact me on Discord:
DaniAngione#3266

## CREDITS, SUPPORT & LICENSE
Mod created by Daniel Angione (DaniAngione#3266 on Discord; daniangi@gmail.com)
Stonehearth created by Radiant Entertainment (https://stonehearth.net)
Authorized Community Expansion (ACE) created by the ACE Team
Translators: ghostcrap (JP)

This mod and all its contents are under a GNU GPL 3.0 license and may be used, shared, remixed and anything else as long as credit is given, linked and the same license is used! More info: https://www.gnu.org/licenses/gpl-3.0.en.html

## CHANGELOG

### October 31st, 2024 - v1.6
- The mod has been updated to utilize the new Dani's Core Mod "Passive Transform" component instead of the old cooling service.
- When transforming, the Composting Bin and the Manure Drying Rack will now reduce the quality of the item by 1.
- Added support for ACE's humanoid bones.
- Added support for ACE's rotten mutton.
- Added support for ACE's different rotten basket entities and preserves.
- Added support for Trapper+ new rotten meat and rotten small meat.

### December 28th, 2023 - v1.5
- All the Composting stuff has been moved to the Shepherd, who is now responsible for doing fertilizers after the ACE 0.9.6.14 Update.
- The monkey-patches for the animal feeding AI actions have been removed since ACE now supports animal feed buffs.
- Fixed an issue introduced by an ACE update that caused rotten food to disappear too quickly. This was intended, but it was bad for this mod, so this mod reverts it.
- Changed the Shepherd's Composter workbench to be less confusing with this mod's Compost Bins.
- Updated the visuals of the Compost Bins.

### February 3rd, 2022 - v1.4
- Fixed some recipes to not use seeds anymore
- Made Compost Fertilizer slightly cheaper (2 chunks of compost now)
- Made it so the ACE smart crafter will not request compost to be crafted anymore
- Added unique visual models for the Compost Fertilizer when applied on farms
- Created a new parameter "efficiency" for the different digestion buffs that determines the chance of that digestion to result in manure... This should slightly reduce the amount of manure on pastures, making them less horrible.
- Made it so that animals that are sleeping when "poop time" arrives will instead just "renew" their digestion timers. They were simply cancelling before... Where was all that poop going to? o.O
- Optimized the manure spawning script to be slightly better for performance.

### September 4th, 2021 - v1.3
- Added support for Japanese language (ja-JP) provided by ghostcrap!
- Fixed some issues and typos
- Fertilizer recipes now require slightly more compost
- Ingredients for Fertilizer and Enhanced Fertilizer have been swapped around (Charcoal and Fish Roe) as indicated by the unstable ACE release.
- Composting Bins & Drying racks should not have default filters anymore.
- You can now compost bones. They take longer to become compost than other products.
- Birds now have their own droppings! However, bird droppings will only ever provide small compost (or nothing)
- You can now craft a "Sealed Barrel of Compost" by using a small barrel and 12 bits of compost. This special item can be stored under the generic "Finished Goods" category in stockpiles or chests and has the sole purpose of being sold. Finally a way to get rid of all the excess compost!
- Transformation times have been slightly adjusted.

### December 26th, 2020 - v1.2
- The mod has been updated to the latest ACE version.
- Fuel Selection storage UI will now display the Composting mod fuels.
- Filters for the "Composting Bin" and "Manure Drying Rack" will not have the "Any..." options anymore; and these containers have been turned into multiple-filter containers.
- Manure settings defined for Ducks and Oinkers
- Digestion buffs added to all duck and oinker edibles.
- Compostable qualities added to rotten duck meat and rotten prepared meat. (Rotten prepared meat will turn into a "Chunk o' Compost" instead of a Bit!)
- "Dry Manure" and "Dry Bit o' Compost" (the fuels) are now sellable!
- "Manure Drying Racks" and "Composting Bins" can't be set as default storage containers.
- Filters for some of the mod's resources have been added to storage containers and fluid containers. Storing things like rotten food or manure will make them last a little longer while waiting for space in the composting bin.
- Composting Bins will last a couple of days more before getting "Mulchy" and requiring new thatch.

### December 11th, 2019 - v1.1
- The Herbalist can now craft a “Manure Drying Rack”! It can be used for… well, letting your poop dry! (Not your poop, hopefully)
- Dried manure can be used as a low-grade fuel! Yay for poop-powered hearths!
- You can also dry already treated compost, creating an even more efficient (good grade) compost fuel!
- Composting bins now have a shiny effect when iconic, similar to other tools.
- Fixed an issue with the filtering of compost
- Fixed an issue with the composting bin rendering (it wasn’t displaying contents with the correct scale)
- Fixed a mod structure issue with weird file paths.

### November 23rd, 2019 - v1.0
- Initial release