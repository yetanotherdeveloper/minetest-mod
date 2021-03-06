
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

local function replace_nodes_in_area(pos, src_name, dst_name, depth)
	local target_node = minetest.get_node_or_nil(pos)
	if  target_node ~= nil and target_node.name == src_name  and target_node.name ~= dst_name and depth < 200 then 
		minetest.set_node(pos , { name = dst_name})
		-- And then do the same for neighbours
		local npos = vector.add(pos, {x = 1, y = 0, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = -1, y = 0, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  1, y = 0, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = -1, y = 0, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  0, y = 0, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = 0, y = 0, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  1, y = 0, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  -1, y = 0, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		-- Add upper 
		npos = vector.add(pos, {x = 0, y = 1, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = 1, y = 1, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = -1, y = 1, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  1, y = 1, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = -1, y = 1, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  0, y = 1, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = 0, y = 1, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  1, y = 1, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  -1, y = 1, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		-- lower
		npos = vector.add(pos, {x = 0, y = -1, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = 1, y = -1, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = -1, y = -1, z = 0})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  1, y = -1, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = -1, y = -1, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  0, y = -1, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x = 0, y = -1, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  1, y = -1, z = -1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
		npos = vector.add(pos, {x =  -1, y = -1, z = 1})
		replace_nodes_in_area(npos, src_name, dst_name, depth+1)
	end
end

local function replace_neighbourhood(pointed_thing, dst_node_type)

	if pointed_thing.type == "node" then
		local pos =  pointed_thing.under
		-- Check type of node 'under' and then for all nodes of this type set a grass
		local pointed_node = minetest.get_node_or_nil(pos)
		-- If there is node at "under" position. Then
		-- get type of node and turn all of nodes of this type into grass
		if  pointed_node ~= nil then 
			print("Node on under: ".. pointed_node.name)
			local node_to_replace = pointed_node.name
			replace_nodes_in_area(pos , pointed_node.name, dst_node_type, 0)
		end
	end
end 

-- TODO (change so that left click activate it)
minetest.register_node("stefcia:brick", {
	    description = "Stefcia brick test",
	        tiles = { "stefcia_head.png" },
		diggable = true,
		sunlight_propagates = true,
		on_use = function(itemstack, user, pointed_thing)
		print("Lets build a house together!")
		-- Remove original thrown node
		local npos = vector.subtract(user:get_pos(), {x = 3, y = 0, z = 3})
		make_x_wall(npos, 6, 5)
		make_z_wall(npos, 6, 5)
		make_x_wall(vector.add(npos, {x = 0, y = 0, z = 6}),6, 5)
		make_z_wall(vector.add(npos, {x = 6, y = 0, z = 0}),6, 5)
		make_flat_roof(vector.add(npos, {x = 0, y = 5, z = 0}), 6,6 )
		-- Space for door
		minetest.remove_node(vector.add(npos, {x = 1, y = 0, z = 0}))
		minetest.remove_node(vector.add(npos, {x = 1, y = 1, z = 0}))
    end,
		})

-- Brick which turns other bric into grass
minetest.register_node("stefcia:brick2", {
	    description = "let plant some grass",
	        tiles = { "stefcia_tempgrass.png" },
		diggable = true,
		sunlight_propagates = true,
		on_use = function(itemstack, user, pointed_thing)
		--after_use = function(itemstack, user, node, digparams)
			print("Let there be a grass")
			replace_neighbourhood(pointed_thing, "default:dirt_with_grass")
		    end,
		})

-- Brick which turns other nodes into brick
minetest.register_node("stefcia:brick3", {
	    description = "Brick them all",
	        tiles = { "stefcia_tempbrick.png" },
		diggable = true,
		sunlight_propagates = true,
		on_use = function(itemstack, user, pointed_thing)
		--after_use = function(itemstack, user, node, digparams)
			print("Let there be a brick")
			replace_neighbourhood(pointed_thing, "default:brick")
		    end,
		})

-- Brick which turns other nodes into water
minetest.register_node("stefcia:brick4", {
	    description = "Flood them all",
	        tiles = { "stefcia_tempwater.png" },
		diggable = true,
		sunlight_propagates = true,
		on_use = function(itemstack, user, pointed_thing)
		--after_use = function(itemstack, user, node, digparams)
			print("Let there be a water")
			replace_neighbourhood(pointed_thing, "default:water_source")
		    end,
		})

-- Brick which turns other nodes into water
minetest.register_node("stefcia:brick5", {
	    description = "Burn them all",
	        tiles = { "stefcia_templava.png" },
		diggable = true,
		sunlight_propagates = true,
		on_use = function(itemstack, user, pointed_thing)
		--after_use = function(itemstack, user, node, digparams)
			print("Let there be fire")
			replace_neighbourhood(pointed_thing, "default:lava_source")
		    end,
		})


-- Register global function on_punch and if type is stefcia:brick2 then set new node
--minetest.register_on_punchnode(

--function(pos, node, puncher, pointed_thing)
-- if activate item is stefcia:brick2 then make a grass
--if puncher:is_player() then
--	print("player punchin")
--end	
--minetest.set_node(pos, { name = "default:dirt_with_grass" })
--end

--)

-- puncher:is_player() ,
-- TODO: Get puncher used item
