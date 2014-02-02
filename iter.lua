function values(t)
	local i = 0
	return function(s,v)
		print("calling iterator with arguments : ",s,v)
		i = i + 1
		return t[i]
	end
end

t = {1,2,3,4,5,6,7,8,9}

for elem in values(t) do
	print(elem)
end

