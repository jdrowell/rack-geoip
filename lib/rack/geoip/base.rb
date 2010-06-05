module Rack::GeoIP
  class Base
    def initialize(app, opts={})
      @app = app
      if @uri = opts[:uri]
        extend Rack::GeoIP::Remote
      else
        @db = opts[:db] || 'GeoLiteCity.dat'
        extend Rack::GeoIP::Local
      end
    end
   
    def call(env)
      location = locate(env['REMOTE_ADDR'])
      #location = locate('200.246.224.10')
      env['GEOIP_COUNTRY_CODE'] = location[:country_code3]
      env['GEOIP_COUNTRY'] = location[:country_name]
      env['GEOIP_REGION'] = location[:region]
      env['GEOIP_CITY'] = location[:city]
      env['GEOIP_LATITUDE'] = location[:latitude]
      env['GEOIP_LONGITUDE'] = location[:longitude]

      status, headers, response = @app.call(env)
      #headers['Content-type'] = 'text/html; charset=utf-8'
      #puts env.inspect
      [status, headers, response]
    end
  end
end

