require 'simplecov'

if ENV['CI']
  require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

if ENV['COVERAGE'] || ENV['CI']
  SimpleCov.start('rails') do
    add_filter '/spec'
    add_filter '/.internal_test_app'
    add_filter '/lib/generators'
  end
end

require 'engine_cart'
EngineCart.load_application!
require 'rspec/rails'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'geoblacklight_messaging'
