# frozen_string_literal: true

require_relative 'chaining'
require_relative 'complementary_methods'
require_relative 'hash_map'

test = HashMap.new
puts "buckets size => #{test.buckets.size}"
puts "grouwth => #{test.growth}"

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

puts "grouwth => #{test.growth}"
puts "buckets size => #{test.buckets.size}"
puts "entries => #{test.entries.sort}"

test.set('moon', 'silver')
test.set('dog', 'grey')
test.set('banana', 'green')
test.set('carrot', 'green')
puts "\nentries =>  #{test.entries.sort}"
puts "buckets size => #{test.buckets.size}"
