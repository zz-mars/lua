producer = coroutine.create(function ()
	while true do
		local x = io.read()
		coroutine.yield(x)
	end
end)

consumer = coroutine.create(function ()
	while true do
		flag,result = coroutine.resume(producer)
		if flag == true then
			print("from producer : ",result)
		end
	end
end)


coroutine.resume(consumer)

