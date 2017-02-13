# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geoblacklight_messaging/version'

Gem::Specification.new do |spec|
  spec.name          = 'geoblacklight_messaging'
  spec.version       = GeoblacklightMessaging::VERSION
  spec.authors       = ['Eliot Jordan']
  spec.email         = ['eliot.jordan@gmail.com']

  spec.summary       = 'RabbitMQ messaging for Geoblacklight.'
  spec.description   = 'RabbitMQ messaging for Geoblacklight.'
  spec.homepage      = 'https://github.com/eliotjordan/geoblacklight-messaging'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'sneakers'
  spec.add_dependency 'rails'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.5.0'
  spec.add_development_dependency 'solr_wrapper'
  spec.add_development_dependency 'engine_cart', '~> 1.0', '>= 1.0.1'
  spec.add_development_dependency 'geoblacklight', '~> 1.2'
end
