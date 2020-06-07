def merge(arr1, arr2)
  sorted = []
  num1 = 0
  num2 = 0

  until sorted.length == (arr1.length + arr2.length)
    if num1 == arr1.length
      sorted << arr2[num2]

      num2 += 1
    elsif num2 == arr2.length
      sorted << arr1[num1]
      
      num1 += 1
    elsif arr1[num1] < arr2[num2]
      sorted << arr1[num1]

      num1 += 1
    elsif arr1[num1] > arr2[num2]
      sorted << arr2[num2]

      num2 += 1
    else
      sorted << arr1[num1]

      num1 += 1
    end
  end

  sorted
end
