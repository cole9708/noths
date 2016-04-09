module  Noths
  module PageObjects
    module Pages
      class ProductDetails <SitePrism::Page
        set_url "/thegluttonousgardener/product/mini-vineyard"

        element :product_title, '#product_header .product_title'
        element :maker, '.by'
        element :price_reviews, '#price_reviews'
        element :item_added_pop_up, '.fancybox-inner'
        element :item_added_checkout_btn, 'a.button.large.primary.checkout'
        element :product_header, '#product_header'


        section :header, Noths::PageObjects::Sections::Header, '.hat'
        section :product_purchase, Noths::PageObjects::Sections::ProductPurchase, '.product_purchase_module.module'

        def product_details
          ProductDetails.new
        end
      end
    end
  end
end





