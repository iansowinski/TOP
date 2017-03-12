class Node
    attr_accessor :value, :right, :left
    def initialize(value)
        @value = value
        @right = nil
        @left = nil
    end
end

class Tree
    def initialize(array)
        @root = Node.new(array[0])
        array[1..-1].each do |item|
            insert(item, @root)
        end
    end

    def insert(value, node)
        if value < node.value
            if node.left == nil
                node.left = Node.new(value)
            else 
                insert(value, node.left)
            end
        elsif value > node.value
            if node.right == nil
                node.right = Node.new(value)
            else 
                insert(value, node.right)
            end
        end
    end

    def breadth_first_search (query)
        node = @root
        queue = [node]
        while queue.length > 0
            if queue[0] != nil and queue[0].value == query
                return queue[0]
            end
            queue << queue[0].left if queue[0].left != nil
            queue << queue[0].right if queue[0].right != nil
            queue.shift
        end
        return false
    end
    def depth_first_search(query)
        node = @root
        stack = [node]
        visited = []
        while stack.length > 0
            node = stack[-1]
            visited << node
            return node if node.value == query
            if node.left != nil and !visited.include?(node.left)
                stack << node.left
            elsif node.right != nil and !visited.include?(node.right)
                stack << node.right
            else
                stack.pop
            end
        end
        return false
    end
    def depth_first_search_recursive(query)
        val = dfs_rec(query, @root)
        return val if val != nil
        return false
    end
    private
    def dfs_rec (query, node)
        return node if node != nil and node.value == query
        left = dfs_rec(query, node.left) if node != nil and 
        return left if left != nil
        right = dfs_rec(query, node.right) if node != nil and 
        return right if right != nil
    end
end
item = Tree.new([1000, 7, 4, 99, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts item.breadth_first_search(7)
puts item.breadth_first_search(666)
puts item.depth_first_search(7)
puts item.depth_first_search(666)
puts item.depth_first_search_recursive(666)