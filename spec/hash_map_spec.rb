# frozen_string_literal: true

require 'rspec'
require './lib/chaining'
require './lib/complementary_methods'
require './lib/hash_map'

RSpec.describe HashMap do
  let(:hash_map) { HashMap.new }
  let(:linked_list) { NodeLinkedList::LinkedList.new }
  let(:node) { NodeLinkedList::Node.new(nil) }

  context 'When creating an object of the HashMap class' do 
    it 'If the capacity is 16' do
      expect(hash_map.buckets.size).to eq(16)
    end

    it 'Be an instance of Array' do
      expect(hash_map.buckets).to be_an_instance_of(Array)
    end
  end

  context '#hash(key)' do
    it 'When key = Rama the returned number must be 3' do
      expect(hash_map.hash('Rama')).to eq(3)
    end

    it 'When key = Albert the returned number must be 0' do 
      expect(hash_map.hash('Albert')).to eq(0)
    end
  end

  context '#set(key, value)' do 
    it 'when we add key = banana and value = yellow' do
      hash_map.set('banana', 'yellow')
      expect(hash_map.buckets[5].head.value).to eq(['banana', 'yellow'])
    end

    it 'when we add key = Pablo and value = {mail: pablo@mail.com} ' do 
      hash_map.set('Pablo', { mail: 'pablo@mail.com' })
      expect(hash_map.buckets[4].head.value).to eq(['Pablo', { mail: 'pablo@mail.com' }])
    end
  end

  it 'if we add key = Pablo and value = {mail: pablo@mail.com} ' do
    hash_map.set("Pablo", {mail: 'pablo@mail.com'})
    expect(hash_map.buckets[4].head.value[1]).to eq({mail: 'pablo@mail.com'})
  end

  context '#get(key)' do
    it 'returns the value that is assigned to this key' do
      hash_map.set('Rama', 'green')
      hash_map.get('Rama')
      expect(hash_map.buckets[3].head.value[1]).to eq('green')
    end

    it 'if the key is not found in the hash' do
      expect(hash_map.get('Kim')).to be(nil)
    end
  end

  context '#has?(key)' do 
    it 'if the key is found in the hash' do
      hash_map.set('Rama', 'green')
      expect(hash_map.has?('Rama')).to be(true)
    end

    it 'if the key is not found in the hash' do
      expect(hash_map.has?('Beto')).to be(false)
    end
  end

  context '#remove(key)' do
    it 'when the key to be deleted is not found' do
      expect(hash_map.remove('Lola')).to be(nil)
    end

    it 'when the key to be deleted is in the hash' do
      hash_map.set('apple', 'red')
      expect(hash_map.remove('apple')).to be('apple')
    end
  end

  context '#length' do 
    it 'when the hash map is empty' do
      expect(hash_map.length).to be(0)
    end

    it 'when the hash map has 2 elements' do
      hash_map.set('banana', 'yellow')
      hash_map.set('apple', 'red')
      hash_map.set('watermelon', 'green')

      expect(hash_map.length).to be(3)
    end
  end

  context '#clear' do
    xit 'When the hash map has elements, remove all of them.' do

    end
  end

  context '#keys' do
    xit 'returns an Array containing the [keys, ...]' do

    end
  end

  context '#values' do
    xit 'returns an Array containing the [values, ...]' do

    end
  end

  context '#entries' do
    xit 'returns an Array containing the [[keys, values], ...]' do

    end
  end
end
