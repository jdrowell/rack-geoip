require 'geoip_city'

module Rack::GeoIP
  module Local
    def force_utf8(s)
      s.force_encoding('ISO-8859-1').encode('UTF-8')
    end
    
    def locate(ip)
      geodb = GeoIPCity::Database.new(@db, :filesystem)
      if location = geodb.look_up(ip)
        [:country_code, :country_code3, :country_name, :region, :city].each do |s|
          location[s] = force_utf8(location[s])
        end
      else
        location = Rack::GeoIP::NOWHERE
      end
      location
    end
  end
end
