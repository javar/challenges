# Checkout

Our company wants to runs a physical store which sells Products.

Our list of products looks like this:

``` 
Code         | Name                |  Price
-------------------------------------------------
VOUCHER      | Voucher             |   5.00€
TSHIRT       | T-Shirt             |  20.00€
MUG          | Coffee Mug          |   7.50€
```

Various departments have insisted on the following discounts:

 * The marketing department believes in 2-for-1 promotions (buy two of the same product, get one free), and would like to have a 2-for-1 special on `VOUCHER` items.

 * The CFO insists that the best way to increase sales is with discounts on bulk purchases (buying x or more of a product, the price of that product is reduced), and demands that if you buy 3 or more `TSHIRT` items, the price per unit should be 19.00€.

Our's checkout process allows for items to be scanned in any order, and should return the total amount to be paid.

Examples:

    Items: VOUCHER, TSHIRT, MUG
    Total: 32.50€

    Items: VOUCHER, TSHIRT, VOUCHER
    Total: 25.00€

    Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
    Total: 81.00€

    Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
    Total: 74.50€


## Solution

- Initially when calculating the total to be paid, I was applying the rules to each item scanned. But I decided to accumulate the scanned items and only apply the rules when calculating the total to be paid, this in order to have a better performance to the solution

- I have implemented the given interface. To use princing_rules, there are three kind of Rules ```QuantityRule```, ```PriceRule``` and ```DefaultRule```.
It's necessary to pass the product followed by the wanted rule for that product

Example:

```ruby
pricing_rules = 
{
  'VOUCHER' => QuantityRule.buying(2).get_one_free,
  'TSHIRT' => PriceRule.buying_equal_or_more_than(3).then_unit_price_is(19),
  'MUG' => DefaultRule
}
```
