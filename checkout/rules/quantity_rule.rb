class QuantityRule
  class << self
    def buying(quantity)
      @items = quantity
      self
    end

    def get_one_free
      self
    end

    def regular_price(price)
      @regular_price = price
      self
    end

    def apply(quantity)
      ((quantity / @items) + (quantity % @items)) * @regular_price
    end
  end
end
