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

function player.collide(target, current, cross, axis)
	if (target == current) return target
	local target_tile = flr(target / tsize)
	local cross_tile = flr(cross / tsize)
	local overlap = cross % 8 != 0
	local edge = target > current and target_tile + 1 or target_tile

	local hit
	if axis == 0 then
		hit = chunk.solid(edge, cross_tile) or (overlap and chunk.solid(edge, cross_tile + 1))
	else
		hit = chunk.solid(cross_tile, edge) or (overlap and chunk.solid(cross_tile + 1, edge))
	end

	if (hit) return target > current and target_tile * 8 or (target_tile + 1) * 8
	return target
end

function player.move()
	local tx = player.x
	local ty = player.y

	if (btn(0)) tx -= wspeed
	if (btn(1)) tx += wspeed
	tx = player.collide(tx, player.x, player.y, 0)

	if (btn(2)) ty -= jspeed
	if (btn(3)) ty += wspeed
	ty = player.collide(ty, player.y, tx, 1)

	player.x = tx
	player.y = ty
end

function player.draw()
	spr(idle, player.x, player.y)
end