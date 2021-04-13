class PriceRule
  class << self
    def buying_equal_or_more_than(quantity)
      @items = quantity
      self
    end

    def then_unit_price_is(price)
      @discount_price = price
      self
    end

    def regular_price(price)
      @regular_price = price
      self
    end

    def apply(quantity)
      return @discount_price * quantity if quantity >= @items

      @regular_price * quantity
    end
  end
end
