-- minetest/wool/init.lua

local wool = {}
-- This uses a trick: you can first define the recipes using all of the base
-- colors, and then some recipes using more specific colors for a few non-base
-- colors available. When crafting, the last recipes will be checked first.
wool.dyes = {
	{'white',      'White',      nil},
	{'grey',       'Grey',       'basecolor_grey'},
	{'black',      'Black',      'basecolor_black'},
	{'red',        'Red',        'basecolor_red'},
	{'yellow',     'Yellow',     'basecolor_yellow'},
	{'green',      'Green',      'basecolor_green'},
	{'cyan',       'Cyan',       'basecolor_cyan'},
	{'blue',       'Blue',       'basecolor_blue'},
	{'magenta',    'Magenta',    'basecolor_magenta'},
	{'orange',     'Orange',     'excolor_orange'},
	{'violet',     'Violet',     'excolor_violet'},
	{'brown',      'Brown',      'unicolor_dark_orange'},
	{'pink',       'Pink',       'unicolor_light_red'},
	{'dark_grey',  'Dark Grey',  'unicolor_darkgrey'},
	{'dark_green', 'Dark Green', 'unicolor_dark_green'},
}

for _, row in ipairs(wool.dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]
	-- Node Definition
	minetest.register_node('wool:'..name, {
		description = desc..' Wool',
		tiles = { 'wool_'..name..'.png' },
		inventory_image = 'wool_'..name..'.png',
		groups = {
				snappy=2,
				choppy=2,
				oddly_breakable_by_hand=3,
				flammable=3,
				wool=1
			},
		sounds = default.node_sound_defaults(),
	})
	if craft_color_group then
		-- Crafting from dye and white wool
		minetest.register_craft({
			type = 'shapeless',
			output = 'wool:'..name,
			recipe = {'group:dye,'..craft_color_group, 'group:wool'},
		})
	end
end

if core.get_modpath( 'moreblocks' ) ~= nil then
	local dyes = {}
	for _, row in ipairs(wool.dyes) do
		table.insert( dyes, row[1] )
	end
	stairsplus.register_nodes ( 'wool', dyes )
end
