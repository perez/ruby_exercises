def bubble_sort(arr)
  return 'Empty array' if arr.empty?

  n = arr.length - 1

  n.times do
    i = 0

    until i == n
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end

      i += 1
    end
  end
  
  arr
end
