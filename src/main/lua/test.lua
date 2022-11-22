local_redis = { ["addr"] = "127.0.0.1", ["port"] = 6379 }

t = {
    { addr = "192.168.2.18", port = "36079" },
    { addr = "192.168.2.18", port = "36079" },
}

print(#t)

print(t[1])
print(t[1]["addr"])
print(t[1]["port"])
print("------------")

print(t[2])
print(t[2]["addr"])
print(t[2]["port"])




require("moudle")
print(module.constant)
print(type(module.func1)) --function
module.func3()


