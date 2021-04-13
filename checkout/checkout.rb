require_relative 'product_repository'

class Checkout
  class PricingRuleNotProvided < StandardError; end

  def initialize(pricing_rules)
    @quantity = Hash.new(0)

    raise_pricing_rule_exception if not_contains?(pricing_rules)
    @pricing_rules = pricing_rules
  end

  def scan(product_code)
    @quantity[product_code] += 1 if ProductRepository.exists?(product_code)
  end

  def total
    total_amount = 0

    items.each do |item|
      rule = rule_for(item)
      total_amount += rule.apply(@quantity[item]) if rule
    end

    total_amount
  end

  private

  def items
    @quantity.keys
  end

  def rule_for(item)
    @pricing_rules[item].regular_price(price(item))
  end

  def not_contains?(pricing_rules)
    raise PricingRuleNotProvided.new if pricing_rules.empty?
  end

  def price(item)
    ProductRepository.price(item)
  end
end
