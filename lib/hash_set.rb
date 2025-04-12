# frozen_string_literal: true

# This class behave similarly to HashMap but only contains keys with no values.
class HashSet < HashMap
  include NodeLinkedList

  attr_accessor :buckets, :capacity, :load_factor

  def initialize(capacity = 8, load_factor = 0.75)
    super(capacity, load_factor)
    @buckets = Array.new(capacity)

  def set(key)
    index_error(hash(key))
    @buckets[hash(key)] = LinkedList.new if @buckets[hash(key)].nil?
    @buckets[hash(key)].append([key])
    @buckets = re_hash.buckets if growth
    end
  end

  def re_hash
    new_hash = HashSet.new(@capacity * 2)
    entries.each do |ky|
      puts ky
      new_hash.set(ky)
    end
    new_hash
  end

  def get(key)
    return if @buckets[hash(key)].nil?

    current = @buckets[hash(key)].head
    while current
      return key if current.value[0] == key

      current = current.next_node
    end
  end

  def remove(key)
    return if @buckets[hash(key)].nil?

    current = @buckets[hash(key)].head
    if current.value[0] == key
      @buckets[hash(key)].head = current.next_node
      return key
    end

    previous = nil
    while current
      if current.value[0] == key
        previous.next_node = current.next_node
        return key
      end
      previous = current
      current = current.next_node
    end
  end
end
