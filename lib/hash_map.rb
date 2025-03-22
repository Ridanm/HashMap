# frozen_string_literal: true

# This class implements a hash table
class HashMap
  include UpdateData
  include NodeLinkedList

  attr_reader :capacity, :load_factor, :buckets

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(capacity)
  end

  def hash(key)
    hash_code = 0
    prime = 31
    key.to_s.each_char { |char| hash_code = prime * hash_code + char.ord }
    bucket = (hash_code % @capacity)
    bucket.to_i
  end

  def set(key, value)
    @buckets[hash(key)] = LinkedList.new if @buckets[hash(key)].nil?
    if has?(key)
      update_key!(key, value)
    else
      @buckets[hash(key)].append([key, value])
    end
  end

  def get(key)
    return if @buckets[hash(key)].nil?

    current = @buckets[hash(key)].head
    while current
      return current.value.last if current.value.first == key

      current = current.next_node
    end
  end

  def has?(key)
    return false if @buckets[hash(key)].nil?

    current = @buckets[hash(key)].head
    while current
      return true if current.value[0] == key

      current = current.next_node
    end
    false
  end

  def remove(key)
    return if @buckets[hash(key)].nil?

    key_removed = nil
    current = @buckets[hash(key)].head

    until current.nil?
      return key_removed = current.value.first if current.next_node.nil?
      
      key_removed = current.next_node.value.first if current.value.first == key
      current = current.next_node
    end

    @buckets[hash(key)] = current
    key_removed
  end

  def length
    return if @buckets.nil?

    key_count = 0
    active_lists.map do |list|
      current = list.head
      while current
        key_count += 1 if current.value.first
        current = current.next_node
      end
    end
    key_count
  end

  def clear
    @buckets = Array.new(capacity)
  end

  def keys
    return if @buckets.empty?

    key_count = []
    active_lists.map do |list|
      current = list.head
      while current
        key_count.push(current.value.first)
        current = current.next_node
      end
    end
    key_count
  end

  def values
    return if @buckets.nil?

    existing_values = []
    active_lists.map do |list|
      current = list.head
      while current
        existing_values << current.value.last
        current = current.next_node
      end
    end
    existing_values
  end

  def entries
    key_value = []
    active_lists.each do |list|
      current = list.head
      while current
        key_value << current.value
        current = current.next_node
      end
    end

    key_value
  end
end
