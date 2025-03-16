# frozen_string_literal: true

# This module has methods that interact with the HashMap class
module UpdateData
  def index_error(bucket_index)
    raise IndexError if bucket_index.negative? || bucket_index >= @capacity
  end

  def data(object); end

  def update_key!(key, data)
    current = @buckets[hash(key)].head
    while current
      current.value[1] = data if current.value[0] == key
      current = current.next_node
    end
  end

  def active_lists
    @buckets.compact
  end
end
