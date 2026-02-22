chtls = 8
chpx = chtls * 8
bank_size_col = 128 / chtls

chunk = {}
chunk.current = 0

function chunk.init(index, chid)
	chunk[index] = chid
end

function chunk.draw(index)
	local col = index % 2
	local row = flr(index / 2)

	local sx = col * chpx
	local sy = -row * chpx

	local chid = chunk[index]

	local bank_col = chid % bank_size_col
	local bank_row = flr(chid / bank_size_col)

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
	local bank_col = chid % bank_size_col
	local bank_row = flr(chid / bank_size_col)

	local tx = (bank_col * chtls) + tx % chtls
	local ty = (bank_row * chtls) + ty % chtls

	return fget(mget(tx, ty), 0)
end