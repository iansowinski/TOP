def merge_sort(array)
    if array.length > 1
        left = merge_sort(array[0..array.length/2 -1])
        right = merge_sort(array[array.length/2..-1])
        merge(left, right)
    else
        return array
    end
end
def merge(left, right)
    final = []
    while left.length > 0 and right.length > 0
        if left[0] <= right[0]
            final << left.shift 
        else
            final << right.shift
        end
    end
    if right.length > 0
        right.each {|el| final << el}
    elsif left.length > 0
        left.each {|el| final << el}
    end
    return final
end

print merge_sort([1,6,7,2,5,1,7,8,1,5,9,11,51,14])