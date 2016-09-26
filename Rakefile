begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'engine_cart/rake_task'
require 'sneakers/tasks'
require 'solr_wrapper'
require 'rubocop/rake_task'

desc 'Run style checker'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.requires << 'rubocop-rspec'
  task.fail_on_error = true
end

desc 'Run test suite and style checker'
task spec: :rubocop do
  RSpec::Core::RakeTask.new(:spec)
end

desc 'Run test suite'
task ci: ['geoblacklight:generate'] do
  SolrWrapper.wrap do |solr|
    conf_dir = File.join(File.expand_path('.', File.dirname(__FILE__)), '.internal_test_app', 'solr', 'conf')
    solr.with_collection(name: 'blacklight-core', dir: conf_dir) do
      Rake::Task['geoblacklight:generate'].invoke
      Rake::Task['geoblacklight:coverage'].invoke
    end
  end
end

namespace :geoblacklight do
  desc 'Run tests with coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec'].invoke
  end

  desc 'Create the test rails app'
  task generate: ['engine_cart:generate'] do
  end
end

task default: [:ci]
