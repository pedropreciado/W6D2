require 'byebug'


class Array
  def my_each(&block)
    i = 0

    while i < self.length
      block.call(self[i])
      i += 1

    end

    self
  end

  def my_select(&test_block)
    result = []
    self.my_each do |el|
      if test_block.call(el)
        result << el
      end
    end
    result
  end

  def my_reject(&block)
    result = []
    self.my_each do |el|
      unless block.call(el)
        result << el
      end
    end

    result
  end

  def my_any?(&block)
    self.my_each do |el|
      if block.call(el)
        return true
      end
    end

    false
  end

  def my_all?(&block)
    self.my_each do |el|
      if !block.call(el)
        return false
      end
    end
    true
  end

  def my_flatten(result = [])
    self.each do |ele|
      if ele.class == Array
        ele.my_flatten(result)
      else
        result << ele
      end
    end
    result
  end


  def my_zip(*args)
    result = []
    i = 0
    while i < self.length
      sub_arr = []
      sub_arr << self[i]
      args.each do |el|
        sub_arr << el[i]
      end
      i += 1
      result << sub_arr
    end
    result
  end

  def my_rotate(shift = 1)
    real_shift = shift % self.length
    if real_shift > 0
      real_shift.times do
        self << self.shift
      end
    else
      real_shift.abs.times do
        self.unshift(self.pop)
      end
    end

    self
  end

  def my_join( separator = "" )
    str = ""
    self.each_with_index do | ch, idx |
      if idx != self.length - 1
        str = str + ch + separator
      else
        str = str + ch
      end
    end
    str
  end

  def my_reverse
    result = []
    dup = self.dup
    until dup.empty?
      result << dup.pop
    end
    result
  end

  def bubble_sort!
    swapped = true

    while swapped
      self[0...-1].each_index do |i|
        swapped = false
        if self[i] > self[i+1]
          self[i], self[i+1] = self[i+1], self[i]
          swapped = true
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    copy = self.dup
    prc ||= Proc.new { |x, y| x <=> y }

    swapped = true
    while swapped
      copy[0...-1].each_index do |i|
        swapped = false
        if prc.call(copy[i], copy[i+1]) == 1
          swapped = true
          copy[i], copy[i+1] = copy[i+1], copy[i]
        end
      end
    end
    copy
  end

end


def factors(num)
  (1..num).select {|n| num % n == 0 }
end
