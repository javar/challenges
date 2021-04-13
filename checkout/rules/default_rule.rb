class DefaultRule
  class << self
    def regular_price(price)
      @regular_price = price
      self
    end

    def apply(quantity)
      @regular_price * quantity
    end
  end
end
