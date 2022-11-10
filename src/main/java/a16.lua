--Lua协同程序(coroutine)与线程比较类似：拥有独立的堆栈，独立的局部变量，独立的指令指针，同时又与其它协同程序共享全局变量和其它大部分东西。
--协同是非常强大的功能，但是用起来也很复杂。

co = coroutine.wrap(
        function(i)
            print(i)
        end
)
co(1)

c1 = coroutine.create(
        function()
            print(".....")
        end
)

coroutine.resume(c1)

print(coroutine.status(c1))
print(coroutine.running())

[=[
coroutine.create()	创建 coroutine，返回 coroutine， 参数是一个函数，当和 resume 配合使用的时候就唤醒函数调用
coroutine.resume()	重启 coroutine，和 create 配合使用
coroutine.yield()	挂起 coroutine，将 coroutine 设置为挂起状态，这个和 resume 配合使用能有很多有用的效果
coroutine.status()	查看 coroutine 的状态
注：coroutine 的状态有三种：dead，suspended，running，具体什么时候有这样的状态请参考下面的程序

coroutine.wrap()	创建 coroutine，返回一个函数，一旦你调用这个函数，就进入 coroutine，和 create 功能重复
coroutine.running()	返回正在跑的 coroutine，一个 coroutine 就是一个线程，当使用running的时候，就是返回一个 corouting 的线程号
]=]