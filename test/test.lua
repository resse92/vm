function newCounter()
  local count = 0
  return function ()
    count = count + 1
    return count
  end
end

c1 = newCounter()
print(c1())
print(c1())

c2 = newCounter()
print(c2())
print(c1())
print(c2())

-- local function max(...)
--   local args = {...}
--   local val, idx
--   for i = 1, #args do
--     if val == nil or args[i] > val then
--       val, idx = args[i], i
--     end
--   end
--   return val, idx
-- end

-- local function assert(v)
--   if not v then fail() end
-- end

-- local v1 = max(3, 9, 7, 128, 35)
-- assert(v1 == 128)
-- local v2, i2 = max(3, 9, 7, 128, 35)
-- assert(v2 == 128 and i2 == 4)
-- local v3, i3 = max(max(3, 9, 7, 128, 35))
-- assert(v3 == 128 and i3 == 1)
-- local t = {max(3, 9, 7, 128, 35)}
-- assert(t[1] == 128 and t[2] == 4)