require 'rack'
require 'rack/geoip/base'

module Rack::GeoIP
  autoload :Local,  'rack/geoip/local'
  autoload :Remote, 'rack/geoip/remote'
  
  NOWHERE = {:country_code=>"XX", :country_code3=>"XXX", :country_name=>"XXX", :region=>"0", :city=>"XXX", :latitude=>360.0, :longitude=>360.0}
end

if __FILE__ == $0
  builder = Rack::Builder.new do
    use Rack::CommonLogger
    #use Rack::GeoIP::Base
    use Rack::GeoIP::Base, 'http://sandiego.eyb.com.br/geoip/'
    
    map '/' do
      run Proc.new {|env| [200, {"Content-Type" => "text/html"}, env.inspect]}
    end
  end

  Rack::Handler::Thin.run builder, :Port => 9292
end

