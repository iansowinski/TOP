def fib(n):
    if n == 1 or n == 2:
        return 1
    else:
        return fib(n-1) + fib(n-2)
y = 1
x = 0
while x < 4000000:
    z = fib(y)
    if z % 2 == 0:
        x = x + z
    y = y + 1        
print x
