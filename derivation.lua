function derive(f,delta)
	local delta = delta or 0.00001
	return function (x)
		return (f(x+delta) - f(x)) / delta end
end

dsin = derive(math.sin)

print(math.cos(12),dsin(12))

