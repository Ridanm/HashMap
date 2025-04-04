# frozen_string_literal: true

# This class is same as a HashMap but only contains keys with no values.
class HashSet < HashMap
  include NodeLinkedList

  attr_accessor :buckets, :capacity, :load_factor

  def initialize(capacity = 8, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @buckets = Array.new(capacity)

    def set(key)
      index_error(hash(key))
      @buckets[hash(key)] = LinkedList.new if @buckets[hash(key)].nil?
      if has?(key)
        puts "#{Key} already exist"
      else
        @buckets[hash(key)].append([key])
      end
      @buckets = re_hash.buckets if growth
    end
  end

  def re_hash
    new_hash = HashSet.new(@capacity * 2)
    entries.each do |ky|
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
    
  end;


end
