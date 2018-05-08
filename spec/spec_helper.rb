require 'capybara'
require 'capybara/rspec'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = Bookmarks

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.after(:suite) do
  end
end
