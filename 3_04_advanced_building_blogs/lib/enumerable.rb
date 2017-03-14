module Enumerable

  def my_each
    for i in self
      yield i
    end
  end

  def my_each_with_index
    for i in (0...length)
      yield self[i], i
    end
  end

  def my_select
    array = []
    for i in self
      if yield i
        array << i
      end
    end
    return array
  end

  def my_all?
    for i in self
      if yield i
        next
      else
        return false
      end
    end
    return true
  end

  def my_any?
    for i in self
      if yield i
        return true
      end
    end
    return false
  end

  def my_none?
    for i in self
      if yield i
        return false
      end
    end
    return true
  end

  def my_count (a = nil)
    counter = 0
    array = []
    if a == nil
      if block_given?
        for i in self
          if yield i
            array << i
          end
        end
        return array
      else
        return self.length
      end
    elsif a != nil
      for i in self
        if i == a
          counter += 1
        end
      end
      return counter
    end
  end

  def my_map
    array = []
    for i in self
      array << (yield i)
    end
    return array
  end

  def my_map_proc(&my_proc)
    array = []
    for i in self
      array << my_proc.call(i)
    end
  end

  def my_inject(memo = nil)
    if memo.nil?
      memo = self[0]
      i = 1
    else
      i = 0
    end
    while 1 < self.size
      memo = yield(memo, self[i])
      i += 1
    end
    return memo
  end

  #def multiply_els
  #  self.my_inject{|i, n| i * n}
  #end
end

array = [1, 2, 4, 6, 2, 6]
#puts array.multiply_els
