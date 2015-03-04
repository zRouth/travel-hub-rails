require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'vcr'
require 'factory_girl_rails'
require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  VCR.configure do |config|
    config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
    config.hook_into :webmock
  end
end
