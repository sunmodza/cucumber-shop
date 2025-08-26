Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario: Buy multiple products (3 items)
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    And I buy "Bread" with quantity 1
    Then total should be 141.50

Scenario: Cannot buy product with insufficient stock
    When I try to buy "Bread" with quantity 10
    Then I should get an insufficient stock error

Scenario: Buy product with exact stock amount
    When I buy "Bread" with quantity 5
    Then total should be 102.50

Scenario: Cannot buy more after stock is depleted
    When I buy "Bread" with quantity 5
    And I try to buy "Bread" with quantity 1
    Then I should get an insufficient stock error
