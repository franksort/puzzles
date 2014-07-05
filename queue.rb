'''
Taken from Interview Cake, interviewcake.com

Implement a queue with 2 stacks. Your queue should have an enqueue and a
dequeue function and it should be "first in first out" (FIFO).

Optimize for the time cost of m function calls on your queue. These can be
any mix of enqueue and dequeue calls.

Assume you already have a stack implementation and it gives O(1) time
push and pop.
'''

# Okay goal is to create a Queue which is a FIFO data structure.
#
# The assumption is we have a Stack implementation already so we'll make
# a Ruby Array and only use push and pop.
#
# A Stack is a LIFO data structure so the trick will be to create a FIFO DS
# from 2 LIFOs.
#
# Not sure what "optimize for the time costs of m function calls" means.
# Would ask for clarification.
#
# First I'll make a skeleton Queue class.  Done.
# Google: ruby class
#
# My guess is we need to use the 2nd Stack as a temporary storage to order
# the entries in the 1st Stack so they are in a FIFO order.
#
# Questions: Can a Queue have a count function?
#            Can a stack have an empty? function?
#
# If a Stack can't have empty? function, then there's a messier way to
# check if it's empty by popping the stack's last el into a temporary variable
# and checking if its nil.
# 
# It appears my solution is optimized more for dequeues.  All the work is in
# the enqueue.  In the official solution the work is more evenly distributed.
#
# TODO: Implement the official solution.  Learn what "accounting method when 
# figuring out time complexity.  Learn the real definition of O(1).  It's not
# how many comparisons are taking place?  In their solution how do 
# 4 push/pops still equal O(1)?
#
class MyQueue
  def initialize
    @stack1 = []
    @stack2 = []
  end

  def enqueue(el)
    while not @stack1.empty?
      @stack2.push(@stack1.pop)
    end

    # @stack1 now empty, push new el on.
    @stack1.push(el)

    while not @stack2.empty?
      @stack1.push(@stack2.pop)
    end
  end

  def dequeue
    if not @stack1.empty?
      return @stack1.pop
    else
      return nil
    end
  end
end

q = MyQueue.new
q.enqueue("I came first.")
q.enqueue("I came second.")
q.enqueue("I came third.")
puts q.dequeue # expect first
puts q.dequeue # expect second
puts q.dequeue # expect third
