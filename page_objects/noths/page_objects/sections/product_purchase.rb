module Noths
  module PageObjects
    module Sections
      class ProductPurchase< SitePrism::Section

        element :gift_message, 'input[name="line_item[options_attributes][1][custom_value]"]'
        element :desired_delivery_date, 'input[name="line_item[options_attributes][2][custom_value]"]'
        element :delivery_instructions, 'input[name="line_item[options_attributes][3][custom_value]"]'
        element :personal_label_details, 'input[name="line_item[options_attributes][5][custom_value]"]'
        element :select_currency, 'select_ product_select_box currency_GBP required invalid'
        element :add_to_cart, "input#add_to_cart"
        element :delivery_error_msg, '.error.inline-errors.last'

        def select_personalise_label
          within 'select#line_item_options_attributes_4_product_option_value_id_currency_GBP' do
            find("option[value='3675643']").click
          end
        end

        def select_no_personalised_label
          within 'select#line_item_options_attributes_4_product_option_value_id_currency_GBP' do
            find("option[value='3675644']").click
          end
        end

        def select_bottle_of_wine
          within 'select#line_item_options_attributes_6_product_option_value_id_currency_GBP' do
            find("option[value='609159']").click
          end
        end

        def select_belgium_choc
          within 'select#line_item_options_attributes_6_product_option_value_id_currency_GBP' do
            find("option[value='3322112']").click
          end
        end


        def fillin_purchase_info
          gift_message.set 'this is a gift from chris'
          desired_delivery_date.set 'please deliver on monday'
          wait_for_delivery_instructions
          delivery_instructions.set 'please leave on porch'
          select_personalise_label
          personal_label_details.set 'this is for my special one'
          select_bottle_of_wine
        end

        def add_to_basket
          add_to_cart.click
        end

        def non_manditory_info
          gift_message.set 'this is a gift from chris'

          wait_for_delivery_instructions
          delivery_instructions.set 'please leave on porch'
          select_no_personalised_label
          select_belgium_choc
        end


        section :product_purchase, Noths::PageObjects::Sections::ProductPurchase
      end
    end
  end
end
