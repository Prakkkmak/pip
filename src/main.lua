spawn = {
	x = 4 * 8,
	y = 0
}

function _init()
	player.set_pos(spawn.x, spawn.y)
	t = 0
	palt(0, false)
	palt(14, true)
end

function _update()
	player.move()
	t += 1
end

function _draw()
	cls()
	local cam_y = min(0, player.y)
	camera(0, cam_y - 64)
	for i = 0, 64 do
		chunk.gen(i)
	end
	player.draw()
end