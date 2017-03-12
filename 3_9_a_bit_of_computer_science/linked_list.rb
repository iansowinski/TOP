class LinkedList
    attr_reader :head, :tail, :size
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end
    def append (value)
        new_node = Node.new(value)
        if @head == nil
            @head = new_node
        else
            @tail.next_node = new_node
        end
        @tail = new_node
        @size += 1
    end
    def prepend (value)
        if @head == nil
            append(value)
        else
            new_node = Node.new(value, @head)
            # puts new_node.next_node
            @head = new_node
        end
        @size += 1
    end
    def at (index)
        node = @head
        while index > 0
            node = node.next_node
            index -= 1
        end
        return node
    end
    def pop
        @tail = at(@size-2)
        @tail.next_node = nil
        @size -= 1
    end
    def contains?(value)
        return true if contains(value) != nil
        return false
    end
    def find(value)
        return contains(value)[1] if contains(value)!=nil
        return nil
    end
    def to_s
        arr = []
        index = 0
        node = @head
        while index < @size
            arr << "( #{node.value} ) ->"
            arr << "nil" if index == @size - 1
            index += 1
            node = node.next_node
        end
        return arr.join(" ")
    end
    private
    def contains(value)
        index = 0
        node = @head
        while index < @size
            return [node, index] if node.value == value
            node = node.next_node
            index += 1
        end
        return nil
    end
end
class Node
    attr_accessor :value, :next_node
    def initialize (value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end
end