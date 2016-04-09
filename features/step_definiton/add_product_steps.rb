Given (/^I navigate to the product details page$/) do
  @app.product_details.load
end

When(/^I select to "([^"]*)" label$/) do |option|
  if option == 'personlise'
    @app.product_details.product_purchase.select_personalise_label
  else
    if option == 'nolabel'
      @app.product_details.product_purchase.select_no_personalised_label
    end
  end
end

Then (/^I should see product title item$/) do
  @app.product_details.wait_for_product_header
  expect(@app.product_details).to have_product_title
end

Then(/^I should see price reviews item$/) do
  @app.product_details.wait_for_product_header
  expect(@app.product_details).to have_price_reviews
end
Then(/^I should see product maker item$/) do
  @app.product_details.wait_for_product_header
  expect(@app.product_details).to have_maker
end

Given (/^I fill in delivery fields$/) do
  @app.product_details.product_purchase.fillin_purchase_info
end

When (/^I select to add the item to the basket$/) do
  @app.product_details.product_purchase.add_to_basket
end

Then(/^the item added pop up should appear$/) do
  sleep 2
  expect(@app.product_details).to have_item_added_pop_up
end

When (/^I checkout item$/) do
  @app.product_details.product_purchase.fillin_purchase_info
  @items_in_basket = @app.product_details.header.item_qauntity.text
  @app.product_details.product_purchase.add_to_basket
  sleep 2
  @app.product_details.wait_for_item_added_pop_up
  @app.product_details.item_added_checkout_btn.click
end

Then (/^the basket should be updated$/) do
  @current_items_in_basket = @app.product_details.header.item_qauntity.text
  @current_items_in_basket.should_not eql(@items_in_basket)
end

Given (/^manditory delivery messages are not filled$/) do
  @app.product_details.product_purchase.non_manditory_info
end

Then (/^an error message should be displayed$/) do
  expect(@app.product_details.product_purchase).to have_delivery_error_msg
end