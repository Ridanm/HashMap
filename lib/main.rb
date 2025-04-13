# frozen_string_literal: true

require_relative 'chaining'
require_relative 'complementary_methods'
require_relative 'hash_map'
require_relative 'hash_set'

test = HashMap.new

# Initial size
puts "\nbuckets initial size => #{test.buckets.size}"

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# Entries
puts "\nentries => #{test.entries.sort}"

# Update values
test.set('banana', 'green')
test.set('carrot', 'green')
puts "\nentries =>  #{test.entries.sort}"

# Re_hash
test.set('moon', 'silver')
puts "\nbuckets re_hash  size => #{test.buckets.size}"

# Only keys
puts "\nOnly keys => #{test.keys.sort}"

# Get key
puts "\nget(banana) => #{test.get('banana')}"

#other = HashMap.new(8)
#other.set('aa', 'blue')
#other.set('bb', 'red')
#other.set('aba', 'yellow')
#p other.buckets[0]
#other.remove('aa')
#puts
#p other.buckets[0]

# HashSet
hash_set = HashSet.new(8)
#p hash_set.instance_of?(HashSet)
#p hash_set.class
#p hash_set.set('Rosa')
#p hash_set.buckets[3].class
#p hash_set.buckets.size

hash_set.set('aa')
hash_set.set('bb')
hash_set.set('aba')
#p hash_set.remove('aa')
#p hash_set.remove('bb')

# HashSet entries
puts "\nHashSet#entries =>  #{ hash_set.entries.flatten}"
# HashSet capacity
puts "\nHashSet#capacity => #{hash_set.capacity}"

# re_hash
puts "\nHashSet#re_hash => #{hash_set.re_hash.buckets.size}"
