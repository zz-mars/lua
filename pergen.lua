function printResult(
function permgen (a,n)
	n = n or #a
	if n <= 1 then
		printResult(a)
	else
		for i = 1,n do
			a[n],a[i] = a[i],a[n]
			permgen(a,n-1)
			a[n],a[i] = a[i],a[n]
		end
	end
end

a = {1,2,3,4,5,6}

permgen(a,6)

