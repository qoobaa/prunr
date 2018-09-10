ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"


VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join("test", "fixtures", "vcr_cassettes")
  config.hook_into :webmock
end

class ActiveSupport::TestCase
  self.file_fixture_path = Rails.root.join("test", "fixtures", "files")
end
