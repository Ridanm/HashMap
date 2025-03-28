# frozen_string_literal: true

require 'pry-byebug'

# This module has methods that interact with the HashMap class
module UpdateData
  def index_error(bucket_index)
    raise IndexError if bucket_index.negative? || bucket_index >= @capacity
  end

  def update_key!(key, data)
    current = @buckets[hash(key)].head
    while current
      if current.value.first == key
        if data.is_a?(Hash)
          current.value[1].merge!(data)
        elsif data.is_a?(Array)
          arr = current.value[1] << data
          arr.flatten!.compact.uniq!
        else
          current.value[1] = data
        end
        return
      end
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
    return if empty?

    new_hash = HashMap.new(capacity * 2)
    entries.each do |ky, val|
      new_hash.set(ky, val)
    end
    new_hash
  end
end
