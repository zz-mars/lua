local mt = {}
Set = {}
Set.new = function (s)
	local set = {}
	setmetatable(set,mt)
	for _, v in ipairs(s) do
		set[v] = true
	end
	return set
end

Set.union = function (s1,s2)
	local res = Set.new({})
	for k in pairs(s1) do
		res[k] = true
	end
	for k in pairs(s2) do
		res[k] = true
	end
	return res
end

Set.intersection = function (s1,s2)
	local res = Set.new({})
	for k in pairs(s1) do
		res[k] = s2[k]
	end
	return res
end

Set.tostring = function (set)
	local ks = {}
	for k in pairs(set) do
		ks[#ks + 1] = k
	end
	return "{" .. table.concat(ks,",") .. "}"
end

Set.print = function (set)
	print(Set.tostring(set))
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__tostring = Set.tostring

s1 = Set.new{10,20,30,50}
s2 = Set.new{30,1}
print(getmetatable(s1))
print(getmetatable(s2))

print(s1)
print(s2)

print(s1 + s2)
print((s1 + s2) * s2)

