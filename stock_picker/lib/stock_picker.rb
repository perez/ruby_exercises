def stock_picker(stock_prices)
  result = stock_prices.dup

  buy_day = result.min

  sell_day = result.max

  loop do
    if result.last == result.min
      result.delete(buy_day)

      buy_day = result.min
    elsif result.first == result.max
      result.delete(sell_day)

      sell_day = result.max
    elsif result.index(buy_day) > result.index(sell_day)
      result.delete(buy_day)
  
      buy_day = result.min
    else
      break
    end
  end
  
  [stock_prices.index(buy_day), stock_prices.index(sell_day)]
end
