def bubble_sort (array_to_sort)
  checker = false
  while checker == false
    checker = true
    array_to_sort.each_with_index do |number, index|
      if index != 0
        if number < array_to_sort[index-1]
          array_to_sort[index-1], array_to_sort[index] = array_to_sort[index], array_to_sort[index-1]
          checker = false
        end
      end
    end
  end
  return array_to_sort
end

def bubble_sort_by (array_to_sort)
  checker = false
  while checker == false
    checker = true
    array_to_sort.each_with_index do |number, index|
      if index != 0
        if yield(array_to_sort[index-1], number) > 0
          array_to_sort[index-1], array_to_sort[index] = array_to_sort[index], array_to_sort[index-1]
          checker = false
        end
      end
    end
  end
  return array_to_sort
end


puts bubble_sort([4,3,78,2,0,2])

puts bubble_sort_by(["hi","hello","hey"]){|left,right| right.length - left.length}
