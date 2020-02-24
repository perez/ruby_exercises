def bubble_sort(array)
  return 'Empty array' if array.empty?

  n = array.length - 1

  n.times do
    i = 0

    until i == n
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
      end

      i += 1
    end
  end
  
  array
end
