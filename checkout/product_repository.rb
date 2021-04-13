class ProductRepository
  class << self
    PRODUCTS =
      [
        { code: 'VOUCHER', name: 'Voucher', price: 5 },
        { code: 'TSHIRT', name: 'T-Shirt', price: 20 },
        { code: 'MUG', name: 'Coffee Mug', price: 7.50 }
      ].freeze

    def exists?(code)
      PRODUCTS.any? { |product| product[:code] == code }
    end

    def price(code)
      product = PRODUCTS.detect { |prod| prod[:code] == code }
      product[:price]
    end
  end
end
