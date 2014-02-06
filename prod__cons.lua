-- consumer as coroutine

consumer = coroutine.create(function ()
	while true do
		local x = coroutine.yield()
		print("from producer : ",x)
	end
end)

producer = function (cons)
	coroutine.resume(cons)
	while true do
		local x = io.read()
		coroutine.resume(cons,x)
	end
end

producer(consumer)

