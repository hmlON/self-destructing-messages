require './app'
require 'capybara/dsl'
require 'timecop'

Capybara.app = App

RSpec.configure do |config|
  config.include Capybara::DSL
end
