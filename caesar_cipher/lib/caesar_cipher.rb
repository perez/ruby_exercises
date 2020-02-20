def caesar_cipher(string, shift_factor)
  return '' if string.empty?

  alphabet = ('a'..'z').to_a

  chars = string.downcase.strip.split('')

  positions = chars.map do |letter|
    char = alphabet.index(letter)

    char.nil? ? letter : (char + shift_factor) % 26
  end

  modified_string = positions.map.with_index do |position, index|
    if position.is_a? String
      position
    else
      string[index].match?(/[A-Z]/) ? alphabet[position].upcase : alphabet[position]
    end
  end

  modified_string.join
end
