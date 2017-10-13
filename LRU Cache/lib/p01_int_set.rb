class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
    @max = max
  end

  def insert(num)
    validate!(num)
    @store[num] = true if !self.include?(num) #&& is_valid(num)
  end

  def remove(num)
    validate!(num)
    @store[num] = false if @store[num]
  end

  def include?(num)
    validate!(num)
    @store[num] == true ? true : false
  end

  private

  def is_valid?(num)
    num >= 0 && num < @max
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if include?(num)
      raise
    else
      self[num].push(num)
    end
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num].push(num)
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
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
