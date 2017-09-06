def my_min(list)
  list.each do |l|
    i = 0
    smallest = true
    while i < list.length
      smallest = false if list[i] < l
      i+=1
    end
    return l if smallest
  end
end

def my_min_iter(list)
  i = list[0]
  list.each do |l|
    i = l if l < i
  end
  i
end

def my_max_iter(list)

  i = list[0].reduce(:+)
  list.each do |l|
    i = l.reduce(:+) if l.reduce(:+ ) > i
  end
  i
end

def largest_continuous_subsum(list)
  all_subs = []

  (0..list.length - 1).each do |front_index|
    (front_index..list.length-1).each do |ind|
      all_subs << list[front_index..ind]
    end
  end


  my_max_iter(all_subs)
end

def largest_continuous_subsum2(list)
  arr = []
  var = list.max
  list.each do |el|
    arr.each do |el2|
      el2 << el
      var = el2.reduce(:+) if el2.reduce(:+) > var
    end
    arr << [el]
    var = el if el > var
  end
  var
end

p largest_continuous_subsum2([1,2,4,-1])
