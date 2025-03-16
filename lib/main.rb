# frozen_string_literal: true

require_relative 'chaining'
require_relative 'complementary_methods'
require_relative 'hash_map'

hash_map = HashMap.new

# p hash_map.hash('Daniel')
# p hash_map.hash('Rosa')
# p hash_map.hash('Danie')
# p hash_map

hash_map.set('appel', 'red')
hash_map.set('banana', 'yellow')
hash_map.set('carrot', 'orange')
hash_map.set('dog', 'brown')
# hash_map.set('Ro', 'data' => { mail: 'Ro@24co.com' })
# hash_map.set('Daniel', data: { birthday: 'August/2' })
hash_map.set('banana', 'pink')

hash_map.buckets
# p container.class
# p container[0]
# p container
puts
# p hash_map.get('Ros')
# p hash_map.get('Rosa')
# p hash_map.get('niel')
# p hash_map.get('Daniel')
# p hash_map.length
# p hash_map.buckets.length
# p hash_map.keys
# p hash_map.values
# p hash_map.clear
# p hash_map.buckets
# p hash_map.remove('Rosa')
# p hash_map.remove('Ros')
# p hash_map.remove('Daniel')
p hash_map.entries
# p hash_map.has?('Rosa')
# p hash_map.has?('Kira')
# p hash_map.has?('Daniel')

