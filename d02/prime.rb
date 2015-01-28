prime = 2
count = 1
while count < 26
  x = 2
  while x <= prime
    if prime % x == 0
      break
    end
    x += 1
  end
  if x == prime
    puts prime
    count += 1
  end
  prime += 1
end

# alphabet = ('a'..'z').to_a
# puts alphabet
# numz = alphabet.index('d').to_i + 1
# puts numz
#
# def countr(string, alphabet)
#
#   string.each do |key, value|
#
#
#
#   alphabet.each do |key, letter|
#     numz = alphabet.index(letter).to_i + 1
#   end
#
# end
# countr("dog", alphabet)
