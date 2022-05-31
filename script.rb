def caesar_cipher(string, shift, result = "")
  string.each_char do |char|
    base = char.ord < 91 ? 65 : 97
    if char.ord.between?(65 ,90) || char.ord.between?(97, 122)
      rotation = (((char.ord - base) + shift) % 26) + base
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