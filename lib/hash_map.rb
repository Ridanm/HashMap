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
    bucket = (hash_code % self.capacity)
    bucket.to_i
  end

  def set(key, value)
    index_error(hash(key))
    @buckets[hash(key)] = LinkedList.new if @buckets[hash(key)].nil?
    if has?(key)
      update_key!(key, value)
    else
      @buckets[hash(key)].append([key, value])
    end
    @buckets = re_hash.buckets if growth
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

    current = @buckets[hash(key)].head
    previous = nil
    if current.value[0] == key
      @buckets[hash(key)].head = current.next_node
      return current.value[1]
    end

    until current.nil?
      if current.value.first == key
        previous.next_node = current.next_node
        return current.value[1]
      end
      previous = current
      current = current.next_node
    end
  end

  def length
    return if @buckets.nil?

    key_count = 0
    each_node_value { |value| key_count += 1 if value.first }
    key_count
  end

  def clear
    @buckets = Array.new(capacity)
  end

  def keys
    return if @buckets.empty?

    key_count = []
    each_node_value { |value| key_count.push(value.first) }
    key_count
  end

  def values
    return if @buckets.nil?

    existing_values = []
    each_node_value { |value| existing_values << value.last }
    existing_values
  end

  def entries
    key_value = []
    each_node_value { |value| key_value << value }
    key_value
  end
end
