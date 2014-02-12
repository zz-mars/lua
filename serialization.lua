function quote (s)
	-- find maximum length of sequences of equal signs
	local n = -1
	for w in string.gmatch(s,"]=*]") do
		n = math.max(n,#w - 2)
	end
	local eq = string.rep("=",n + 1)
	return string.format(" [%s[\n%s]%s] ",eq,s,eq)
end

function serialization (o)
	if type(o) == "number" then
		io.write(o)
	elseif type(o) == "string" then
		io.write(string.format("%q",o))
	elseif type(o) == "table" then
		io.write("{\n")
		for k,v in pairs(o) do
			io.write(" ", k, " = ")
			serialization(v)
			io.write(",\n")
		end
		io.write("}\n")
	else
		error("cannot serialize a " .. type(o))
	end
end

testt = {a = 12, b = 'Lua', key = 'another "one" '}

serialization(testt)

