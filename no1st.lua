function no1st(...)
	local args = table.pack(...)
	if args.n == 0 then return nil end
	return table.unpack(args,2,#args)
end

print(no1st(1,2,3,4,5,6))
