# frozen_string_literal: true

# This class implements a hash table
class HashMap
  include NodeLinkedList

  attr_reader :capacity, :load_factor, :buckets

  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = []
  end

  def index_error(bucket_index)
    raise IndexError if bucket_index.negative? || bucket_index >= @capacity
  end

  def update_values!(index, data); end

  def active_lists
    @buckets.compact
  end

  # start of hash_map class methods
  def hash(key)
    hash_code = 0
    prime = 31
    key.to_s.each_char { |char| hash_code = prime * hash_code + char.ord }
    bucket = hash_code % @capacity
    bucket.to_i
  end

  def set(key, value)
    index = hash(key)
    @buckets[index] = LinkedList.new if @buckets[index].nil?
    @buckets[index].append([key, value])
  end

  def get(key)
    index = hash(key)
    return if @buckets[index].nil?

    current = @buckets[index].head
    while current
      return current.value.last if current.value.first == key

      current = current.next_node
    end
  end

  def has?(key)
    index = hash(key)
    return false if @buckets[index].nil?

    current = @buckets[index].head
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
    @buckets = []
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

  def entries; end
end
