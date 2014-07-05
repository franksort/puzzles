# Interview Cake, https://www.interviewcake.com/question/reverse-string-in-place
# 
# Write a function to reverse an array of characters in place.
# "In place" means "without creating a new string in memory."

# Answer

# Swap str[0] swap with str[str.length-1]
# Swap str[1] swap with str[str.length-1-1]
# Swap str[2] swap with str[str.length-1-2]
# ..
# Swap str[i] swap with str[str.length-1-i]
# ..
# Continue this while i = 0, i <= str.length / 2 assuming integer
# division where the remainder is dropped


str = "length"
i = 0
j = str.length - 1

(i..j/2).each do |q|
  tmp = str[i]
  str[i] = str[j]
  str[j] = tmp
  i += 1
  j -= 1
end

puts str

# I would stick this in a function and also clean up the variable names.
