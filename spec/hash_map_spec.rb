# frozen_string_literal: true

require 'rspec'
require './lib/chaining'
require './lib/complementary_methods'
require './lib/hash_map'

RSpec.describe HashMap do
  subject { HashMap.new }
  let(:linked_list) { NodeLinkedList::LinkedList.new }

  context 'When creating an object of the HashMap class' do
    it 'If the capacity is 16' do
      expect(subject.buckets.size).to eq(16)
    end

    it 'Be an instance of Array' do
      expect(subject.buckets).to be_an_instance_of(Array)
    end
  end

  context '#hash(key)' do
    it 'When key = Rama the returned number must be 3' do
      expect(subject.hash('Rama')).to eq(3)
    end

    it 'When key = Albert the returned number must be 0' do
      expect(subject.hash('Albert')).to eq(0)
    end
  end

  context '#set(key, value)' do
    it 'when we add key = banana and value = yellow' do
      subject.set('banana', 'yellow')
      expect(subject.buckets[5].head.value).to eq(%w[banana yellow])
    end

    it 'when we add key = Pablo and value = {mail: pablo@mail.com} ' do
      subject.set('Pablo', { mail: 'pablo@mail.com' })
      expect(subject.buckets[4].head.value).to eq(['Pablo', { mail: 'pablo@mail.com' }])
    end
  end

  it 'if we add key = Pablo and value = {mail: pablo@mail.com} ' do
    subject.set('Pablo', { mail: 'pablo@mail.com' })
    expect(subject.buckets[4].head.value[1]).to eq({ mail: 'pablo@mail.com' })
  end

  context '#get(key)' do
    it 'returns the value that is assigned to this key' do
      subject.set('Rama', 'green')
      subject.get('Rama')
      expect(subject.buckets[3].head.value[1]).to eq('green')
    end

    it 'if the key is not found in the hash' do
      expect(subject.get('Kim')).to be(nil)
    end
  end

  context '#has?(key)' do
    it 'if the key is found in the hash' do
      subject.set('Rama', 'green')
      expect(subject.has?('Rama')).to be(true)
    end

    it 'if the key is not found in the hash' do
      expect(subject.has?('Beto')).to be(false)
    end
  end

  context '#remove(key)' do
    it 'when the key to be deleted is not found' do
      expect(subject.remove('Lola')).to be(nil)
    end

    it 'when the key to be deleted is in the hash' do
      subject.set('apple', 'red')
      expect(subject.remove('apple')).to be('apple')
    end
  end

  context '#length' do
    it 'when the hash map is empty' do
      expect(subject.length).to be(0)
    end

    it 'when the hash map has 2 elements' do
      subject.set('banana', 'yellow')
      subject.set('apple', 'red')
      subject.set('watermelon', 'green')

      expect(subject.length).to be(3)
    end
  end

  context '#clear' do
    it 'When the hash map has elements' do
      subject.set('bird', 'blue')
      expect(subject.has?('bird')).to be(true)
    end

    it 'remove all of them.' do
      subject.clear
      expect(subject.is_empty?).to be(true)
    end
  end

  context '#keys' do
    it 'returns an Array containing the [keys, ...]' do
      subject.set('banana', 'yellow')
      subject.set('apple', 'red')
      subject.set('bird', 'blue')
      expect(subject.keys.sort).to eq(%w[banana apple bird].sort)
    end
  end

  context '#values' do
    it 'returns an Array containing the [values, ...]' do
      subject.set('banana', 'yellow')
      subject.set('apple', 'red')
      subject.set('bird', 'blue')
      expect(subject.values.sort).to eq(%w[yellow red blue].sort)
    end
  end

  context '#entries' do
    it 'returns an Array containing the [[keys, values],...]' do
      subject.set('banana', 'yellow')
      subject.set('apple', 'red')
      subject.set('bird', 'blue')
      expect(subject.entries.sort).to eq([['banana', 'yellow'], ['apple', 'red'], ['bird', 'blue']].sort)
    end
  end
end
