@add_product_to_basket
Feature: As a Customer
  I want to be able to add items to my basket
  So that I can purchase them


  Background:
    Given I navigate to the product details page

  Scenario Outline:
    Then I should see <item> item
  Examples:
    |item|
    |price reviews|
    |product maker|
    |product title|


  Scenario:
    Given I fill in delivery fields
    When I select to add the item to the basket
    Then the item added pop up should appear

  Scenario:
    Given I fill in delivery fields
    When I checkout item
    Then the basket should be updated

  Scenario:
    Given manditory delivery messages are not filled
    When I select to add the item to the basket
    Then an error message should be displayed

