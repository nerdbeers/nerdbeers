require 'printful_api'

class PrintfulService

    def self.get_products()
    	printful_config.PrintfulAPI::Product.all
    end

    def self.get_shipping_info(zip, quantity, product_id)
    	printful_config.PrintfulAPI::ShippingRate.list( { zip: zip}, [{quantity: quantity, variant_id: PrintfulAPI::Product.get(product_id).variants.first.id}], 'USD')
    end

#### Private Methods
private
  def self.printful_config
    # memoize this connection
    @client ||= PrintfulAPI.api_key = ENV['PRINTFUL_API_KEY']
  end
  private_class_method :printful_config

end


# https://github.com/Groundswell/printful-ruby