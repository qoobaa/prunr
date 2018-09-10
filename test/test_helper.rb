ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  self.file_fixture_path = Rails.root.join("test", "fixtures", "files")
end
