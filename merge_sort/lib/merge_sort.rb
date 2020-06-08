require_relative 'merge.rb'

def merge_sort(arr)
  return arr if arr.length < 2

  arr_left = arr[0..(arr.length / 2 - 1)]
    
  arr_right = arr[(arr.length / 2)..-1]

  merge(merge_sort(arr_left), merge_sort(arr_right))
end
