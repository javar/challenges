require_relative '../rules/quantity_rule'
require_relative '../rules/price_rule'
require_relative '../rules/default_rule'
require_relative '../checkout'

describe 'Checkout' do
  context 'when there are known products' do
    let(:pricing_rules) do
      {
        'VOUCHER' => QuantityRule.buying(2).get_one_free,
        'TSHIRT' => PriceRule.buying_equal_or_more_than(3).then_unit_price_is(19),
        'MUG' => DefaultRule
      }
    end

    it 'calculates the total amount to be paid' do
      co = Checkout.new(pricing_rules)
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('MUG')

      price = co.total

      expect(price).to eq(32.50)
    end

    it 'calculates the total amount to be paid with 2-for-1 promotion' do
      co = Checkout.new(pricing_rules)
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('VOUCHER')

      price = co.total

      expect(price).to eq(25.00)
    end

    it 'calculates the total amount to be paid with discount' do
      co = Checkout.new(pricing_rules)
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      co.scan('TSHIRT')
      co.scan('VOUCHER')
      co.scan('TSHIRT')

      price = co.total

      expect(price).to eq(81.00)
    end

    it 'calculates the total amount to be paid with 2-for-1 promotion and discount' do
      co = Checkout.new(pricing_rules)
      co.scan('VOUCHER')
      co.scan('TSHIRT')
      co.scan('VOUCHER')
      co.scan('VOUCHER')
      co.scan('MUG')
      co.scan('TSHIRT')
      co.scan('TSHIRT')

      price = co.total

      expect(price).to eq(74.50)
    end
  end

  context 'when there is an unknown product' do
    it 'omits it' do
      co = Checkout.new({ 'VOUCHER' => QuantityRule.buying(2).get_one_free })
      co.scan('VOUCHER')
      co.scan('VOUCHER')
      co.scan('UNKNOWN_PRODUCT')

      price = co.total

      expect(price).to eq(5.00)
    end
  end

  context 'when there is not rule' do
    it 'raise an exception' do
      expect { Checkout.new({}) }.to raise_error(Checkout::PricingRuleNotProvided)
    end
  end
end
