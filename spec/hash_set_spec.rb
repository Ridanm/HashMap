# frozen_string_literal: true

require 'rspec'
require './lib/chaining'
require './lib/complementary_methods'
require './lib/hash_map'
require './lib/hash_set'

RSpec.describe HashSet do
  subject { HashSet.new(8, 0.75) }

  context 'when creating an instance' do
    it 'its must belong to the HashSet class' do
      expect(subject).to be_an_instance_of(HashSet)
    end

    it 'of the initial capacity is 8' do
      expect(subject.buckets.size).to eq(8)
    end

    it 'buckets must be an instance of Array' do
      expect(subject.buckets).to be_an_instance_of(Array)
    end
  end

  context '#hash(key)' do
    it 'when key = Rosa the returned number mist be 5' do
      expect(subject.hash('Ross')).to eq(5)
    end

    it 'when key = Albert the returned number must be 0' do
      expect(subject.hash('Albert')).to eq(0)
    end
  end

  context '#index_error' do
    it 'when the index is less than zero' do
      expect { subject.index_error(-1) }.to raise_error(IndexError)
    end

    it 'when the index is greater than its current cpacity' do
      expect { subject.index_error(10) }.to raise_error(IndexError)
    end
  end

  context '#set(key)' do
    it 'when the bucket is empty' do
      subject.set('Rosa')
      expect(subject.buckets[3]).to be_an_instance_of(NodeLinkedList::LinkedList)
    end

    it 'enter the first key to an empty bucket' do
      subject.set('Albert')
      expect(subject.buckets[0].head.value[0]).to be('Albert')
    end
  end

  context '#re_hash' do
    it 'object be_a' do
      expect(subject.re_hash).to be_a(HashSet)
    end

    it 'if the load factor is not exceeded' do
      expect(subject.growth).to be(false)
    end

    it 'return a new HasSet with double of capacity' do
      expect(subject.re_hash.buckets.size).to eq(16)
    end
  end

  context '#get(key)' do
    it 'if the key is found' do
      subject.set('Brian')
      expect(subject.get('Brian')).to eq('Brian')
    end

    it 'if the key is not found' do
      expect(subject.get('Roma')).to be_nil
    end
  end

  context '#has?(key)' do
    it 'if it contains the key' do
      subject.set('Rosa')
      expect(subject.has?('Rosa')).to be true
    end

    it 'if it does not contain the key' do
      expect(subject.has?('cat')).to be false
    end
  end

  context '#remove(key)' do
    before do
      subject.set('aa')
      subject.set('bb')
      subject.set('aba')
    end

    it 'returns the key if found' do
      subject.set('Rosa')
      expect(subject.has?('Rosa')).to be true
      expect(subject.remove('Rosa')).to be 'Rosa'
    end

    it 'when the key is at the beginning' do
      subject.remove('aa')
      expect(subject.buckets[0].head.value).to eq(%w[bb])
    end

    it 'when the key is between the beginning and the end' do
      subject.remove('bb')
      expect(subject.buckets[0].head.next_node.value).to eq(%w[aba])
    end
  end

  context '#length' do
    it 'if the box is empty' do
      expect(subject.length).to eq(0)
    end

    it 'If there are two objects in the box' do
      subject.set('aa')
      subject.set('bb')
      expect(subject.length).to eq(2)
    end
  end

  context '#clear' do
    it 'remove all entries in the hash set' do
      subject.set('Rosa')
      subject.set('apple')
      subject.clear
      expect(subject.buckets.all?(&:nil?)).to be true
    end
  end

  context '#keys' do
    it 'returns an array containing all the keys inside the hash set' do
      subject.set('apple')
      subject.set('orange')
      subject.set('banana')
      expect(subject.keys).to eq(%w[apple banana orange])
    end

    it 'does not include any key' do
      expect(subject.keys).to be_empty
    end
  end

  context '#values' do
    it 'should not respond to the method' do
      expect(subject.values).to be_empty
    end

    it 'when you have the keys in the table' do
      subject.set('Vale')
      subject.set('Lorena')
      subject.set('Leticia')
      expect(subject.entries).to match_array([['Vale'], ['Lorena'], ['Leticia']])
    end
  end
end
