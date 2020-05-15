def substrings(str, arr)
  str_arr = str.downcase.split

  substr_hash = Hash.new(0)

  arr.each do |arr_word|
    str_arr.each do |str_word|
      substr_hash[arr_word] += 1 if str_word.include?(arr_word)
    end
  end

  substr_hash
end
