# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geoblacklight_messaging/version'

Gem::Specification.new do |spec|
  spec.name          = 'geoblacklight_messaging'
  spec.version       = GeoblacklightMessaging::VERSION
  spec.authors       = ["Eliot Jordan"]
  spec.email         = ["eliot.jordan@gmail.com"]

  spec.summary       = %q{RabbitMQ messaging for Geoblacklight.}
  spec.description   = %q{RabbitMQ messaging for Geoblacklight.}
  spec.homepage      = "https://github.com/eliotjordan/geoblacklight-messaging"
  spec.license       = "APACHE2"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'sneakers'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'engine_cart', '~> 1.0', '>= 1.0.1'
  spec.add_development_dependency 'geoblacklight', '~> 1.2'
  spec.add_development_dependency 'rubocop', '~> 0.39'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.4.1'
end
