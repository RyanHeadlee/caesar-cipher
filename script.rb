def caesar_cipher(string, shift = 0)
  shift = 0 if shift > 25
  code_array = string.codepoints.map do |code|
    next code if skip?(code)
    if code.between?(65, 90)
      next upcase_shift(code, shift)
    elsif code.between?(97, 122)
      next downcase_shift(code, shift)
    elsif code.between?(49, 57)
      number_shift(code, shift)
    end
  end
  code_array.map { |code| code = code.chr }.join("")
end

def upcase_shift(code, shift)
  if code + shift > 90
    code = (code + shift) - (90 - 64)
  elsif code + shift < 65
    code = (code + shift) + (90 - 64)
  else
    code += shift
  end
end

def downcase_shift(code, shift)
  if code + shift > 122
    code = (code + shift) - (122 - 96)
  elsif code + shift < 97
    code = (code + shift) + (122 - 96)
  else
    code += shift
  end
end

def number_shift(code, shift)
  if code + shift > 57
    code = (code + shift) - (57 - 48)
  elsif code + shift < 49
    code = (code + shift) + (57 - 48)
  else
    code += shift
  end
end

def skip?(code)
  if code.between?(0, 48) || code.between?(58, 64) ||
     code.between?(91, 96) || code > 122
    true
  else
    false
  end
end

def prompt(string)
  puts string
  gets.chomp
end

p caesar_cipher(prompt("Enter your phrase: ").to_s, prompt("Enter you shift: ").to_i)