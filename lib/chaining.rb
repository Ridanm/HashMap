# frozen_string_literal: true

# We implemented where to store the hash map data with Linked list class and node class
module NodeLinkedList
  # Node class
  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end

  # Linked list class
  class LinkedList
    attr_accessor :head

    def initialize(head = nil)
      @head = head
    end

    def append(data)
      return @head = Node.new(data) if @head.nil?

      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(data)
    end
  end
end
