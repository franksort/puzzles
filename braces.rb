# You're working with an intern that keeps coming to you with JavaScript code
# that won't run because the braces, brackets, and parentheses are off. To save
# you both some time, you decide to write a braces/brackets/parentheses
# validator.
#
# Let's say:
#  '(', '{', '[' are called "openers."
#  ')', '}', ']' are called "closers."
#  
# Write an efficient function that tells us whether or not an input string's
# openers and closers are properly nested.
#
# Examples:
#  "{ [ ] ( ) }" should return true
#  "{ [ ( ] ) }" should return false
#  "{ [ }" should return false

# Answer

# Helper function that finds a matching opener bracket when supplied
# with a closer.
def matching_bracket(opener)
  case opener
  when '{'
    return '}'
  when '['
    return ']'
  when '('
    return ')'
  end
end


def validator(str)
  openers = ['{', '[', '(']
  closers = ['}', ']', ')']
  brackets = []

  for i in 0..str.length do
    character = str[i]

    if openers.include?(character)
      brackets << character
    end

    # What closer are we looking for?  Let's check the last bracket
    # then find it's matching opener.
    # if str[i] == matching_bracket(brackets.last)
    #  brackets.pop
    #end

    if closers.include?(character)
      if character == matching_bracket(brackets.last)
        brackets.pop
      else
        # Improve best case time complexity by returning false immediately
        # on an invalid bracket.
        return false
      end
    end
  end

  if brackets.length == 0
    return true
  else
    return false
  end
end

inputs = []
inputs << "{ [ ] ( ) }" # should return true
inputs << "{ [ ( ] ) }" # should return false
inputs << "{ [ }"       # should return false
inputs << "{ [ ( ] ) }" # should return false

inputs.each do |input|
  if validator(input)
    puts 'Valid.'
  else
    puts 'Invalid.'
  end
end

# Instinct tells me this is a recursive problem and we should use a stack.

# First write this for one type of bracket, then expand to include all types.
'''
for i in 0..str.length do
  if str[i] is an opener
    brackets << str[i]
  end

  if str[i] is a closer
    brackets.pop
  end
end

if brackets.length == 0 then true
'''

# In order to expand our validator to detect all three types of brackets,
# we'll write a function, input is a type of open bracket, output is a matching
# closing bracket.
# Google: ruby case statements


# One problem.  Our algorithm runs in O(n) but we can reduce it's shortest
# possible runtime by returning false immediately when a closing bracket is
# detected where it can't belong.  Ex. { )

# Another problem.  We seem to be repeatedly defining our brackets.  Is there
# a data structure that will allow us to map an opener to a closer and vice-
# versa as well as act as an array?
