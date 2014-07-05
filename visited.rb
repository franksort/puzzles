require 'pp'

# Interview Cake
# https://www.interviewcake.com/question/compress-url-list

# I'm making a search engine called MillionGazillion™.
# 
# I wrote a crawler that visits web pages, stores a few keywords in a database,
# and follows links to other web pages. I noticed that my crawler was wasting a
# lot of time visiting the same pages over and over, so I made a hash table
# visited where I'm storing URLs I've already visited. Now the crawler only
# visits a URL if it hasn't already been visited.
#
# Thing is, the crawler is running on my old desktop computer in my
# parents' basement (where I totally don't live anymore), and it keeps running
# out of memory because visited is getting so huge.
#
# How can I trim down the amount of space taken up by visited?



# Answer:
#
# Assuming that the visited Hash is storing absolute URLs, you can store rel.
# URLs instead.  When a new URL is being inserted into the Hash, a comparison
# would take place to determine how much of the begginning of the URL is
# indentical to an entry in the Hash.
#
# This would change the structure of the data.  Instead of just storing the
# key and value (URL), the visited Hash would have to be something like
# key1 => [key2 => URL], a Hash of Hashes, where key2 refers to a key1 and 
# allows you to get the beginning portion, which in turn allows you to
# construct the absolute URL.
#
# This would increase the time complexity but lower the storage capacity
# necessary.
#
# Thought...is it possible to store the beginning part of the URL as the 
# Hash key and the value as the remainder?


# Recursive hashes with keys that are one character...

visited = Hash.new

# First, we'll make an array of URLs to play with.
urls = ['http://www.google.com/',
        'http://www.google.com/calendar',
        'http://www.microsoft.com/',
        'https://interviewcake.com/',
        'http://fake.interviewcake.com/']

# Next, we'll iterate through the URLs.
# This is an iterative approach.  It would probably be better as recursive
# function.
urls.each do |url|

  current_node = visited

  # Next we'll iterate through each URL one character at a time.  
  #url.each_char do |character|
  for i in 0..(url.length-1) do 
    character = url[i]

    # Traverse nodes in tree.  At each node, is a Hash.
    # :next is another node.
    # :visisted is boolean, true if it's a complete URL that has been visisted
    if current_node.has_key?(character)
      current_node = current_node[character][:next]
    else
      current_node[character] = { :visisted => false, :next => Hash.new }
      if i == url.length-1
        # Signals that the path leading to this node forms a full URL that
        # has been visisted.
        current_node[character][:visisted] = true
      end
      current_node = current_node[character][:next]
    end

  end


end

# PROBLEM: There needs to be some way to terminate the recursive Hash so that
# http://www.google.com/ and http://www.google.com/calendar are two seperate
# URLs.  Right now, only calendar is being stored.
#
# We could possibly store an Array at each node of the tree where [0] is true
# if the URL is a complete URL that has been visisted, false if otherwise. [1]
# is a Hash node.  This might be negating the effects of reducing storage
# however.  It's probably costly to store that many arrays (one per node).

pp visited

# Next, traverse the Hash tree and reconstruct the URLs in urls Array.

# I realize that using a Hash with :visited and :next keys is counter to the
# goal of less storage.  The solution added a node '*' which signifies
# the end of a URL.  What happens when a URL actually contains a '*' though?

# What is a bloom filter?
