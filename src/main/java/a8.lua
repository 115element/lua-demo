if 0 then
    print("真")
else
    print("假")
end

a = 20;

if (a == 10) then
    print("a的值为：10")
elseif (a == 20) then
    print("a的值为：20")
elseif (a == 30) then
    print("a的值为：30")
else
    print("没有匹配a的值")
end

----------------------lua中的函数
myprint = function(param)
    print("这是打印函数 - ##", param, "##")
end

function add(num1, num2, functionPrint)
    result = num1 + num2
    functionPrint(result)
end

add(2, 5, myprint)
