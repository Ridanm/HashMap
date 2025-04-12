# frozen_string_literal: true

# This module has methods that interact with the HashMap class
module UpdateData

  def index_error(bucket_index)
    raise IndexError if bucket_index.negative? || bucket_index >= @capacity
  end

  def update_key!(key, data)
    current = @buckets[hash(key)].head
    while current
      return current.value[1] = data if current.value[0] == key
      current = current.next_node
    end
  end

  def active_lists
    @buckets.compact
  end

  def growth
    factor = length.to_f / capacity
    factor >= load_factor
  end

  def empty?
    length.zero?
  end

  def re_hash
    new_hash = HashMap.new(@capacity * 2)
    entries.each do |ky, val|
      new_hash.set(ky, val)
    end
    new_hash
  end

  def each_node_value
    return if @buckets.nil?

    active_lists.each do |list|
      current = list.head
      while current
        yield current.value if current.value
        current = current.next_node
      end
    end
  end
end
