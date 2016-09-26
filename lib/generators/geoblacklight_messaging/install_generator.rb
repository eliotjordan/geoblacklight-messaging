require 'rails/generators'

module GeoblacklightMessaging
  class Install < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install_messaging_config
      config_file_path = 'config/messaging.yml'
      initializer_file_path = 'config/initializers/messaging_config.rb'
      copy_file config_file_path, config_file_path
      copy_file initializer_file_path, initializer_file_path
    end

    def install_sneakers
      config_file_path = 'config/messaging.yml'
      initializer_file_path = 'config/initializers/messaging_config.rb'
      copy_file config_file_path, config_file_path
      copy_file initializer_file_path, initializer_file_path
    end

    def install_rake_tasks
      initializer_file_path = 'config/initializers/sneakers.rb'
      rakefile_path = 'Rakefile'
      copy_file initializer_file_path, initializer_file_path
      inject_into_file rakefile_path, before: /Rails.application.load_tasks/ do
        "require 'sneakers/tasks'\n"
      end
    end
  end
end
