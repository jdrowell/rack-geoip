Gem::Specification.new do |s|
  s.name            = "rack-geoip"
  s.version         = "0.1.0"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "a GeoIP middleware for Rack"

  s.description = <<-EOF
Enables rack apps to transparently get access to geographic data
about each request. The GeoIP database can either be local or
provided as a remote JSON webservice.
EOF

  s.files           = Dir['{lib/**/*}'] +
                        %w(COPYING rack-geoip.gemspec README)
  s.bindir          = 'bin'
  s.require_path    = 'lib'
  s.has_rdoc        = false

  s.author          = 'John D. Rowell'
  s.email           = 'me@jdrowell.com'

  s.add_development_dependency 'thin'
end
