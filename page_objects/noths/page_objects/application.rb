module Noths
  module PageObjects
    class Application

      def initialize
        @pages={}
        @sections={}
      end


      def product_details
        @pages[:product_details] ||=Noths::PageObjects::Pages::ProductDetails.new
      end

      def header
        @sections[:header] ||=Noths::PageObjects::Sections::Header.new
      end
      def product_purchase
        @sections[:product_purchase] ||=Noths::PageObjects::Sections::ProductPurchase.new
      end

    end
  end
end
