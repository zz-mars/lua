function printResult (a)
	for i = 1,#a do
		io.write(a[i]," ")
	end
	io.write("\n")
end

function permgen (a,n)
	n = n or #a
	if n <= 1 then
		coroutine.yield(a)
	else
		for i = 1,n do
			a[n],a[i] = a[i],a[n]
			permgen(a,n-1)
			a[n],a[i] = a[i],a[n]
		end
	end
end

function permutations (a)
	local co = coroutine.create(function () permgen(a) end)
	return function ()
		local code, res = coroutine.resume(co)
		return res
	end
end

function permutationss (a)
	return coroutine.wrap(function () permgen (a) end)
end

a = {1,2,3}

for x in permutations(a) do
	printResult(x)
end

for y in permutationss(a) do 
	printResult(y)
end

