--require("module")
--
--print(module.constant)
--module.func3()

num = 7
function toBits(num)
    -- returns a table of bits, least significant first.
    local t = {} -- will contain the bits
    while num > 0 do
        rest = math.fmod(num, 2)
        t[#t + 1] = rest
        num = (num - rest) / 2
    end
    return t
end
bits = toBits(num)
print(table.concat(bits))
function toBits(num, bits)
    -- returns a table of bits, most significant first.
    bits = bits or math.max(1, select(2, math.frexp(num)))
    local t = {} -- will contain the bits
    for b = bits, 1, -1 do
        t[b] = math.fmod(num, 2)
        num = math.floor((num - t[b]) / 2)
    end
    return t
end

s = "123"

for i = 1, #s do
    local var = string.byte(s, i)
    print(var)
end


