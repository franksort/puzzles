# QUESTION
# Taken from Interview Cake, interviewcake.com
#
# Writing interview questions hasn't made me rich. Maybe trading Apple
# stocks will.
#
# I have an array stockPricesYesterday where:
#
# * The indices are the time, as a number of minutes past trade opening time,
#   which was 9:30am local time.
# * The values are the price of Apple stock at that time, in dollars.
#   For example, the stock cost $500 at 10:30am, so
#   stockPricesYesterday[60] = 500.
#
# Write an efficient algorithm for computing the best profit I could have made
# from 1 purchase and 1 sale of 1 Apple stock yesterday. For this problem, we
# won't allow "shorting"—you must buy before you sell.

# ANSWER
#
# Since we know the market opens at 9:30am, what time does the market close?
#
# Google: "what time does stock market close?"
# Result: 4:00pm
# 
# How long is the stock market open?
# 9:30am to 4:00pm is 6h30m
# 6 * 60m = 360m
# 360m + 30m = 390m
# The stock market is open for 390m.
#
# Our prices array will have 390 elements, a price for each minute the market
# is open.
#
# Is this a 0-indexed array or does the array start at 1?
# According to the example, at 10:30am the array index is 60.
# prices[0] = price from 9:30:00am to 9:30:59am
# prices[1] = price from 9:31:00am to 9:31:59am
# prices[2] = price from 9:32:00am to 9:32:59am
# ...
# prices[59] = price from 10:29:00am to 10:29:59am
# prices[60] = price from 10:30:00am to 10:30:59am
# ...
# prices[389] = price from 4:29:00pm to 4:29:59pm
# Yes the array is 0-indexed.  Its first index is 0, last index is 389.

# Create an array for yesterday's prices with 390 elements.
#prices = Array.new(390)
prices = Array.new(10)

# Fill array with random prices, in the range of 450 to 550 to be somewhat
# realistic.
prices.each_with_index do |price, index|
  prices[index] = Random.new.rand(450..550)
  puts "Minute: " + index.to_s + ", Price: " + prices[index].to_s
end

#prices.each {|price| puts price}

# Takes an array of prices, returns index of largest price
'''
def find_maximum_sell_price(prices_ary, 
end

trades_aryArray
index [buy_minute, sell_minute, profit]

Trade object
  buy_minute
  sell_minute
  profit
'''
# Returns index of most profitable trade.
'''
def find_most_profitable_trade(trades_ary)
  max_profit = 0
  max_profit_index = nil

  trades_ary.each_with_index do |trade, index|
    if trade.profit > max_profit
      max_profit = trade.profit
      max_profit_index = index
    end
  end

  return max_profit_index
end
'''

# Visit each element in the array and compare it to the elements whose
# indices occur after it.
# Time Complexity O(n^2) but not quite that...it's something like n*n!
current_minute = 0
last_minute = prices.length-1

best_buy_minute = 0
best_sell_minute = 0
best_profit = 0

for m1 in current_minute..last_minute do
  p1 = prices[m1]
  for m2 in m1+1..last_minute do
    p2 = prices[m2]
    profit = p2 - p1
    if profit > 0 and profit > best_profit
      best_buy_minute = m1
      best_sell_minute = m2
      best_profit = profit
    end
  end
end

if best_profit == 0
  puts "NO profit here"
end

puts "Best Buy Minute: " + best_buy_minute.to_s
puts "Best Sell Minute: " + best_sell_minute.to_s
puts "Best Profit: " + best_profit.to_s


buy_price = prices[0]
sell_price = prices[0]
profit = 0

# Time Complexity O(n)
for time in 0..(prices.length-1) do
  current_price = prices[time]
  puts current_price

  if current_price < buy_price
    buy_price = current_price
  end

  current_profit = current_price - buy_price
  if current_profit > profit
    profit = current_profit
  end

end

puts "Profit: " + profit.to_s




# Example Trace

# prices = [100, 300, 50, 10, 30, 200]

'''
min_price = stockPricesYesterday[0]
max_profit = 0
for time in range(len(stockPricesYesterday)):
    current_price = stockPricesYesterday[time]
    min_price = min(min_price, current_price)
    max_profit = max(max_profit, current_price - min_price)
return max_profit

# initial:

min_price = 100
max_profit = 0

# time = 0
for time in 0..5 do
  current_price = 100
  min_price = 100
  max_profit = 0
end

# time = 1
for time in 0..5 do
  current_price = 300
  min_price = 100
  max_profit = 200
end

# time = 2
current_price = 50
min_price = 50
max_profit = 200

# time = 3
current_price = 10
min_price = 10
max_profit = 200

# time = 4
current_price = 30
min_price = 10
max_profit = 200

# time = 5
current_price = 200
min_price = 10
max_profit = 200

# final
max_profit = 200

As we traverse the array of prices, we look at the current price and ask
if current price minus the lowest price occuring to the left is the current
maximum profit.
'''
