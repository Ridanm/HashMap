# frozen_string_literal: true

require_relative 'chaining'
require_relative 'hash_map'

hash_map = HashMap.new

#p hash_map.hash('Daniel')
#p hash_map.hash('Rosa')
#p hash_map.hash('Danie')
#p hash_map

hash_map.set('Daniel', { number: '2121e434' })
hash_map.set('Rosa', mail: 'joder@yop.com')
hash_map.set('Daniel', { mail: '@dano.com' })
hash_map.set('Ro', { mail: 'Ro@24co.com' })


container = hash_map.buckets
#p container.class
#p container[0]
#p container
puts 
#p hash_map.get('Ros')
#p hash_map.get('Rosa')
p hash_map.get('niel')
p hash_map.get('Daniel')
p hash_map.length
p hash_map.buckets.length
p hash_map.keys
p hash_map.values
#p hash_map.clear
#p hash_map.buckets
p hash_map.remove('Daniel')

#hash_map.buckets[15].head.each { |key, value|  puts key, value }

#p hash_map.buckets[15].update!(15, ['Daniel', { prueba: 'uno' }])

=begin
puts "\nLinked class"
array = [] 

l_list = DataStructure::LinkedList.new
l_list.append(['josh', {nop: 'sip'}])
l_list.append(['Dan', {age: 32}])
l_list.append(['Yi', {age: 34}])

array[2] = l_list if array[2].nil?
p array
=end
