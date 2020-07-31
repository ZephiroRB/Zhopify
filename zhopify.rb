require 'feedjira'

module Zhopify
  class Feed
    USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.51.22 (KHTML, like Gecko) Version/5.1.1 Safari/534.51.22'

    def initialize(domain)

      @domain = domain
      
      @base_uri = "#@domain/collections/all.atom"

    end

    def retrieve_products

      Feedjira::Feed.add_common_feed_entry_element('s:price', :as => :price2)

      Feedjira::Feed.add_common_feed_entry_element('s:price', :value => :currency, :as => :currency)

      xml = HTTParty.get(@base_uri, {
        headers: {"User-Agent" => USER_AGENT}}).body

      Feedjira.parse(xml)
    end

  end
end