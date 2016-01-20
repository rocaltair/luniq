l = require "luniq"

h = l.new()

for i=1, 10 do
	local id = h:new()
	print("new id", id)
end

for i, id in pairs(h:list()) do
	print("iterator", i, id)
end

local cnt = 0
for i, id in pairs(h:list()) do
	cnt = cnt + 1
	if cnt > 5 then
		break
	end
	h:release(id);
end

print("in use 2=", h:inuse(2))
print("in use 8=", h:inuse(8))

for i=1, 5 do
	local id = h:new()
	print("new id", id)
end

print("=====")
for i, id in pairs(h:list()) do
	print("iterator", i, id)
end

for i=1, 1e5 do
	local id = h:new()
end
print("cnt", #h:list())

