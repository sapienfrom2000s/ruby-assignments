
def stock_picker(stock_prices)
    dict = {}
    dict[:best_day_pair] = [0,0]
    best_day_pair_profit = 0
    days = stock_prices.length
    last_k_days_length = days-1

    (0...days-1).step do |day|
        last_k_days = stock_prices.last(last_k_days_length)
        maximum = last_k_days.max
        if(maximum - stock_prices[day] > best_day_pair_profit)
            best_day_pair_profit = maximum - stock_prices[day]
            index_of_maximum_day = last_k_days.index(maximum) + day + 1
            dict[:best_day_pair] = [day, index_of_maximum_day]
        end
        last_k_days_length -= 1
    end
    p dict[:best_day_pair]
end

stock_picker([123,23,1,4,3,2,1,33])
