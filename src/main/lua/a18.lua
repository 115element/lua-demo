ns_tab = { { "1", "53" } }

print(ns_tab[1][1])

ns_tab[1][1] = "123.23.23.23"

print(ns_tab[1][1])


-- status：函数是否执行成功，ret函数返回值，如果无返回值，那么是nil
local status, ret = pcall(
        function(string)
            print(string)
            return string
        end
,
        "123"
)

print(status,ret) --返回：执行状态和函数返回值