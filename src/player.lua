-- Constants
gravity = 0
tsize = 8
wspeed = 1
jspeed = 2
-- Sprites
idle = 49

player = {
	x = 0,
	y = 0
}

function player.calc_grav()
	return player.y + gravity
end

function player.set_pos(x, y)
	player.x = x
	player.y = y
end

function player.move()
	local target_x = player.x
	local target_y = player.y

	if (btn(0)) target_x = player.x - wspeed
	if (btn(1)) target_x = player.x + wspeed
	if (btn(2)) target_y = player.y - jspeed
	if (btn(3)) target_y = player.y + jspeed
	--target_y = player.calc_grav()
	--Collision
	local tile_x = flr(target_x / tsize)
	local tile_y = flr(target_y / tsize)

	if target_x > player.x and (chunk.solid(tile_x + 1, tile_y) or chunk.solid(tile_x + 1, tile_y + 1)) then
		target_x = tile_x * 8
	elseif target_x < player.x and (chunk.solid(tile_x, tile_y) or chunk.solid(tile_x, tile_y + 1)) then
		target_x = (tile_x + 1) * 8
	end

	player.x = target_x
	player.y = target_y
end

function player.draw()
	spr(idle, player.x, player.y)
end