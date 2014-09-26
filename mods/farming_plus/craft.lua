-- main `S` code in init.lua
local S
S = farming.S

-- CORN

minetest.register_craftitem('farming_plus:corn_grilled', {
	description = S('Grilled Corn'),
	inventory_image = 'corn_grilled.png',
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	type = 'cooking',
	output = 'farming_plus:corn_grilled',
	recipe = 'farming_plus:corn_item',
	cooktime = 15,
})

minetest.register_craftitem('farming_plus:popcorn', {
	description = S('Popcorn'),
	inventory_image = 'popcorn.png',
	on_use = minetest.item_eat(3),
})

minetest.register_craft({
	type = 'cooking',
	output = 'farming_plus:popcorn 3',
	recipe = 'farming_plus:corn_kernels',
	cooktime = 15,
})

minetest.register_craftitem('farming_plus:corn_kernels', {
	description = S('Corn Kernels'),
	inventory_image = 'corn_kernels.png',
})

minetest.register_craft({
	output = 'farming_plus:corn_kernels 2',
	type = 'shapeless',
	recipe = {'farming_plus:corn_item'},
})

-- TOMATO

minetest.register_craftitem('farming_plus:tomato_sauce', {
	description = S('Ketchup'),
	inventory_image = 'tomato_sauce.png'
})

minetest.register_craft({
	output = 'farming_plus:tomato_sauce',
	--type = 'shapeless',
	recipe = {
		{'', 'default:stick', ''},
		{'farming_plus:sugar', 'farming_plus:tomato_item 3', 'farming_plus:sugar'},
		{'', 'vessels:glass_bottle', ''}
	}
})

-- SUGAR

minetest.register_craftitem('farming_plus:sugar', {
	groups = { food_sugar=1 },
	description = S('Sugar'),
	inventory_image = 'sugar.png',
	on_use = minetest.item_eat(1)
})

minetest.register_craft({
	type = 'cooking',
	cooktime = 3.0,
	output = 'farming_plus:sugar 2',
	recipe = 'default:papyrus',
})

-- WHEAT

minetest.register_craftitem('farming_plus:flour', {
	description = 'Flour',
	inventory_image = 'farming_flour.png',
})
minetest.register_alias('farming:flour', 'farming_plus:flour')

minetest.register_craftitem('farming_plus:dough', {
	description = 'Dough',
	inventory_image = 'farming_dough.png',
})

minetest.register_craft({
	type = 'shapeless',
	output = 'farming_plus:dough 2',
	recipe = {'farming_plus:flour', 'bucket:bucket_water'},
	replacements = {
		{'bucket:bucket_water', 'bucket:bucket_empty'}
	}
})

minetest.register_craftitem('farming_plus:bread', {
	description = 'Bread',
	inventory_image = 'farming_bread.png',
	on_use = minetest.item_eat(4),
})
minetest.register_alias('farming:bread', 'farming_plus:bread')

minetest.register_craft({
	type = 'shapeless',
	output = 'farming_plus:flour',
	recipe = {'farming_plus:wheat', 'farming_plus:wheat', 'farming_plus:wheat', 'farming_plus:wheat'}
})

minetest.register_craft({
	type = 'cooking',
	cooktime = 15,
	output = 'farming:bread',
	recipe = 'farming_plus:dough'
})

-- WOOL

minetest.register_craft({
	type = 'shapeless',
	output = 'wool:white',
	recipe = {'farming:cotton', 'farming:cotton', 'farming:cotton', 'farming:cotton'}
})