'''
Taken from Interview Cake, interviewcake.com

Write an extended stack class that has a function getLargest() for returning
the largest element in the stack.
'''

# First I'll create a Stack class since Ruby doesn't have one (I don't think).
# This Stack implementation uses an Array as the base Data Structure.

class Stack

  def initialize
    @stack = []
  end

  # TODO: Should we return nil here?  Unsure.
  def push(el)
    @stack.push(el)
  end

  def pop
    return @stack.pop
  end

  def empty?
    return @stack.empty?
  end

  def peek
    return @stack.last
  end

end

# Now we extend the Stack to include a getLargest() function.
# Google: ruby class inheritance
#
# There's a problem here.  The question asks for the "largest element"
# which I assume could by any Object.  Ideally  @largest would be a reference
# to the Object in the Stack and not a copy but I'm not sure how to do that
# in Ruby (if it's even possible.
#
# We do use an Array as the underlying data structure of the Stack class but
# I'm hesistant to reference the index of the Object since that's not in the 
# spirit of "extending a stack."
#
#
class ExtendedStack < Stack

  # Overriding constructor then calling base class's constructor
  def initialize
    super
    @largests = Stack.new
  end

  # Overriding push method then calling base class's push
  def push(el)
    if @largests.empty?
      @largests.push(el)
    elsif el >= @largests.peek # Should this be greater-than-or-equal?
      @largests.push(el)
    end
    super
  end

  def pop
    if self.peek == @largests.peek
      @largests.pop
    end
    super
  end

  def get_largest
    return @largests.peek
  end

end

# Gotcha: What if we push several items in increasing numeric order (e.g. 1,2,3,4...), so that there is a new largest after each push()? What if we then pop() each of these items off, so that there is a new largest after each pop()? Your algorithm shouldn't pay a steep cost in these edge cases.

# So...suppose I create a stack within the extended stack to hold a history
# of the largest elements.  It sounds terribly inefficient.  If it's technically
# possible to instantiate an object of the class that you're extending...then it
# may just be a storage vs processing tradeoff.  A stack of largest elements
# (since there are no pointers in Ruby that I know of) would require (at worst)
# double the space requirements.

stack = ExtendedStack.new
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(4)
puts "Popped: " + stack.pop.to_s
puts stack.get_largest
puts stack.inspect
