a = 10;
while (a < 20)
do
    print("a值为：", a)
    a = a + 1
    if (a > 15) then
        break --使用break语句终止循环
    end
end




-----------------------------永久死循环
--while(true)
--do
--    print("循环将永远执行下去")
--end


-----------------------------goto用法，当前lua版本好像不支持
--  local a = 1
--  ::label:: print("--- goto label ---")
--
--  a = a+1
--  if a < 3 then
--      goto label   -- a 小于 3 的时候跳转到标签 label
--  end


-----------------------------repeat...until
a = 10
repeat
    print("a的值为：", a)
    a = a + 1;
until (a>15)