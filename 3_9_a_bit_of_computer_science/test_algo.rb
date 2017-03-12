def palindrom(str, s=0, k=str.length-1)
    return true if s == k
    return true if str[s] == str[k] and s+1 == k
    return false if str[s] != str[k]
    palindrom(str, s+1, k-1)
end
def bottles (n)
    puts "#{n} bottles of beer on the wal" if n > 0
    puts "no more bottles of beer on the wall" if n == 0
    bottles(n-1) if n > 0
end
def fib(n)
    if n == 0
        return 0
    elsif n == 1
        return 1
    else
        return fib(n-1) + fib(n-2)
    end
end
def flat(arr)
    r = []
    arr.each do |el|
        if el.class.to_s == "Array"
            flat(el).each do |ell|
                r << ell
            end
        else
            r << el
        end
    end 
    return r
end