producer = coroutine.create(function (cons)
	while true do
		print("in producer : enter item : ")
		local x = io.read()
		coroutine.resume(cons,x)
	end
end)

consumer = coroutine.create(function ()
	while true do
		item = coroutine.yield()
		print("in consumer : ",item)
	end
end)

coroutine.resume(consumer)

coroutine.resume(producer,consumer)

