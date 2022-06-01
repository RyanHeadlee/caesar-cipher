def caesar_cipher(string, shift, result = "")
  string.each_char do |char|
    base = char.ord.between?(65, 90) ? 65 : char.ord.between?(97, 122) ? 97 : 49
    if char.ord.between?(65 ,90) || char.ord.between?(97, 122)
      rotation = (((char.ord - base) + shift) % 26) + base
      result += rotation.chr
    elsif char.ord.between?(49, 57)
      rotation = (((char.ord - base) + shift) % 9) + base
      result += rotation.chr
    else
      result += char
    end
  end
  result
end

def prompt(string)
  puts string
  gets.chomp
end

puts caesar_cipher(prompt("Enter your phrase: ").to_s, prompt("Enter you shift: ").to_i)