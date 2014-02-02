function nextn(n,va)
	local va = va + 1
	if va > n then return nil end
	return va 
end

function fromto(m,n)
	return nextn,n,m-1
end

for i in fromto(10,20) do
	print(i)
end

function nextn(t,num)
	local num = num + t.step
	if num > t.e then return nil end
	return num 
end

function fromto(m,n,s)
	local t = {e = n, step = s}
	return nextn,t,m-s
end

for i in fromto(10,20,2) do
	print(i)
end

