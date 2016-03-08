require 'kitchen'

# Integration Tests - Kitchen
namespace :integration do
  # Determine if Linux
  def linux?(instance)
    instance_name = instance.name
    if instance_name.match(/amazon|centos|rh|ubuntu|suse/)
      true
    else
      false
    end
  end
  # Determine if Windows
  def windows?(instance)
    instance_name = instance.name
    if instance_name.match(/win/)
      true
    else
      false
    end
  end
  namespace :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    @vagrant_kitchen_loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.yml')
    @vagrant_kitchen_config = Kitchen::Config.new(loader: @vagrant_kitchen_loader)

    namespace :base do
      test_suite = 'core_base'
      desc 'Kitchen - Vagrant - Linux & Windows - Base'
      task :all do
        @vagrant_kitchen_config.instances.each do |instance|
          if instance.suite.name == test_suite
            instance.test(:always)
          end
        end
      end
      desc 'Kitchen - Vagrant - Linux - Base'
      task :linux do
        @vagrant_kitchen_config.instances.each do |instance|
          if instance.suite.name == test_suite && linux?(instance)
            instance.test(:always)
          end
        end
      end
      desc 'Kitchen - Vagrant - Windows - Base'
      task :windows do
        @vagrant_kitchen_config.instances.each do |instance|
          if instance.suite.name == test_suite && windows?(@vagrant_kitchen_config)
            instance.test(:always)
          end
        end
      end
    end
    namespace :apache do
      test_suite = 'core_apache'
      desc 'Kitchen - Vagrant - Linux - Apache'
      task :linux do
        config.instances.each do |instance|
          if instance.suite.name == test_suite && linux?(@vagrant_kitchen_config)
            instance.test(:always)
          end
        end
      end
    end
  end

  namespace :ec2 do
    Kitchen.logger = Kitchen.default_file_logger
    @ec2_kitchen_loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.yml')
    @ec2_kitchen_config = Kitchen::Config.new(loader: @ec2_kitchen_loader)

    namespace :base do
      desc 'Kitchen - EC2 - Linux & Windows - Base'
      task :all do
        if ENV['CI_DOES_NOT_WORK'] == 'true'
          Kitchen.logger = Kitchen.default_file_logger
          @loader = Kitchen::Loader::YAML.new(local_config: '.kitchen.ec2.yml')
          config = Kitchen::Config.new(loader: @loader)
          concurrency = config.instances.size
          queue = Queue.new
          config.instances.each { |i| queue << i }
          concurrency.times { queue << nil }
          threads = []
          concurrency.times do
            threads << Thread.new do
              instance.test(:always) while instance == queue.pop
            end
          end
          threads.map(&:join)
        end
      end
    end
  end
end

desc 'CI Integration Tests (EC2)'
task ci: %w(integration:ec2)

desc 'Default Integration Tests (Vagrant)'
task default: %w(integration:vagrant)
