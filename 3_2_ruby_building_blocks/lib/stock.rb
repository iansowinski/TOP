def best_price prices_array
  buy_day = 0
  sell_day = 0
  difference = 0
  prices_array.each_with_index do |price_buy, index_buy|
    best_price = price_buy
    prices_array[index_buy+1..-1].each_with_index do |price_sell, index_sell|
    # puts "= = = = = = = = = = = = = = = = = "
    # puts "price_buy: #{price_buy} \nprice_sell: #{price_sell}"
    # puts "prices_array: #{prices_array[index_buy+1..-1]}"
    # puts "index_buy: #{index_buy} \nindex_sell: #{index_sell}"
    # puts "difference: #{difference} \nprice_sell: #{price_sell} / price_buy: #{price_buy}"
      if price_sell - price_buy > difference
        # puts "* * * *"
        difference = price_sell - price_buy
        buy_day = index_buy
        sell_day = index_sell+index_buy+1
      end
    end
  end
  return "Best day to buy: #{buy_day}\nBest day to sell: #{sell_day}"
end

puts best_price([17, 3, 6, 9, 15, 8, 6, 1, 10])
