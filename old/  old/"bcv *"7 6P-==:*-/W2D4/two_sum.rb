def two_sum_brute?(arr,target_sum)
  arr.each_index do |i|
    arr.each_index do |j|
      next if i == j
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def two_sum_sort(arr, target_sum)
  arr.sort!
  until arr.length == 1
    case arr.first + arr.last <=> target_sum
    when -1
      arr.shift
    when 0
      return true
    when 1
      arr.pop
    end
  end
  false
end
