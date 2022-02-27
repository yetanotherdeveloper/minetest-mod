
print("Czesc Pysie!")

local function make_z_wall(start_pos, length, height)
--   print("Buduje sciane Z"..start_pos.z)
--   print("Buduje sciane length"..length)
--   print("Buduje sciane height"..height)
   for tmp_pos=start_pos.z,start_pos.z+length-1 do
	   npos = {x = start_pos.x, y = start_pos.y, z = tmp_pos}
	   for i=npos.y,npos.y+height-1 do
		minetest.set_node(npos, { name = "default:brick" })
		npos = vector.add(npos, {x = 0, y=1, z=0})
	   end
   end
end

local function make_x_wall(start_pos, length, height)
--   print("Buduje sciane X"..start_pos.x)
--   print("Buduje sciane length"..length)
--   print("Buduje sciane height"..height)
   for tmp_pos=start_pos.x,start_pos.x+length-1 do
	   npos = {x = tmp_pos, y = start_pos.y, z = start_pos.z}
	   for i=npos.y,npos.y+height-1 do
		minetest.set_node(npos, { name = "default:brick" })
		npos = vector.add(npos, {x = 0, y=1, z=0})
	   end
   end
end

local function make_flat_roof(start_pos, length, width)
--   print("Buduje plaski dach X"..start_pos.x)
--   print("Buduje sciane length"..length)
--   print("Buduje sciane width"..width)
   for tmp_pos=start_pos.x,start_pos.x+length-1 do
	   npos = {x = tmp_pos, y = start_pos.y, z = start_pos.z}
	   for i=npos.z,npos.z+width-1 do
		minetest.set_node(npos, { name = "default:wood" })
		npos = vector.add(npos, {x = 0, y=0, z=1})
	   end
   end
end


minetest.register_node("stefcia:brick", {
	    description = "Stefcia brick test",
	        tiles = { "stefcia-head.png" },
		diggable = true,
		sunlight_propagates = true,
		-- after_place_node = function(...)
		after_place_node = function(pos, placer, itemstack, pointed_thing)
		print("Lets build a house together!")
		-- Remove original thrown node
		minetest.remove_node(pos)
		local npos = vector.subtract(placer:get_pos(), {x = 3, y = 0, z = 3})
		make_x_wall(npos, 6, 5)
		make_z_wall(npos, 6, 5)
		make_x_wall(vector.add(npos, {x = 0, y = 0, z = 6}),6, 5)
		make_z_wall(vector.add(npos, {x = 6, y = 0, z = 0}),6, 5)
		make_flat_roof(vector.add(npos, {x = 0, y = 5, z = 0}), 6,6 )
		-- Space for door
		minetest.remove_node(vector.add(npos, {x = 1, y = 0, z = 0}))
		minetest.remove_node(vector.add(npos, {x = 1, y = 1, z = 0}))
--		minetest.set_node(vector.add(pos, {x = 1, y = 0, z = 0}), { name = "doors:gate_wood" })
		--minetest.set_node(vector.add(pos, {x = 1, y = 0, z = 0}), { name = "beds:bed_bottom" })
	--	minetest.set_node(vector.add(pos, {x = 1, y = 0, z = 0}), { name = "default:wood" })
	--	minetest.set_node(vector.add(pos, {x = 1, y = 0, z = 0}), { name = "default:ladder_wood" })
    end,
		})

-- TODO: Get player position and build house around him
