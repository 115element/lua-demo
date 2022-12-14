--字符串
local sourceStr = "prefix-rjsdjhdsjh"
print("\n原始字符串", string.format("%q", sourceStr))


--截取部分，第4个到第15个
local first_stub = string.sub(sourceStr, 4, 15)
print("\n第一次截取", string.format("%q", first_stub))


--取字符串前缀，第1个到第8个
local second_sub = string.sub(sourceStr, 1, 8)
print("\n第二次截取", string.format("%q", second_sub))


--截取最后10个
local third_sub = string.sub(sourceStr, -10)
print("\n第三次截取", string.format("%q", third_sub))


--索引越界，输出原始字符串
local fourth_sub = string.sub(sourceStr,-100)
print("\n第四次截取",string.format("%q",fourth_sub))
