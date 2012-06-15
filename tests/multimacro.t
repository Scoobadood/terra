
local bar = macro(function(ctx,typ,x)
	return {terralib.newtree(typ, { kind = terralib.kinds.literal, type = double, value = 4.0 }), terralib.newtree(typ, { kind = terralib.kinds.literal, type = double, value = x:asvalue(ctx) }) }
end)

local x,y,z = 1,2,3

terra foo() : int
	var a,b = bar(int,x + y + z)
	var c = bar(int,0) + 1
	--bar2(int) = bar2(int) + 5
	--bar3(up(&a),up(&a))
	return a + b + c
end

local test = require("test")
test.eq(15,foo())
