require 'rails/generators'

class TestAppGenerator < Rails::Generators::Base
  source_root "./spec/test_app_templates"

  def add_gems
    gem 'blacklight', '~> 6.3'
    Bundler.with_clean_env do
      run 'bundle install'
    end
  end

  def run_blacklight_generator
    say_status('warning', 'GENERATING BL', :yellow)

    generate 'blacklight:install', '--devise', '-f'
  end

  def run_geoblacklight_generator
    generate 'geoblacklight:install', '--solrwrapper', '-f'
  end

  def install_engine
    generate 'geoblacklight_messaging:install'
  end
end
