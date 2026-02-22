chtls = 8
chpx = chtls * 8

chunk = {}
chunk.current = 0

function chunk.init(index)
	local chid = 0
	chunk[index] = chid
end

function chunk.draw(index)
	local col = index % 2
	local row = flr(index / 2)

	local sx = col * chpx
	local sy = -row * chpx

	local chid = chunk[index]
	local bank_col = chid % 2
	local bank_row = chid / 2

	local tx = bank_col * chtls
	local ty = bank_row * chtls

	map(tx, ty, sx, sy, chtls, chtls)
end

function chunk.solid(tx, ty)
	local cx = flr(tx / chtls)
	local cy = -flr(ty / chtls)

	local index = cx + cy * 2

	local chid = chunk[index]
	if (chid == nil) return false
	local bank_col = chid % 2
	local bank_row = chid / 2

	local tx = (bank_col * chtls) + tx % chtls
	local ty = (bank_row * chtls) + ty % chtls

	return fget(mget(tx, ty), 0)
end