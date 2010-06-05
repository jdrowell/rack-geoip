require 'restclient'
require 'yajl'

module Rack::GeoIP
  module Remote
    def locate(ip)
      client = RestClient::Resource.new(@uri)
      json = client[ip].get
      Yajl::Parser.parse(json, :symbolize_keys => true)
    end
  end
end   
