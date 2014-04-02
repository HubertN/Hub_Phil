require_relative "../lib/rps.rb"



RSpec.configure do |config|
  # Configure each test to always use a new singleton instance
  config.before(:each) do
    Rps.instance_variable_set(:@db_instance, nil)
  end
end


