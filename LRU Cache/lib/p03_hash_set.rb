require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    unless include?(num)
      self[num].push(num)
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def include?(key)
    num = key.hash
    self[num].include?(num)
  end

  def remove(key)
    num = key.hash
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    nums_to_dist = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    nums_to_dist.each do |num|
      insert(num)
    end
  end
end
