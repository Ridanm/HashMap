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
      expect{subject.index_error(-1)}.to raise_error(IndexError)
    end

    it 'when the index is greater than its current cpacity' do
      expect{subject.index_error(10)}.to raise_error(IndexError)
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
    it 'if the load factor is not exceeded' do
      expect(subject.growth).to be(false)
    end

    it 'return a new HasSet with double of capacity' do
      expect(subject.re_hash.buckets.size).to eq(16)
    end 
  end

  context '#length' do
    it 'when have more than one key' do
      subject.set('Roma')
      subject.set('Albert')
      expect(subject.length).to eq(2)
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
end

