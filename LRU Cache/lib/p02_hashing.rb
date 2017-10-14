class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    # [1,2] --> 8938981
    # 8938981 --> [1,2]
    sum = 0
    # num = 123 if empty?

    nested_count = 0
    nested_num = 123456789

     if self.empty?

      nested_count += 1
    end
    self.each_with_index do |num, idx|

      sum += (num * idx) if num
      # num = 123456789 if num == []
      #[]
      #[[]]
    end
    sum
  end
end

class String
  def hash
    sum = 0
    self.each_char.with_index do |char, idx|
      sum += (char.ord * idx) if char
    end
    sum
  end
end

class Symbol
  def hash
    sum = 0
    self.to_s.chars.each do |char|
      sum += char.ord * 2 if char
    end
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    self.each do |k, v|
      sum += k.to_s.ord * v.ord if v
    end
    sum
  end
end
