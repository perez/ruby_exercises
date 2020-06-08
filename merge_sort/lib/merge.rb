def merge(arr1, arr2)
  sorted = []

  until arr1.empty? || arr2.empty?
    if arr1.first <= arr2.first
      sorted << arr1.shift
    else
      sorted << arr2.shift
    end
  end

  sorted + arr1 + arr2
end
