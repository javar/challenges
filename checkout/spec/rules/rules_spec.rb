require_relative '../../rules/quantity_rule'
require_relative '../../rules/price_rule'
require_relative '../../rules/default_rule'

describe 'Rules' do
  describe 'QuantityRule' do
    describe '2-for-1 promotion' do
      let(:rule) { QuantityRule.buying(2).get_one_free.regular_price(5) }

      it 'pay for one item when buying one' do
        total = rule.apply(1)

        expect(total).to eq(5)
      end

      it 'pay for one item when buying two' do
        total = rule.apply(2)

        expect(total).to eq(5)
      end

      it 'pay for two items when buying three' do
        total = rule.apply(3)

        expect(total).to eq(10)
      end

      it 'pay for two items when buying four' do
        total = rule.apply(4)

        expect(total).to eq(10)
      end
    end
  end

  describe 'PriceRule' do
    describe 'discounts on bulk purchases' do
      let(:rule) { PriceRule.buying_equal_or_more_than(3).then_unit_price_is(19).regular_price(20) }

      it 'buy one item and pay regular price' do
        total = rule.apply(1)

        expect(total).to eq(20)
      end

      it 'buy three items and pay discounted price' do
        total = rule.apply(3)

        expect(total).to eq(57)
      end

      it 'buy four items and pay discounted price' do
        total = rule.apply(4)

        expect(total).to eq(76)
      end
    end
  end

  describe 'DefaultRule' do
    it 'calculates the total amount to be paid' do
      rule = DefaultRule.regular_price(7.50)

      total = rule.apply(2)

      expect(total).to eq(15)
    end
  end
end
