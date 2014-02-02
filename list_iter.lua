function getnext(list,node)
	if not node then
		return list end
	return node.next
end

list = nil

for line in io.lines() do
	list = {val = line,next = list}
end

for node in getnext,list,nil do
	print(node.val)
end

